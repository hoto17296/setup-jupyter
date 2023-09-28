FROM python:3.11

RUN pip install jupyterlab

# Install basic packages
RUN pip install pandas matplotlib

# Japanese support
RUN apt update && apt install -y fonts-takao-gothic \
  && mkdir -p ~/.config/matplotlib \
  && echo 'font.family: TakaoPGothic' > ~/.config/matplotlib/matplotlibrc

# tqdm
RUN pip install ipywidgets jupyterlab_widgets tqdm

COPY jupyter_lab_config.py /etc/jupyter/

CMD ["jupyter", "lab"]