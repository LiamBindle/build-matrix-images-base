ARG BASE_IMAGE
ARG BASE_IMAGE_TAG
FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG}

MAINTAINER Liam Bindle <liam.bindle@gmail.com>

ARG INSTALL_CONFIG
COPY ./${INSTALL_CONFIG}/. /
RUN ls /etc/spack && bash /compilers.sh
RUN bash /utilities.sh
ENV MODULEPATH=${MODULEPATH}:/modulefiles
ENV SPACK_ROOT=/spack
ENV PATH=${SPACK_ROOT}/bin:${PATH}