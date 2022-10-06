ARG BASE_IMAGE=registry.git.rwth-aachen.de/jupyter/profiles/rwth-courses:latest
FROM ${BASE_IMAGE}

RUN conda install --quiet --yes \
  'python==3.7.8' && \
  conda clean --all

RUN conda install --quiet --yes \
  'scipy==1.4.1' \
  'scikit-image==0.16.2' \
  'opencv==4.2.0' \
  'scikit-learn==0.23.2' \
  'Pillow==7.2.0' \
  'pandas==1.1.3' \
  'cython==0.29.15' && \
  conda clean --all

RUN pip install --upgrade \
  'git+https://git.rwth-aachen.de/jupyter/rwth-nb@v0.1.7' \
  'tensorflow==1.15' \
  'python-sofa==0.2.0' \
  'protobuf==3.15.7'


#RUN jupyter labextension install \
#  @lckr/jupyterlab_variableinspector@0.5.1
RUN pip install --upgrade \
  'lckr-jupyterlab-variableinspector'

USER root
RUN apt-get update && \
  apt-get -y install \
  lame \
  libgl1-mesa-glx \
  build-essential && \
  rm -rf /var/lib/apt/lists/*

USER ${NB_USER}

RUN pip install --upgrade \
  'git+https://github.com/stv0g/nbgitpuller@f735265f7b2a429a17a8fab70cfd3557f060640d'
