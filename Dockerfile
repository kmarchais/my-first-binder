

FROM jupyter/base-notebook:python-3.9.7
LABEL maintainer="PyVista Developers"
LABEL repo="https://github.com/pyvista/pyvista"

USER root
RUN apt-get update \
 && apt-get install  -yq --no-install-recommends \
    libgl1-mesa-glx \
    libfontconfig1 \
    libxrender1 \
    libosmesa6 \
 && apt-get clean && rm -rf /var/lib/apt/lists/*
USER jovyan


RUN conda install -y -c conda-forge -c cadquery -c set3mah microgen
RUN conda install -y -c conda-forge ipygany pyvista


RUN pip install jupyter_cadquery

COPY * .

WORKDIR $HOME

# allow jupyterlab for ipyvtk
ENV JUPYTER_ENABLE_LAB=yes
ENV PYVISTA_USE_IPYVTK=true

