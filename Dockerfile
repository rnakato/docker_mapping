FROM rnakato/ubuntu
LABEL maintainer "Ryuichiro Nakato <rnakato@iqb.u-tokyo.ac.jp>"
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libbz2-dev \
    libz-dev \
    libncurses-dev \
    pigz \
    unzip \
    && apt-get clean

# BWA 0.7.17
COPY bwa-0.7.17.tar.bz2 bwa-0.7.17.tar.bz2
RUN tar xvfj bwa-0.7.17.tar.bz2 \
    && cd bwa-0.7.17 \
    && make \
    && rm /opt/bwa-0.7.17.tar.bz2

# Bowtie1.3.1
ADD bowtie-1.3.1-linux-x86_64.zip .
RUN unzip bowtie-1.3.1-linux-x86_64.zip \
    && rm bowtie-1.3.1-linux-x86_64.zip

# Bowtie2.4.5
ADD bowtie2-2.4.5-linux-x86_64.zip .
RUN unzip bowtie2-2.4.5-linux-x86_64.zip \
    && rm bowtie2-2.4.5-linux-x86_64.zip

# Samtools 1.15.1
COPY samtools-1.15.1.tar.bz2 samtools-1.15.1.tar.bz2
RUN tar xvfj samtools-1.15.1.tar.bz2 \
    && cd samtools-1.15.1 \
    && ./configure \
    && make && make install \
    && rm /opt/samtools-1.15.1.tar.bz2

# Chromap 0.2.1
COPY chromap-0.2.1_x64-linux.tar.bz2 chromap-0.2.1_x64-linux.tar.bz2
RUN tar xvfj chromap-0.2.1_x64-linux.tar.bz2 \
     && rm chromap-0.2.1_x64-linux.tar.bz2

ENV PATH ${PATH}:/opt:/opt/bwa-0.7.17:/opt/bowtie-1.3.1-linux-x86_64:/opt/bowtie2-2.4.5-linux-x86_64

CMD ["/bin/bash"]
