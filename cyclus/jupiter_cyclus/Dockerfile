
FROM jupyter/minimal-notebook
USER root
RUN apt-get -y update
RUN apt-get install -y \
    software-properties-common

RUN apt-get -y update
RUN echo "US/Central" > /etc/timezone
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata &&\
    apt-get -y install \
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
    python3-pip
RUN pip3 install cython &&\
    rm -rf /usr/bin/python &&\
    ln -s /usr/bin/python3 /usr/bin/python

# CYCLUS
RUN mkdir -p /root/cyclus&&\
    cd /root/cyclus &&\
    git clone https://github.com/cyclus/cyclus &&\
    cd /root/cyclus/cyclus &&\
    python3 install.py --clean-build -j2

# CYCAMOREr
run cd /root/cyclus &&\
    git clone https://github.com/cyclus/cycamore &&\
    cd /root/cyclus/cycamore &&\
    python3 install.py --clean-build -j2

# CYMETRIC
run cd /root/cyclus &&\
    git clone https://github.com/cyclus/cymetric &&\
    cd /root/cyclus/cymetric &&\
    python3 setup.py install --user

ENV PYTHONPATH="/root/.local/lib/python3.6/site-packages"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/root/.local/lib/"
ENV PATH="root/.local/bin:$PATH"
# Define default command
CMD ["/bin/bash"]
