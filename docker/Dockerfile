FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

# RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); devtools::install('.', dependencies=TRUE, build_vignettes=TRUE, repos = BiocManager::repositories())"

# RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); install.packages('pkgbuild'); BiocManager::repositories(); devtools::install('.', dependencies=TRUE, build_vignettes=TRUE, repos = BiocManager::repositories())"

RUN Rscript -e "install.packages('devtools')"

RUN Rscript -e "install.packages('BiocManager')"
RUN Rscript -e "BiocManager::install('ATACseqQC')"
RUN Rscript -e "BiocManager::install('ChIPpeakAnno')"
RUN Rscript -e "BiocManager::install('BSgenome.Hsapiens.UCSC.hg19')"
RUN Rscript -e "BiocManager::install('TxDb.Hsapiens.UCSC.hg19.knownGene')"
RUN Rscript -e "BiocManager::install('BSgenome.Hsapiens.UCSC.hg38')"
RUN Rscript -e "BiocManager::install('TxDb.Hsapiens.UCSC.hg38.knownGene')"
RUN Rscript -e "BiocManager::install('MotifDb')"
RUN Rscript -e "BiocManager::install('motifStack')"
RUN Rscript -e "BiocManager::install('GenomicAlignments')"
RUN Rscript -e "BiocManager::install('SRAdb')"
RUN Rscript -e "install.packages('jpeg')"

RUN Rscript -e "devtools::install_github('hukai916/IntegratedATACseqAnalysisWorkshop2021')"
