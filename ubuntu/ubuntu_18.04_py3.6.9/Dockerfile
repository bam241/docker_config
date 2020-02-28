FROM ubuntu:18.04

# Ubuntu Setup
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV HOME /root
RUN apt-get update \
    && apt-get install -y --fix-missing \
            software-properties-common \
            wget \
            build-essential \
            python3-setuptools \
            python3-pip \
            python3-setuptools \
            python3-dev \
            libpython3.7-dev \
            git \
            cmake \
            vim emacs \
    && apt-get clean -y; \
            update-alternatives --install /usr/bin/python python /usr/bin/python3 10; \
            update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 10


