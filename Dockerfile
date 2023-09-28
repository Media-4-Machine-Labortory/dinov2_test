FROM ubuntu:22.04

RUN curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
RUN apt-get update -y && apt-get -y install sudo git software-properties-common python3.9 python3-pip nvidia-container-toolkit

RUN mkdir src
WORKDIR /src
RUN git clone https://github.com/Media-4-Machine-Labortory/dinov2_test.git

WORKDIR /src/dinov2_test
RUN pip3 install -r requirements.txt
RUN pip3 install -e .