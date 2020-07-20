FROM cyclus/cyclus-deps:latest

RUN git clone https://github.com/bam241/cyclus &&\
    cd cyclus && \
    git fetch --all && \
    git checkout allow_0cap_constrain &&\
    python install.py -j2
RUN git clone --depth 1 https://github.com/bam241/cycamore -b synthetic_data &&\
    cd cycamore && \
    python install.py -j2
