FROM public.ecr.aws/j1r0q0g6/notebooks/notebook-servers/jupyter:v1.5.0

# switch to root user for conda installation
# (only necessary when installing r-tidyverse with Kaniko)
USER root

# install - r-tidyverse
RUN conda update -y -n base conda \
 && conda install -y -q r-essentials \
 && conda update -y -q --all \
 && conda clean -a -f -y \
 && chown -R ${NB_USER}:users ${CONDA_DIR} \
 && chown -R ${NB_USER}:users ${HOME}

USER ${NB_USER}