
FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get install -y \
    software-properties-common

RUN apt-get -y update
RUN echo "US/Central" > /etc/timezone
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
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
    g++ \
    libgoogle-perftools-dev \
    git \
    python3-dev \
    python3-tables \
    python3-pandas \
    python3-numpy \
    python3-nose \
    python3-jinja2 \
    python3-pip
RUN pip3 install cython

RUN add-apt-repository ppa:jonathonf/vim
RUN apt-get -y update
RUN apt-get install -y \
  vim \
  ack-grep \
  zsh
RUN apt-get clean && apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8
WORKDIR /root
RUN git clone https://github.com/Baaaaam/zsh_config.git .zsh_config
WORKDIR /root/.zsh_config
RUN git fetch
RUN git checkout docker
RUN ./install.sh
WORKDIR /root
RUN chsh -s /usr/bin/zsh root



# Define default command
CMD ["/bin/zsh"]
