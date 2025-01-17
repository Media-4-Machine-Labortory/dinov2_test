FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

RUN apt-get update -y && apt-get -y install sudo git software-properties-common python3.9 python3-pip libgl1-mesa-glx

RUN mkdir src
WORKDIR /src
RUN git clone https://github.com/Media-4-Machine-Labortory/dinov2_test.git

WORKDIR /src/dinov2_test
RUN pip3 install -r requirements.txt
RUN pip3 install -e .