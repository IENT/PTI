ARG BASE_IMAGE=registry.git.rwth-aachen.de/jupyter/profiles/rwth-courses

FROM ${BASE_IMAGE}

RUN conda install --quiet --yes \
	'scipy==1.4.1' && \
	conda clean --all

RUN pip install --upgrade \
'git+https://git.rwth-aachen.de/jupyter/rwth-nb@v0.1.1'


RUN jupyter labextension install \
    @lckr/jupyterlab_variableinspector@0.5.0 \
    jupyterlab-rwth@0.0.1

USER root
RUN apt-get update && \
	apt-get -y install \
		lame && \
	rm -rf /var/lib/apt/lists/*


USER ${NB_USER}

# Copy workspace
COPY ./ /home/jovyan
