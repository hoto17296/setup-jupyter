# Setup Jupyter Server
Setup Jupyter Server on Ubuntu 20.04

## Basic Setup
``` console
$ sudo apt update && sudo apt upgrade -y
$ git clone https://github.com/hoto17296/setup-jupyter-server.git setup
$ setup/setup.sh
$ sudo reboot
```

## Setup NVIDIA Driver
``` console
$ sudo apt install -y nvidia-driver-440
$ sudo reboot
```

## Setup Japanese Font
``` console
$ sudo apt install -y fonts-takao-gothic
$ echo -e "\nfont.family: TakaoPGothic" >> $(python -c 'import matplotlib as m; print(m.matplotlib_fname())')
$ rm -f ~/.cache/matplotlib/font*
```