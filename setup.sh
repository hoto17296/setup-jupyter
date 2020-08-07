#!/bin/bash -eu

DIR=$(cd $(dirname $0); pwd)

# Install Dependencies
sudo apt install -y wget ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1
sudo apt clean

# Install Anaconda
wget -q https://repo.anaconda.com/archive/Anaconda3-${ANACONDA3_VERSION:-2020.07}-Linux-x86_64.sh -O anaconda.sh
sudo /bin/bash anaconda.sh -b -p /opt/conda
rm anaconda.sh
sudo find /opt/conda/ -follow -type f -name '*.a' -delete
sudo find /opt/conda/ -follow -type f -name '*.js.map' -delete
sudo /opt/conda/bin/conda clean -afy

# Anaconda Settings
sudo ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
echo ". /opt/conda/etc/profile.d/conda.sh" >> ${HOME}/.bashrc
echo "conda activate base" >> ${HOME}/.bashrc

# Jupyter Settings
sudo mkdir /Notebooks
sudo chown ${USER}:${USER} /Notebooks
mkdir ${HOME}/.jupyter
cp ${DIR}/jupyter_notebook_config.py ${HOME}/.jupyter
sudo cp ${DIR}/jupyter.service /etc/systemd/system
sudo systemctl enable jupyter