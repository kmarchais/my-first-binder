FROM jupyter/scipy-notebook:latest

RUN apt-get update -y \
&& apt install libgl1-mesa-glx -y

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}

# install the notebook package
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook jupyterlab

RUN conda install -c conda-forge -c cadquery -c set3mah microgen nptyping=1 -y

RUN pip install jupyter_cadquery

RUN conda install -c conda-forge ipyvtklink 


