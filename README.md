# Integrated ATAC-seq Data Analysis Workshop

# Instructors name and contact information
- Kai Hu: kai.hu@umassmed.edu

# Workshop description
ATAC-seq stands for Assay for Transposase-Accessible Chromatin using sequencing, which leverages a hyperactive transposase to cleave and tag ("tagmentation") double-strand DNA with sequencing adaptors at the same time. ATAC-seq is a faster yet more sensitive method for analyzing genome-wide chromatin accessibility. It is mostly used to map nucleosome positions but can also be applied to investigate transcription factor binding sites and more. This workshop focuses on the downstream analysis (after peak calling) of ATAC-seq data including the diagnostic plotting of fragment size distribution, detection of mitochondria contamination, nucleosome positioning and TF footprinting with package ATACseqQC.

## Pre-requisites
* General understanding of ATAC-seq analysis or have strong interests
* Basic knowledge of R or Python
* Familiar or have interests in the following concepts:
   * Peak calling/annotation
   * Nucleosome positioning
   * Transcription factor footprinting
* A computer that runs on Unix-like system

## Workshop participation
A mini-lecture will be given at the beginning that will cover the basic ideas behind ATAC-seq and a brief comparison to alternatives like DNase-seq. I will then discuss the commonly used tools for ATAC-seq downstream analysis, specifically, the usage of the package ATACseqQC will be demonstrated. Last will be a Q/A section.

## _R_ / _Bioconductor_ packages used
* ATACseqQC [1]
* ChIPpeakAnno [2]
* motifStack [3]
* diffbind [4]

## Time outline
| Activity                             | Time |
|--------------------------------------|------|
| Overview of ATAC-seq                 | 3m   |
| Comparison to alternatives           | 2m   |
| Commonly used tools                  | 5m   |
|     * Peak caller                    |      |
|     * Nucleosome positioning         |      |
|     * TF footprinting                |      |
| Downstream analysis with ATACseqQC   | 10m  |
|     * Diagnostic plotting            |      |
|     * Mitochondria contamination     |      |
|     * Nucleosome positioning         |      |
|     * TF footprinting                |      |
| Hands-on demonstration               | 25m  |
| Q/A section                          | 5m   |

# Workshop goals and objectives

## Learning goals
* Describe the basic ideas behind ATAC-seq
* Get familiar with the commonly practiced tools used in ATAC-seq analysis
* Understand the main challenges regarding ATAC-seq analysis

## Learning objectives
* Get familiar with the package ATACseqQC
* Perform diagnostic plotting of ATAC-seq data
* Determine nucleosome positioning patterns
* Identify TF footprints

## References
[1] https://bioconductor.org/packages/release/bioc/html/ATACseqQC.html

[2] https://bioconductor.org/packages/release/bioc/html/ChIPpeakAnno.html

[3] https://bioconductor.org/packages/release/bioc/html/motifStack.html

[4] https://bioconductor.org/packages/release/bioc/html/DiffBind.html
