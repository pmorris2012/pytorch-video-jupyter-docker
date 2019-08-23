# pytorch-video-jupyter-docker
Opens a Jupyter notebook. Contains pytorch libraries and PIMS for random video reads.

Pull from dockerhub at https://hub.docker.com/r/pmorris2012/pytorch-video-jupyter


## DOWNLOAD AND RUN CONTAINER

- [PORT]: the port the jupyter notebook server will be accessible on outside the container.
- [PATH]: The local path where your data/code is stored.
```
docker run --gpus all -it -p [PORT]:8888 -v [PATH]:/external pmorris2012/pytorch-video-jupyter
```
Go to ```localhost:[PORT]``` in your browser to access the notebook server.

## DOCKER SETUP ON UBUNTU

1. Install Nvidia graphics driver from the `ppa:graphics-drivers/ppa` repository.
- [VERSION]: the version of the nvidia driver you want to install.
```
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
ubuntu-drivers devices
sudo apt install nvidia-[VERSION]
```

2. Install docker CE using the instructions here

https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-engine---community-1

3. (Optional) Run docker with without needing root access (don't have to type sudo)
- [USER]: your username
```
sudo groupadd docker
sudo gpasswd -a [USER] docker
newgrp docker
```

4. Install the nvidia-docker runtime, and follow the instructions for use here

https://github.com/NVIDIA/nvidia-docker


