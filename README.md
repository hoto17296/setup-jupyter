# Setup Jupyter Server
Setup Jupyter Server on Ubuntu 20.04

## Basic Setup
``` console
$ sudo apt update && sudo apt upgrade
$ sudo apt install -y git
$ git clone https://github.com/hoto17296/setup-jupyter-server.git setup
$ setup/setup.sh
$ sudo reboot
```

## Setup CUDA
``` console
$ sudo apt install -y nvidia-driver-440
$ conda install -y cudatoolkit cudnn
```