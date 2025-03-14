
FROM ubuntu:18.04

RUN mkdir -p /root/.local/lib/python3.6/site-packages/ &&\
    apt-get clean && \
    apt-get -y update && \
    apt-get install -y \
    software-properties-common && \
    apt-get -y update && \
    echo "US/Central" > /etc/timezone && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata &&\
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
    graphviz \
    python3-dev \
    python3-tables \
    python3-pandas \
    python3-numpy \
    python3-nose \
    python3-jinja2 \
    python3-notebook jupyter jupyter-core python-ipykernel \
    python3-pip && \
    pip3 install cython==0.28.5 graphviz&&\
    rm -rf /usr/bin/python &&\
    ln -s /usr/bin/python3 /usr/bin/python &&\
    add-apt-repository ppa:jonathonf/vim &&\
    apt-get -y update &&\
    apt-get install -y \
    vim \
    ack-grep \
    zsh &&\
    apt-get clean 
    
RUN mkdir -p /root/cyclus&&\
    cd /root/cyclus &&\
    git clone https://github.com/bam241/cyclus &&\
    cd /root/cyclus/cyclus &&\
    python3 install.py --clean-build -j2 && \
    cd /root/cyclus &&\
    git clone https://github.com/cyclus/cycamore &&\
    cd /root/cyclus/cycamore &&\
    python3 install.py --clean-build -j2

RUN cd root/cyclus \
    && apt-get install -y gfortran \
    && git clone https://github.com/pyne/pyne.git \
    && cd pyne \
    && python setup.py install --user

RUN cd /root/cyclus &&\
    git clone https://github.com/bam241/cycvt         &&\
    cd /root/cyclus/cycvt &&\
    git checkout fix_u8_eq &&\
    python3 install.py --clean-build -j2

RUN cd /root/cyclus &&\
    git clone https://github.com/bam241/cymetric    &&\
    cd /root/cyclus/cymetric &&\
    git checkout clean_import &&\
    python3 setup.py install --user


ENV PYTHONPATH="/root/.local/lib/python3.6/site-packages"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/root/.local/lib/"
ENV PATH="/root/.local/bin:$PATH"
# Define default command
WORKDIR "/root/opra_sims/"
ENTRYPOINT ["/usr/bin/jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
CMD ["--NotebookApp.token=abcd"]
