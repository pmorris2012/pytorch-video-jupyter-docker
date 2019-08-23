FROM nvidia/cuda:10.0-cudnn7-devel

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y python3-dev python3-pip git g++ wget make libopencv-dev

RUN pip3 install numpy scipy matplotlib ipython jupyter pandas sympy nose
RUN pip3 install opencv-python 

RUN pip3 install torch torchvision

#PIMS dependencies

RUN pip3 install slicerator
RUN pip3 install imageio
RUN pip3 install scikit-image

RUN apt-get install -y python-dev pkg-config
RUN apt-get install -y \
    libavformat-dev libavcodec-dev libavdevice-dev \
    libavutil-dev libswscale-dev libswresample-dev libavfilter-dev

RUN pip3 install --upgrade av

#install PIMS
RUN pip3 install https://github.com/soft-matter/pims/archive/master.zip

#make the directory where external files will be mounted
WORKDIR /external

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents
# kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
