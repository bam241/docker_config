FROM pshriwise/ubuntu_16.04_pymoab_pyne:latest

ENV HOME /root

RUN add-apt-repository ppa:jonathonf/vim -y
RUN apt-get -y update
RUN apt-get install -y \
  vim \
  ack-grep \
  zsh \
  locales

RUN locale-gen en_US.UTF-8
WORKDIR /root
RUN git clone https://github.com/Baaaaam/zsh_config.git .zsh_config
WORKDIR /root/.zsh_config
RUN git fetch
RUN git checkout docker
RUN ./install.sh
WORKDIR /root
RUN chsh -s /usr/bin/zsh root



# Define default command
CMD ["/bin/zsh"]
