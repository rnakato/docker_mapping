FROM rnakato/database:2024.04
LABEL maintainer "Ryuichiro Nakato <rnakato@iqb.u-tokyo.ac.jp>"
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt
USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libbz2-dev \
    libz-dev \
    libncurses-dev \
    pigz \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

# BWA 0.7.17
COPY bwa-0.7.17.tar.bz2 bwa-0.7.17.tar.bz2
RUN tar xvfj bwa-0.7.17.tar.bz2 \
    && cd bwa-0.7.17 \
    # const uint8_t rle_auxtab[8]; を削除: see https://github.com/lh3/bwa/issues/275
    && sed -i '33d' rle.h \
    && make \
    && rm /opt/bwa-0.7.17.tar.bz2

# BWA-MEM2
COPY bwa-mem2-2.0pre2_x64-linux.tar.bz2 bwa-mem2-2.0pre2_x64-linux.tar.bz2
RUN tar jxf bwa-mem2-2.0pre2_x64-linux.tar.bz2 \
    && rm bwa-mem2-2.0pre2_x64-linux.tar.bz2

# Bowtie1.3.1
COPY bowtie-1.3.1-linux-x86_64.zip bowtie-1.3.1-linux-x86_64.zip
RUN unzip bowtie-1.3.1-linux-x86_64.zip \
    && rm bowtie-1.3.1-linux-x86_64.zip

# Bowtie1.1.2 (for colorspace data)
COPY bowtie-1.1.2-linux-x86_64.zip bowtie-1.1.2-linux-x86_64.zip
RUN unzip bowtie-1.1.2-linux-x86_64.zip \
    && rm bowtie-1.1.2-linux-x86_64.zip

# Bowtie2.5.3
COPY bowtie2-2.5.3-linux-x86_64.zip bowtie2-2.5.3-linux-x86_64.zip
RUN unzip bowtie2-2.5.3-linux-x86_64.zip \
    && rm bowtie2-2.5.3-linux-x86_64.zip

# Chromap 0.2.6
COPY chromap-0.2.6_x64-linux.tar.bz2 chromap-0.2.6_x64-linux.tar.bz2
RUN tar xvfj chromap-0.2.6_x64-linux.tar.bz2 \
     && rm chromap-0.2.6_x64-linux.tar.bz2

COPY script/build-index.sh scripts/build-index.sh

ENV PATH ${PATH}:/opt:/opt/script:/opt/bwa-0.7.17:/opt/bowtie-1.3.1-linux-x86_64:/opt/bowtie2-2.5.3-linux-x86_64:/opt/bwa-mem2-2.0pre2_x64-linux

USER ubuntu
WORKDIR /home/ubuntu
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
