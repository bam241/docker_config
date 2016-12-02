
FROM ubuntu:14.04

RUN apt-get -y --force-yes update
RUN apt-get install -y --force-yes \
    software-properties-common python-software-properties

RUN apt-get -y --force-yes update
RUN apt-get -y --force-yes install \
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
    git
RUN apt-get -y --force-yes install \
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
    python-dev \
    python-tables \
    python-pandas \
    python-numpy \
    python-nose \
    python-jinja2 \
    cython
RUN sudo add-apt-repository ppa:jonathonf/vim
RUN apt-get -y --force-yes update
RUN apt-get install -y --force-yes \
  vim \
  ack-grep \
  zsh
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
