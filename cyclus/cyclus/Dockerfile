FROM bam241/lu_18.04:latest


# CYCLUS
RUN mkdir -p /root/work/app/cyclus&&\
    cd /root/work/app/cyclus &&\
    git clone https://github.com/cyclus/cyclus &&\
    cd /root/work/app/cyclus/cyclus &&\
    git remote add upstream https://github.com/cyclus/cyclus &&\
    git fetch --all &&\
    git pull &&\
    git checkout master &&\
    python3 install.py --clean-build -j2

# CYCAMORE
#WORKDIR /root/work/app/cyclus &&\
#    git clone https://github.com/bam241/cycamore &&\
#    cd /root/work/app/cyclus/cycamore &&\
#    git fetch --all &&\
#    git checkout parameter_uncertainty_GPS &&\
#    python3 install.py --clean-build -j2
#
## CYCLASS
#WORKDIR /root/work/app/cyclus &&\
#    git clone https://github.com/bam241/cyclass &&\
#    cd /root/work/app/cyclus/cyclass &&\
#    git fetch --all &&\
#    git checkout systematic_uncertainty &&\
#    python3 install.py --clean-build -j2
#RUN chmod -R 777 /root; chmod -R 777 /bin; chmod -R 777 /usr
#RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
#   libglib2.0-0 libxext6 libsm6 libxrender1

