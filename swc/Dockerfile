
FROM ubuntu:18.04

RUN apt-get -y update &&\
    apt-get install -y \
    software-properties-common
RUN echo "US/Central" > /etc/timezone &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt-get -y install \
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
    python3-numpy \
    python3-pip\
    wget \
    nano \
    unzip
RUN useradd -ms /bin/bash mouginot
RUN echo "PS1='$ '" >  /home/mouginot/.bashrc
WORKDIR /home/mouginot
RUN wget http://swcarpentry.github.io/shell-novice/data/data-shell.zip
RUN mkdir Desktop
run mv data-shell.zip Desktop && cd Desktop && unzip data-shell.zip && rm data-shell.zip
RUN chown -R mouginot /home/mouginot


USER mouginot
# Define default command
CMD ["/bin/bash"]
