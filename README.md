# docker_mapping

Repository of Docker image for mapping tools (based on Ubuntu 22.04)

- Ubuntu 22.04

- Perl 5.36.0 (with plenv)
- Python 3.10 (with Miniconda)
    - MACS2-2.2.9.1

- R 4.x
    - BiocManager
    - Rstudio Desktop
    - Rstudio Server

- BWA v0.7.17
- Bowtie v1.3.1
- Bowtie2 v2.5.3
- chromap v0.2.6
- Bismark v0.22.3
- SAMtools v1.19.2
- BEDtools v2.31.0
- SRAtoolkit v3.0.10
- OpenBLAS v0.3.24

## Changelog

- 2024.08
  - Updated ChIPseqTools (DROMPAplus v.1.20.0 and SSP v1.4.0)

- 2024.06
  - Installed Bismark for DNA methylation analysis
  - Updated script/build-index.sh to include Bismark

- 2024.04
  - Changed Python environment from conda to micromamba (`/opt/micromamba`)

- 2024.03.3
  - `download_genomedata.sh`: 
    - Updated the version of Ensemble data from 106 to 111.
    - Added `Medaka` genome.

- 2024.03.2
  - Added `mptable.UCSC.T2T.28mer.flen150.txt` and `mptable.UCSC.T2T.36mer.flen150.txt` in `SSP/data/mptable`.
  - Added the ideogram file for the T2T genome in `DROMPAplus/data/ideogram`.
  - Modified `download_genomedata.sh` to download the reference file of the T2T genome.
  - Updated chromap from v0.2.5 to v0.2.6

- 2024.03
  - Fixed a bug in `download_genomedata.sh` that did not download the genome data correctly.

- 2024.02.2
  - Install MS core fonts (ttf-mscorefonts-installer)

- 2024.02
  - Installed `sudo`
  - Updated Miniconda from Python 3.9 to Python 3.10
  - Updated Bowtie2 from v2.4.5 to v2.5.3
  - Updated chromap from v0.2.4 to v0.2.5

- 2024.01
  - Updated SAMtools from 1.17 to 1.19.2
  - Updated SRAtoolkit from 3.0.2 to 3.0.10
  - Change WORKDIR from /opt to /home/ubuntu

- 2023.12
  - Update ChIPseqTools (ssp v1.3.1 and drompa+ v1.18.1)

## Usage

For Docker:

    # pull docker image
    docker pull rnakato/mapping

    # execute bwa
    docker run --rm -it rnakato/mapping bwa

For Singularity:

    # build image
    singularity build -F rnakato_mapping.sif docker://rnakato/mapping
    # execute bwa
    singularity exec rnakato_mapping.sif bwa

## Build image from Dockerfile

    git clone https://github.com/rnakato/docker_mapping.git
    cd docker_mapping
    docker build -t <account>/mapping .
