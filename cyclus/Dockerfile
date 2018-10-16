FROM bam241/ubuntu_18.04:latest

# CLASS
WORKDIR /root/work/app/
RUN git clone https://gitlab.in2p3.fr/BaM/CLASS.git
WORKDIR /root/work/app/CLASS/
RUN git fetch --all
RUN git checkout cyclass
RUN ./install.sh --clean --build
ENV CLASS_PATH="/root/work/app/CLASS/"
ENV CLASS_lib="/root/work/app/CLASS/lib"
ENV CLASS_include="/root/work/app/CLASS/source/include"

# CYCLUS
RUN mkdir -p /root/work/app/cyclus
WORKDIR /root/work/app/cyclus
RUN git clone https://github.com/bam241/cyclus
WORKDIR /root/work/app/cyclus/cyclus
RUN git remote add upstream https://github.com/cyclus/cyclus
RUN git fetch --all
RUN git pull
RUN git checkout hot_fix
RUN python3 install.py --clean-build -j2

# CYCAMORE
WORKDIR /root/work/app/cyclus
RUN git clone https://github.com/bam241/cycamore
WORKDIR /root/work/app/cyclus/cycamore
RUN git fetch --all
RUN git checkout parameter_uncertainty_GPS
RUN python3 install.py --clean-build -j2

# CYCLASS
WORKDIR /root/work/app/cyclus
RUN git clone https://github.com/bam241/cyclass
WORKDIR /root/work/app/cyclus/cyclass
RUN git fetch --all
RUN git checkout systematic_uncertainty
RUN python3 install.py --clean-build -j2


WORKDIR /
RUN chmod -R 777 root
RUN chmod -R 777 bin
RUN chmod -R 777 usr
#RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
#   libglib2.0-0 libxext6 libsm6 libxrender1

