# Integrated ATAC-seq Data Analysis Workshop: from Fastq to plots

# Instructors name and contact information
- Kai Hu: kai.hu@umassmed.edu
- Haibo Liu: haibo.liu@umassmed.edu
- Lihua Julie Zhu: julie.zhu@umassmed.edu

# Workshop description
ATAC-seq stands for Assay for Transposase-Accessible Chromatin using sequencing, which leverages a hyperactive transposase, namely Tn5, to cleave and tag ("tagmentation") double-strand DNA with sequencing adaptors at the same time. ATAC-seq is a faster yet more sensitive method for analyzing genome-wide chromatin accessibility. It is mostly used to determine if there are any changes regarding the open chromatin landscape between control and treatment group. For the demonstration session, this workshop focuses on the downstream post-alignment quality control analysis with the R package ATACseqQC.

## Pre-requisites
* General understanding of ATAC-seq analysis or have strong interests
* Basic knowledge of R or Python
* Familiar or have interests in the following concepts:
   * Peak calling/annotation
   * Nucleosome positioning
   * Transcription factor footprinting
* A computer that runs on Unix-like system

## Workshop participation
A mini-lecture will be given at the beginning that will cover the basics about ATAC-seq technology as well as a brief comparison to alternatives. Then, the major steps involved in ATAC-seq assay will be discussed along with the commonly practiced software tools, specifically, the usage of the package ATACseqQC for post-alignment QC will be demonstrated. Last will be a Q/A section.

## _R_ / _Bioconductor_ main packages used
* ATACseqQC [1]
* ChIPpeakAnno [2]

## Time outline
| Activity                             | Time |
|--------------------------------------|------|
| Overview of the workshop             | 2m   |
|     * Acknowledgments                |      |
|     * Agenda                         |      |
|     * Setup of demo environment      |      |
| Intro to ATAC-seq technology         | 5m   |
| A typical ATAC-seq workflow          | 3m   |
| Best practices                       | 10m  |
|     * Important steps                |      |
|     * QCs                            |      |
|     * Commonly used tools            |      |
| Downstream analysis with ATACseqQC   | 15m  |
|     * Demo datasets                  |      |
|     * Post-alignment QCs             |      |
|     * Demonstration                  |      |
| Q/A section                          | 10m  |

# Workshop goals and objectives

## Learning goals
* Be able to describe the basic ideas behind ATAC-seq
* Get familiar with the commonly practiced tools used in ATAC-seq analysis

## Learning objectives
* Get familiar with the package ATACseqQC
* Perform diagnostic plotting of ATAC-seq data

# Workshop slides, video clip, and demo codes

## Slides
* inst/vignettes/IntegratedATACseqAnalysisWorkshop2021.pdf

## Video clip
* to be added

## Demo codes
* inst/vignettes/demo.R
* inst/vignettes/demo.Rmd
* inst/vignettes/demo.html

## References
[1] https://bioconductor.org/packages/release/bioc/html/ATACseqQC.html

[2] https://bioconductor.org/packages/release/bioc/html/ChIPpeakAnno.html
