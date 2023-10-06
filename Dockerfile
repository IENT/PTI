ARG BASE_IMAGE=registry.git.rwth-aachen.de/jupyter/profiles/rwth-courses:latest
FROM ${BASE_IMAGE}

RUN pip install --upgrade --index-url https://download.pytorch.org/whl/cpu \
  'torch' \
  'torchvision' && \
  pip cache purge

RUN pip install --upgrade \
  'scipy' \
  'scikit-image' \
  'scikit-learn' \
  'Pillow' \
  'pandas' \
  'opencv-python' \
  'cython' && \
  pip cache purge

RUN pip install --upgrade \
  'git+https://git.rwth-aachen.de/jupyter/rwth-nb@v0.1.7' \
  'python-sofa==0.2.0' \
  'protobuf==3.15.7' && \
  pip cache purge

#RUN jupyter labextension install \
#  @lckr/jupyterlab_variableinspector@0.5.1
RUN pip install --upgrade \
  'lckr-jupyterlab-variableinspector' && \
  pip cache purge

USER root
RUN apt-get update && \
  apt-get -y install \
  lame \
  libgl1-mesa-glx \
  build-essential && \
  rm -rf /var/lib/apt/lists/*

USER ${NB_USER}

RUN pip install --upgrade \
  'git+https://github.com/stv0g/nbgitpuller@f735265f7b2a429a17a8fab70cfd3557f060640d' && \
  pip cache purge
