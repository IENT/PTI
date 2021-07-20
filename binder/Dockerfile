ARG BASE_IMAGE=jupyter/minimal-notebook:e255f1aa00b2
FROM ${BASE_IMAGE}

RUN pip install \
	'jupyterlab_iframe==0.2.2' \
	'git+https://github.com/stv0g/nbgitpuller@f735265f7b2a429a17a8fab70cfd3557f060640d' \
	'rwth-nb==0.1.7'

RUN conda install --name base --no-update-deps \
		'conda==4.9.2' && \
	conda install --name base --quiet --yes --no-update-deps \
		'jupyterlab-git==0.20.0' \
		'ujson==2.0.3' \
		'ipywidgets==7.5.1' \
		'ipympl==0.5.6' \
		'matplotlib-base==3.2.1' \
		'jupyterlab_latex==2.0.0' \
	  'scipy==1.4.1' \
    'scikit-image==0.16.2' \
    'opencv==4.2.0' \
	  'scikit-learn==0.23.2' \
	  'Pillow==7.2.0' \
	  'pandas==1.1.3' \
    'cython==0.29.15' && \
	conda clean --all
	
# Basic Backend extensions
RUN jupyter serverextension enable --sys-prefix --py \
	jupyterlab_iframe \
	jupyterlab_latex \
	nbgitpuller

# Basic Frontend extensions
RUN jupyter labextension install \
	@jupyterlab/hub-extension@2.0.3 \
	@jupyterlab/toc@4.0.0 \
	@jupyter-widgets/jupyterlab-manager@2 \
	jupyter-matplotlib@0.7.2 \
	jupyterlab-drawio@0.7.0 \
	jupyterlab_filetree@0.2.2 \
	jupyterlab_iframe@0.2.2 \
	jupyterlab-rwth@0.0.1 \
	@jupyterlab/latex@2.0.1


RUN pip install --upgrade \
'git+https://git.rwth-aachen.de/jupyter/rwth-nb@v0.1.4' \
'tensorflow==1.15' \
'python-sofa==0.2.0'

RUN jupyter labextension install \
    @lckr/jupyterlab_variableinspector@0.5.1

USER root

# Use RWTH Mirror
#RUN sed -i 's|http://archive.ubuntu.com|http://ftp.halifax.rwth-aachen.de|g' /etc/apt/sources.list

RUN apt-get update && \
	apt-get -y install \
		language-pack-de \
		texlive-latex-recommended \
		openssh-client \
		lame \
    libgl1-mesa-glx && \
	rm -rf /var/lib/apt/lists/*

# Add more locales
RUN locale-gen de_DE && \
	locale-gen de_DE.UTF-8 && \
	update-locale

USER ${NB_USER}

ENV JUPYTER_ENABLE_LAB=yes
