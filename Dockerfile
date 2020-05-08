ARG BASE_IMAGE=registry.git.rwth-aachen.de/jupyter/profiles/rwth-courses
FROM ${BASE_IMAGE}

RUN conda install --quiet --yes \
	'scipy==1.4.1' && \
	conda clean --all

# Copy workspace
COPY ./ /home/jovyan
