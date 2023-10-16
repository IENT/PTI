ARG BASE_IMAGE=registry.git.rwth-aachen.de/jupyter/profiles/rwth-courses:latest
FROM ${BASE_IMAGE}

RUN pip install --upgrade --index-url https://download.pytorch.org/whl/cpu \
  'torch==2.1.0+cpu' \
  'torchvision==0.16.0+cpu' && \
  pip cache purge

RUN pip install --upgrade \
  'scipy==1.11.3' \
  'scikit-image==0.22.0' \
  'scikit-learn==1.3.1' \
  'Pillow==10.0.1' \
  'pandas==2.1.1' \
  'opencv-python==4.8.1.78' \
  'cython==3.0.3' \
  'pyscreenshot==3.1' && \
  pip cache purge

RUN pip install --upgrade \
  'git+https://git.rwth-aachen.de/jupyter/rwth-nb@v0.1.8' \
  'python-sofa==0.2.0' \
  'protobuf==4.24.4' && \
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
