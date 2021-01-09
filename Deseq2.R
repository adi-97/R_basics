p#countdata <- read.table("final_RC_new.tsv", header=TRUE, row.names=NULL, sep="\t")
#countdata <- as.matrix(countdata)
#head(countdata)
condition <- factor(c(rep("Normal", 3), rep("Tumor", 3)))
countsTable <- read.table("final_RC_new.tsv",header=TRUE,sep="\t")
countsTable$Gene_names = paste(countsTable$Gene_names,1:nrow(countsTable),sep ="_")
rownames(countsTable) <- countsTable$Gene_names
countsTable <- countsTable[,-1]
head(countsTable)
#conditions <- factor(c(rep("Control",1),rep("Disarib",2)))

library(DESeq2)
coldata <- data.frame(row.names=colnames(countsTable), condition)
dds <- DESeqDataSetFromMatrix(countData=countsTable, colData=coldata, design=~condition)
dds
dds <- DESeq(dds)
png("Dispersions.png", 1000, 1000, pointsize=10)
plotDispEsts(dds, main="Dispersion plot")
dev.off()
rld <- rlogTransformation(dds)
head(assay(rld))
hist(assay(rld))
library(RColorBrewer)
(mycols <- brewer.pal(8, "Dark2")[1:length(unique(condition))])
sampleDists <- as.matrix(dist(t(assay(rld))))
library(gplots)
#png("heatmap.png", w=1000, h=1000, pointsize=10)
heatmap.2(as.matrix(sampleDists), key=F, trace="none",
          col=colorpanel(100, "black", "white"),
          ColSideColors=mycols[condition], RowSideColors=mycols[condition],
          margin=c(10, 10), main="Sample Distance Matrix")
#dev.off()

#### To plot heatmap 
vsdFull = varianceStabilizingTransformation (countsTable)
library ("RColorBrewer")
library ("gplots")
select = order (rowMeans(counts(countsTable)), decreasing=TRUE) [1:30]   #### for first 30 genes in list
hmcol =colorRampPalette(brewer.pal(9,"GnBu"))(100)
pdf("heatmap.DESeq.pdf",width=5,height=10)
heatmap.2(exprs(vsdFull)[select,],col=hmcol,trace="none",margin=c(10,6))
dev.off()

res <- results(dds)
d <- plotCounts(dds, gene=which.min(res$padj), intgroup="condition", 
                returnData=TRUE)
library("ggplot2")
png("countplot.png", 1500, 1000, pointsize=20)
ggplot(d, aes(x=condition, y=count)) + 
  geom_point(position=position_jitter(w=0.1,h=0)) + 
  scale_y_log10(breaks=c(25,100,400))
dev.off()

rld_pca <- function (rld, intgroup = "condition", ntop = 500, colors=NULL, legendpos="bottomleft", main="PCA Biplot", textcx=1, ...) {
  require(genefilter)
  require(calibrate)
  require(RColorBrewer)
  rv = rowVars(assay(rld))
  select = order(rv, decreasing = TRUE)[seq_len(min(ntop, length(rv)))]
  pca = prcomp(t(assay(rld)[select, ]))
  fac = factor(apply(as.data.frame(colData(rld)[, intgroup, drop = FALSE]), 1, paste, collapse = " : "))
  if (is.null(colors)) {
    if (nlevels(fac) >= 3) {
      colors = brewer.pal(nlevels(fac), "Paired")
    }   else {
      colors = c("black", "red")
    }
  }
  pc1var <- round(summary(pca)$importance[2,1]*100, digits=1)
  pc2var <- round(summary(pca)$importance[2,2]*100, digits=1)
  pc1lab <- paste0("PC1 (",as.character(pc1var),"%)")
  pc2lab <- paste0("PC1 (",as.character(pc2var),"%)")
  plot(PC2~PC1, data=as.data.frame(pca$x), bg=colors[fac], pch=21, xlab=pc1lab, ylab=pc2lab, main=main, ...)
  with(as.data.frame(pca$x), textxy(PC1, PC2, labs=rownames(as.data.frame(pca$x))))
  legend(legendpos, legend=levels(fac), col=colors, pch=20)
  #     rldyplot(PC2 ~ PC1, groups = fac, data = as.data.frame(pca$rld),
  #            pch = 16, cerld = 2, aspect = "iso", col = colours, main = draw.key(key = list(rect = list(col = colours),
  #                                                                                         terldt = list(levels(fac)), rep = FALSE)))
}
png("pca.png", 1000, 1000, pointsize=20)
rld_pca(rld, colors=mycols, intgroup="condition", xlim=c(-75, 35))
dev.off()

table(res$padj<0.05)
## Order by adjusted p-value
res <- res[order(res$padj), ]
## Merge with normalized count data
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds, normalized=TRUE)), by="row.names", sort=FALSE)
names(resdata)[1] <- "Gene"
head(resdata)
## Write results
write.csv(resdata, file="DeSEq2.csv")
maplot <- function (res, thresh=0.05, labelsig=TRUE, textcx=1, ...) {
  with(res, plot(baseMean, log2FoldChange, pch=20, cex=.5, log="x", ...))
  with(subset(res, padj<thresh), points(baseMean, log2FoldChange, col="red", pch=20, cex=1.5))
  if (labelsig) {volcanoplot <- function (res, lfcthresh=2, sigthresh=0.05, main="Volcano Plot", legendpos="bottomright", labelsig=TRUE, textcx=1, ...) {
  with(res, plot(log2FoldChange, -log10(pvalue), pch=20, main=main, ...))
  with(subset(res, padj<sigthresh ), points(log2FoldChange, -log10(pvalue), pch=20, col="red", ...))
  with(subset(res, abs(log2FoldChange)>lfcthresh), points(log2FoldChange, -log10(pvalue), pch=20, col="blue", ...))
  with(subset(res, padj<sigthresh & abs(log2FoldChange)>lfcthresh), points(log2FoldChange, -log10(pvalue), pch=20, col="green", ...))
  if (labelsig) {
    require(calibrate)
    with(subset(res, padj<sigthresh & abs(log2FoldChange)>lfcthresh), textxy(log2FoldChange, -log10(pvalue), labs=Gene, ...))
  }
  legend(legendpos, xjust=1, yjust=1, legend=c(paste("FDR<",sigthresh,sep=""), paste("|LogFC|>",lfcthresh,sep=""), "both"), pch=20, col=c("red","orange","green"))
}
png("volcanoplot.png", 1200, 1000, pointsize=20)
volcanoplot(resdata, lfcthresh=2, sigthresh=0.05, textcx=.3)
dev.off()
    require(calibrate)
    with(subset(res, padj<thresh), textxy(baseMean, log2FoldChange, labs=Gene))
  }
}
png("maplot.png", 1500, 1000, pointsize=20)
maplot(resdata, main="MA Plot")
dev.off()

