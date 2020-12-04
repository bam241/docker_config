FROM cyclus/cymetric:latest

RUN pip install jupyterlab 
WORKDIR /root
RUN mkdir cyclus
RUN mv /cyclus cyclus/
RUN mv /cycamore cyclus/
RUN mv /cymetric cyclus/
RUN git clone https://github.com/bam241/cycstub_test ./cyclus/cycstub_test
ENV LD_LIBRARY_PATH=/root/.local/lib
