FROM python:3.11

RUN pip install jupyterlab

# Install basic packages
RUN pip install pandas matplotlib

# Code formatter
RUN pip install jupyterlab-code-formatter black isort
COPY jupyterlab_code_formatter.json /root/.jupyter/lab/user-settings/jupyterlab_code_formatter/settings.jupyterlab-settings

# tqdm
RUN pip install ipywidgets jupyterlab_widgets tqdm

# Japanese support
RUN apt update && apt install -y fonts-takao-gothic \
  && mkdir -p ~/.config/matplotlib \
  && echo 'font.family: TakaoPGothic' > ~/.config/matplotlib/matplotlibrc

COPY jupyter_lab_config.py /etc/jupyter/

CMD ["jupyter", "lab"]