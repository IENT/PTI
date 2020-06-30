ARG BASE_IMAGE=registry.git.rwth-aachen.de/jupyter/profiles/rwth-courses

FROM ${BASE_IMAGE}

RUN conda install --quiet --yes \
	'scipy==1.4.1' \
    'scikit-image==0.16.2' \
    'opencv==4.2.0' \
    'cython==0.29.15' && \
	conda clean --all

RUN pip install --upgrade \
'git+https://git.rwth-aachen.de/jupyter/rwth-nb'


RUN jupyter labextension install \
    @lckr/jupyterlab_variableinspector@0.5.0 \
    jupyterlab-rwth@0.0.1

USER root
RUN apt-get update && \
	apt-get -y install \
		lame \
        libgl1-mesa-glx && \
	rm -rf /var/lib/apt/lists/*


USER ${NB_USER}

# Copy workspace
COPY ./ /home/jovyan
