FROM jupyter/base-notebook:python-3.9.7

USER root

# RUN apt-get update -y && \
#     apt install --no-install-recommends libgl1-mesa-glx -y && \
#     rm -rf /var/lib/apt/lists/*
    
RUN apt-get update \
 && apt-get install  -yq --no-install-recommends \
    libfontconfig1 \
    libxrender1 \
    libosmesa6 \
    git \
 && apt-get clean && rm -rf /var/lib/apt/lists/*
    
    

# RUN conda install -c conda-forge -c cadquery -c set3mah microgen -y

# RUN pip install jupyter_cadquery

RUN pip install git+https://github.com/Kitware/ipyvtklink

# Install PyVista's custom VTK wheel
RUN pip install https://github.com/pyvista/pyvista-wheels/raw/main/vtk-osmesa-9.1.0-cp39-cp39-linux_x86_64.whl

# allow jupyterlab for ipyvtk
ENV JUPYTER_ENABLE_LAB=yes
ENV PYVISTA_USE_IPYVTK=true

USER jovyan
WORKDIR $HOME

COPY . ${HOME}


