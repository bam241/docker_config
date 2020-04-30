FROM cyclus/cyclus-deps:latest

RUN git clone https://github.com/bam241/cyclus
WORKDIR cyclus
RUN git fetch --all
RUN git checkout allow_0cap_constrain
RUN python install.py -j2
RUN git clone --depth 1 https://github.com/bam241/cycamore -b synthetic_data
WORKDIR cycamore
RUN python install.py -j2
