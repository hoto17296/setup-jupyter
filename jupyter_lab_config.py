from os import getcwd, getenv

c = get_config()

c.ServerApp.allow_root = True
c.ServerApp.ip = "0.0.0.0"
c.ServerApp.root_dir = getcwd()

if getenv("JUPYTER_TOKEN") is not None:
    c.ServerApp.token = getenv("JUPYTER_TOKEN")
