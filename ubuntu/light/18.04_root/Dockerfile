FROM ubuntu:18.04

RUN echo "US/Central" > /etc/timezone &&\
    apt-get -y update &&\
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
    tzdata \
    git \
    cmake \
    make \
    libboost-all-dev \
    libxml2-dev \
    libxml++2.6-dev \
    libsqlite3-dev \
    libhdf5-serial-dev \
    libbz2-dev \
    coinor-libcbc-dev \
    coinor-libcoinutils-dev \
    coinor-libosi-dev \
    coinor-libclp-dev \
    coinor-libcgl-dev \
    libblas-dev \
    liblapack-dev \
    qtbase5-dev \
    g++ \
    libgoogle-perftools-dev \
    git \
    python3-dev \
    python3-tables \
    python3-pandas \
    python3-numpy \
    python3-nose \
    python3-jinja2 \
    python3-pip \
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
    libqt4-dev \
    wget &&\
    rm -rf /var/lib/apt/lists/*  &&\
    pip3 install cython &&\
    rm -rf /usr/bin/python &&\
    ln -s /usr/bin/python3 /usr/bin/python &&\
    cd /root &&\
    mkdir -p /root/work/app/ &&\
    cd /root/work/app && \
    wget https://root.cern.ch/download/root_v6.14.00.source.tar.gz &&\
    tar -xvf root_v6.14.00.source.tar.gz &&\
    cd /root/work/app/root-6.14.00 &&\
    mkdir bld &&\
    cd /root/work/app/root-6.14.00/bld/ &&\
    cmake ..; cmake --build . --target VDT &&\
    cmake --build . --target install &&\
    /bin/bash -c "source /usr/local/bin/thisroot.sh" &&\
    cd /root/work/app &&\
    rm -rf root*


# Define default command
CMD ["/bin/zsh"]
