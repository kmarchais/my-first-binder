FROM conda/miniconda3

RUN conda update -n base -c defaults conda

RUN apt-get update -y \
&& apt install libgl1-mesa-glx -y

RUN conda install -c conda-forge -c cadquery -c set3mah microgen nptyping=1 -y

RUN pip install jupyter_cadquery

RUN conda install -c conda-forge ipyvtklink 

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
