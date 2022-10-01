# docker_mapping

Repository of Docker image for mapping tools (based on Ubuntu 20.04)

# Latest version (2022.10)
- BWA version 0.7.17
- Bowtie version 1.3.1
- Bowtie2 version 2.4.5
- chromap version 0.2.1
- Samtools version 1.15.1

## Run

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

## Contact

Ryuichiro Nakato: rnakato AT iqb.u-tokyo.ac.jp
