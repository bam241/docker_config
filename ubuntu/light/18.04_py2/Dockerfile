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
    python-dev \
    python-tables \
    python-pandas \
    python-numpy \
    python-nose \
    python-jinja2 \
    python-pip \
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
    pip install cython


# Define default command
CMD ["/bin/zsh"]
