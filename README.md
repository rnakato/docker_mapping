# docker_mapping

Repository of Docker image for mapping tools (based on Ubuntu 24.04)

- Ubuntu 24.04

- Perl 5.42.3 (with plenv)
- Python 3.10 (with micromamba)
    - MACS3 v3.0.4

- R 4.6.1
    - Bioconductor 3.23
    - BiocManager
    - Rstudio Desktop
    - Rstudio Server

- BWA v0.7.17
- BWA-MEM2 v2.3
- Bowtie v1.3.1
- Bowtie v1.1.2 (``/opt/bowtie-1.1.2``, not in ``PATH``)
- Bowtie2 v2.5.4
- chromap v0.3.2
- Bismark v0.22.3
- minimap2 v2.30
- SAMtools v1.24
- BEDtools v2.31.1
- SRAtoolkit v3.4.1
- OpenBLAS v0.3.24

## Changelog

- 2026.09
  - Changed the base image to ``rnakato/database:2026.09``, which moves from Ubuntu 22.04 to Ubuntu 24.04
  - Following the base image update:
    - Updated R from 4.6.0 to 4.6.1
    - Updated Perl from 5.36.0 to 5.42.3
    - Updated SAMtools from 1.22.1 to 1.24
    - Updated BEDtools from 2.31.0 to 2.31.1
    - Updated MACS2 v2.2.9.1 to MACS3 v3.0.4
    - Updated edirect from 26.0 to 26.2
    - Updated BWA-MEM2 from 2.0pre2 to 2.3.
      - Note that ``bwa-mem2 version`` and the ``@PG`` line of the output SAM report ``2.2.1``, because upstream did not update the version string for the 2.3 release.

- 2026.07
  - Bug fix in ``parseGtftorefFlat.sh`` that did not create the refFlat file correctly when gene names contain spaces.
  - Bug fix in ``download_genomedata.sh`` where the RepeatMasker.txt.gz was not downloaded successfully
  - Added the repeatmasker file for the following genomes:
    - Mus_musculus.GRCm39
    - Rattus_norvegicus.GRCr8
    - Danio_rerio.GRCz11
    - Gallus_gallus.GRCg6a
    - Xenopus_tropicalis.xenLae2
    - Drosophila_melanogaster.BDGP6
    - Caenorhabditis_elegans.WBcel235

- 2026.06
  - Added ``download_Ecoli.sh`` and ``download_Lambdaphage.sh``.
  - Updated SRA Toolkit from 3.2.1 to v3.4.1
  - Updated SAMtools from 1.21 to 1.22.1
  - Added ``paftools.js`` and ``k8`` in minimap2
  - Added [edirect](https://manpages.debian.org/testing/ncbi-entrez-direct/edirect.1.en.html)
  - Added ``isnumber.sh``
  - Updated Bioconductor 3.22 to 3.23

- 2026.04
  - Added minimap2 again

- 2026.03
  - Updated chromap from v0.3.0 to v0.3.2
  - Added `download_RPE1.sh` to download the RPE1 genome data.
  - Added [pfastq-dump](https://github.com/inutano/pfastq-dump) (a bash implementation of parallel-fastq-dump)  and removed parallel-fastq-dump
  - Bug fix: lost path to sratoolkit 3.2.1 in PATH

- 2025.07
  - `download_genomedata.sh`: Added `T2T-mhaESC` genome (T2T for mouse)
  - Added minimap2 v2.30-r1287
  - Update ChIPseqTools (DROMPAplus v.1.20.1)
  - Updated bowtie2 from 2.5.3 to 2.5.4

- 2025.06
  - Updated chromap from 0.2.6 to 0.3.0

- 2024.10
  - Updated SAMtools from 1.19.2 to 1.21
  - Updated SRA Toolkit from 3.0.10 to v3.1.1
  - Added [parallel-fastq-dump](https://github.com/rvalieris/parallel-fastq-dump)
  - Added `Arabidopsis thaliana` genome (TAIR10) in `download_genomedata.sh`.

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

For Apptainer:

    # build image
    apptainer build -F rnakato_mapping.sif docker://rnakato/mapping
    # execute bwa
    apptainer exec rnakato_mapping.sif bwa

## Build image from Dockerfile

    git clone https://github.com/rnakato/docker_mapping.git
    cd docker_mapping
    docker build -t <account>/mapping .
