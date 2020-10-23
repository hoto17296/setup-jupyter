#!/bin/bash -eu

# Install Dependencies
sudo apt install -y wget ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1
sudo apt clean

# Install Anaconda
CONDA_PATH=${HOME}/anaconda3
wget -q https://repo.anaconda.com/archive/Anaconda3-${ANACONDA3_VERSION:-2020.07}-Linux-x86_64.sh -O anaconda.sh
bash anaconda.sh -b -p ${CONDA_PATH}
rm -f anaconda.sh
echo ". ${CONDA_PATH}/etc/profile.d/conda.sh" >> ${HOME}/.bashrc
echo "conda activate base" >> ${HOME}/.bashrc

# Jupyter Settings
SCRIPT_DIR=$(cd $(dirname $0); pwd)
mkdir ${HOME}/Notebooks
mkdir ${HOME}/.jupyter
sed -e "s|{{HOME}}|${HOME}|" ${SCRIPT_DIR}/jupyter_notebook_config.py > ${HOME}/.jupyter/jupyter_notebook_config.py
sed -e "s|{{USER}}|${USER}|" ${SCRIPT_DIR}/jupyter.service | sudo tee /etc/systemd/system/jupyter.service > /dev/null
sudo systemctl enable jupyter
