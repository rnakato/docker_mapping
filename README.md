# docker_mapping

Repository of Docker image for mapping tools (based on Ubuntu 22.04)

- Ubuntu 22.04

- GPU mode (cuda:11.8.0-cudnn8-runtime)
   - CUDA 11.8
   - cudnn 8

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
- chromap v0.2.5
- SAMtools v1.19.2
- BEDtools v2.31.0
- SRAtoolkit v3.0.10
- OpenBLAS v0.3.24

## Changelog

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
