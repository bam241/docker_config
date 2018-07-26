FROM bam241/ubuntu_18.04:latest


RUN mkdir cyclus
WORKDIR cyclus
RUN git clone https://github.com/FlanFlanagan/cyclus
WORKDIR /root/cyclus/cyclus
RUN git remote add upstream https://github.com/cyclus/cyclus
RUN git fetch --all
RUN git pull
RUN git checkout time_series
RUN python3 install.py --clean-build -j2

#WORKDIR /root/cyclus
#RUN git clone https://github.com/bam241/cycamore
#WORKDIR /root/cyclus/cycamore
#RUN git fetch --all
#RUN git pull
#RUN python3 install.py --clean-build -j2

#RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
#   libglib2.0-0 libxext6 libsm6 libxrender1

