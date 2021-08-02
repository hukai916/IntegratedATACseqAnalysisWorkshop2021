# Load required package:
library(ATACseqQC)
library(TxDb.Hsapiens.UCSC.hg38.knownGene)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(BSgenome.Hsapiens.UCSC.hg38)
library(GenomicAlignments)
library(ChIPpeakAnno)
library(MotifDb)
library(jpeg)

# Demo I: assessing mapping status
	# Load datasets:
bam_good <- system.file("vignettes/extdata", "SRR891270.chr20.full.bam", package = "IntegratedATACseqAnalysisWorkshop2021")
bam_bad <- system.file("vignettes/extdata", "SRR5800802.chr20.full.bam", package = "IntegratedATACseqAnalysisWorkshop2021")
	
	# good dataset:
res_bamQC_good <- bamQC(bam_good, outPath=NULL)
head(res_bamQC_good)

# Demo II: assessing sequencing depth and library complexity
estimateLibComplexity(readsDupFreq(bam_good))
#saturationPlot(macs2_peak_file, subsamplingSizes) # you need called peak files from MACS2 as input

# Demo III: assessing insert size distribution
	# good dataset:
bam_good_label <- gsub(".full.bam", "", basename(bam_good))
fragSize <- fragSizeDist(bam_good, bam_good_label)
	# bad dataset:
bam_bad_label <- gsub(".full.bam", "", basename(bam_bad))
fragSize <- fragSizeDist(bam_bad, bam_bad_label)

# Demo IV: assessing similarities of replicates
bamfiles <- dir(system.file("extdata", package="ATACseqQC", mustWork=TRUE), "*.bam$", full.name=TRUE)
gals <- lapply(bamfiles, function(bamfile) { 
	readBamFile(bamFile=bamfile, which=GRanges("chr1", IRanges(1, 1e6)), asMates=FALSE) })
plotCorrelation(GAlignmentsList(gals), transcripts(TxDb.Hsapiens.UCSC.hg19.knownGene), seqlev="chr1")

# Demo V: shifting aligned reads
	# good dataset:
gal_good <- readBamFile(bam_good, asMates = TRUE)
gal1_good <- shiftGAlignmentsList(gal_good, outbam = "shifted_good.bam")
head(gal1_good)
	# bad dataset:
gal_bad <- readBamFile(bam_bad, asMates = TRUE)
gal1_bad <- shiftGAlignmentsList(gal_bad, outbam = "shifted_bad.bam")
head(gal1_bad)

# Demo VI: splitting bam file into bins
txs <- transcripts(TxDb.Hsapiens.UCSC.hg38.knownGene)
	# good data:
obj_split_good <- splitGAlignmentsByCut(gal1_good, txs=txs, genome="Hsapiens", outPath = "split_bam_good")
	# bad data:
obj_split_bad <- splitGAlignmentsByCut(gal1_bad, txs=txs, genome="Hsapiens", outPath = "split_bam_bad")
dir("split_bam_good")

# Demo VII: plotting aggregate signals around TSSs
	# good dataset:
bam_good_nuc <- file.path("split_bam_good", c("NucleosomeFree.bam", "mononucleosome.bam", "dinucleosome.bam", "trinucleosome.bam"))
		# find TSS coordinates:
TSS <- unique(promoters(txs, upstream=0, downstream=1))
		# estimate the library size for normalization:
librarySize <- estLibSize(bam_good_nuc)
		# calculate the signals around TSSs:
sigs <- enrichedFragments(gal = obj_split_good[c("NucleosomeFree", "mononucleosome", "dinucleosome", "trinucleosome")], TSS=TSS, librarySize=librarySize, TSS.filter=0.5, n.tile = 101, upstream = 1010, downstream = 1010)
		# log2 transform the signals:
sigs.log2 <- lapply(sigs, function(.ele) log2(.ele+1))
		# plot heatmap:
featureAlignedHeatmap(sigs.log2, reCenterPeaks(TSS, width=2020), zeroAt=.5, n.tile=101)
		# density plot:
featureAlignedDistribution(sigs.log2, reCenterPeaks(TSS, width=2020), zeroAt=.5, n.tile=101)

	# bad dataset:
bam_bad_nuc <- file.path("split_bam_bad", c("NucleosomeFree.bam", "mononucleosome.bam", "dinucleosome.bam", "trinucleosome.bam"))
librarySize <- estLibSize(bam_bad_nuc)
sigs <- enrichedFragments(gal = obj_split_bad[c("NucleosomeFree", "mononucleosome", "dinucleosome", "trinucleosome")], TSS=TSS, librarySize=librarySize, TSS.filter=0.5, n.tile = 101, upstream = 1010, downstream = 1010)
sigs.log2 <- lapply(sigs, function(.ele) log2(.ele+1))
featureAlignedHeatmap(sigs.log2, reCenterPeaks(TSS, width=2020), zeroAt=.5, n.tile=101)
featureAlignedDistribution(sigs.log2, reCenterPeaks(TSS, width=2020), zeroAt=.5, n.tile=101)

# Demo VIII: streamlining IGV snapshots
	# load the required R code:
source(system.file("extdata", "IGVSnapshot.R", package = "ATACseqQC"))
	# need to have IGV installed first
# IGVSnapshot(maxMem="lm", genomeBuild = "hg38", 
#           bamFileFullPathOrURLs = bam_good_nuc, 
#           geneNames = c("PQLC2", "MINOS1"))

# Demo IX: assessing DNA-binding factor footprints
	# get the CTCF motif info:
CTCF <- query(MotifDb, c("CTCF"))
CTCF <- as.list(CTCF)
head(CTCF[[1]], digits=2)
	# good dataset:
factorFootprints("shifted_good.bam", pfm=CTCF[[1]], genome=Hsapiens, min.score="90%", upstream=100, downstream=100)
	# bad dataset:
factorFootprints("shifted_bad.bam", pfm=CTCF[[1]], genome=Hsapiens, min.score="90%", upstream=100, downstream=100)
