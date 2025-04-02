FROM ubuntu:24.04 AS ubuntu_24.04-deps

# Install OpenMC dependencies
RUN apt update && \
    apt install --yes --no-install-recommends \
                git \
                ca-certificates \
                make \
                cmake \
                g++ \
                clang \
                gfortran \
                python3 \
                libpython3-dev \
                python3-pip \
                zlib1g-dev \
                libeigen3-dev && \
                apt-get clean && rm -rf /var/lib/apt/lists/*;

ENV HOME_DIR="/root"
ENV SRC_DIR="/root/src"
ENV BLD_DIR="/root/bld"
ENV INSTALL_DIR="/root/.local"

ENV HDF5_VERSION=1.14.6
ENV HDF5_SRC_DIR=${SRC_DIR}/hdf5
ENV HDF5_BLD_DIR=${BLD_DIR}/hdf5

RUN mkdir -p ${HDF5_BLD_DIR}/build && \
    cd ${HDF5_BLD_DIR} && \
    git clone -b hdf5_${HDF5_VERSION} --depth 1 https://github.com/HDFGroup/hdf5.git ${HDF5_SRC_DIR} && \
    cmake ${HDF5_SRC_DIR} \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} \
        -DBUILD_SHARED_LIBS=ON && \
    make -j${CI_JOBS} && \
    make install && \
    cd && \
    rm -rf ${HDF5_BLD_DIR} ${HDF5_SRC_DIR} 

FROM ubuntu_24.04-deps AS ubuntu_24.04-moab

ENV MOAB_VERSION=5.4.1
ENV MOAB_SRC_DIR=${SRC_DIR}/moab
ENV MOAB_BLD_DIR=${BLD_DIR}/moab

RUN mkdir -p ${MOAB_BLD_DIR} && \
    cd ${MOAB_BUILD_DIR} && \
    git clone -b ${MOAB_VERSION} --depth 1 https://bitbucket.org/fathomteam/moab.git ${MOAB_SRC_DIR} && \
    cmake ${MOAB_SRC_DIR} \
        -DCMAKE_INSTALL_RPATH=${INSTALL_DIR}/lib:${INSTALL_DIR}/lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_HDF5=ON \
        -DHDF5_ROOT=${INSTALL_DIR} \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} \
        -DENABLE_BLASLAPACK=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DENABLE_FORTRAN=OFF \
        -DENABLE_PYMOAB=OFF && \
    make -j${CI_JOBS} && \
    make install && \
    cd && \
    rm -rf ${MOAB_BUILD_DIR} ${MOAB_SRC_DIR}


FROM ubuntu_24.04-moab AS ubuntu_24.04-dagmc

ENV DAGMC_VERSION=develop
ENV DAGMC_SRC_DIR=${SRC_DIR}/dagmc
ENV DAGMC_BLD_DIR=${BLD_DIR}/dagmc

RUN git clone -b ${DAGMC_VERSION} --depth 1 https://github.com/svalinn/DAGMC.git ${DAGMC_SRC_DIR} && \
    cd ${DAGMC_SRC_DIR} && \
    git submodule update --init && \
    mkdir -p ${DAGMC_BLD_DIR} && \
    cd ${DAGMC_BLD_DIR} && \
    cmake ${DAGMC_SRC_DIR} \
        -DMOAB_DIR=${INSTALL_DIR} \
        -DBUILD_CI_TESTS=ON \
        -DBUILD_MW_REG_TESTS=OFF \
        -DBUILD_STATIC_EXE=OFF \
        -DBUILD_STATIC_LIBS=OFF \
        -DCMAKE_Fortran_COMPILER=gfortran \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} && \
    make -j${CI_JOBS} && \
    make install && \
    cd && \
    rm -rf ${DAGMC_BLD_DIR} ${DAGMC_SRC_DIR}

FROM ubuntu_24.04-dagmc AS ubuntu_24.04-openmc

ENV OPENMC_VERSION=v0.15.1
ENV OPENMC_SRC_DIR=${SRC_DIR}/openmc
ENV OPENMC_BLD_DIR=${BLD_DIR}/openmc

RUN git clone -b ${OPENMC_VERSION} https://github.com/openmc-dev/openmc ${OPENMC_SRC_DIR} && \
    mkdir -p ${OPENMC_BLD_DIR} && \
    cd ${OPENMC_SRC_DIR} && \
    cmake ${OPENMC_SRC_DIR} \
        -DMOAB_DIR=${INSTALL_DIR} \
        -DBUILD_CI_TESTS=ON \
        -DBUILD_MW_REG_TESTS=OFF \
        -DBUILD_STATIC_EXE=OFF \
        -DBUILD_STATIC_LIBS=OFF \
        -DCMAKE_Fortran_COMPILER=gfortran \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} &&\
    make -j${CI_JOBS} && \
    make install &&\    
    cd ${OPENMC_SRC_DIR} &&\
    pip install . --break-system-packages && \
    cd && \
    rm -rf ${OPENMC_BLD_DIR} ${OPENMC_SRC_DIR}
