FROM bam241/ubuntu_18.04:latest

# CYCLUS
RUN mkdir cyclus
WORKDIR cyclus
RUN git clone https://github.com/bam241/cyclus
WORKDIR /root/cyclus/cyclus
RUN git remote add upstream https://github.com/cyclus/cyclus
RUN git fetch --all
RUN git pull
RUN python3 install.py --clean-build -j2


# CYCAMORE
WORKDIR /root/cyclus
RUN git clone https://github.com/bam241/cycamore
WORKDIR /root/cyclus/cycamore
RUN git fetch --all
RUN git pull
RUN python3 install.py --clean-build -j2

# ROOT
WORKDIR /root
RUN apt-get -y install \
    dpkg-dev \
    gcc \
    binutils \
    libx11-dev \
    libxpm-dev \
    libxft-dev \
    libxext-dev \
    gfortran \
    libssl-dev \
    libpcre3-dev \
    xlibmesa-glu-dev \
    libglew1.5-dev \
    libftgl-dev \
    libmysqlclient-dev \
    libfftw3-dev \
    libcfitsio-dev \
    graphviz-dev \
    libavahi-compat-libdnssd-dev \
    libldap2-dev \
    libkrb5-dev \
    libgsl0-dev \
    libqt4-dev

RUN apt-get install -y wget
RUN wget https://root.cern.ch/download/root_v6.14.00.source.tar.gz
RUN tar -xvf root_v6.14.00.source.tar.gz
WORKDIR /root/root-6.14.00
RUN mkdir bld
WORKDIR /root/root-6.14.00/bld/
RUN cmake ..
RUN cmake --build . --target VDT
RUN cmake --build . --target install


# CLASS
WORKDIR /root
RUN git clone https://gitlab.in2p3.fr/BaM/CLASS.git
WORKDIR /root/CLASS/
RUN git remote add upstream https://gitlab.in2p3.fr/SENS/CLASS.git
RUN git fetch --all
RUN git checkout cyclass
RUN ./install.sh --clean --build


#RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
#   libglib2.0-0 libxext6 libsm6 libxrender1

