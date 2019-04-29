
FROM jupyter/minimal-notebook
USER root
#
# apt packages
#
RUN apt-get update && \
    apt-get install -y g++ gcc vim nano && \
    apt-get clean

RUN apt-get -y update
RUN echo "US/Central" > /etc/timezone
#remove pinned version of python
RUN echo "tini 0.18.0" > /opt/conda/conda-meta/pinned 

# install cyclus deps
RUN conda install -y openssh gxx_linux-64 gcc_linux-64 cmake make docker-pycreds git xo python-json-logger \
	                     python=3.6 glibmm glib=2.56 libxml2 libxmlpp libblas \
	                     libcblas liblapack pkg-config coincbc=2.9 boost-cpp hdf5 \
	                     sqlite pcre gettext bzip2 xz setuptools nose pytables \
	                     pandas jinja2 cython websockets pprintpp &&\
    conda clean -y --all

# CYCLUS
RUN mkdir -p /root/cyclus&&\
    cd /root/cyclus &&\
    git clone https://github.com/bam241/cyclus &&\
    cd /root/cyclus/cyclus &&\
    git fetch --all &&\
    git checkout fix_conda &&\
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
