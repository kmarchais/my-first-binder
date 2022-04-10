FROM continuumio/miniconda3

RUN apt-get update -y \
&& apt install libgl1-mesa-glx -y

RUN adduser myuser
USER myuser
WORKDIR /home/myuser

# Make sure the contents of our repo are in ${HOME}
COPY . /home/myuser

# install the notebook package
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook jupyterlab

RUN conda install -c conda-forge -c cadquery -c set3mah microgen nptyping=1 -y

RUN pip install jupyter_cadquery

RUN conda install -c conda-forge ipyvtklink 


