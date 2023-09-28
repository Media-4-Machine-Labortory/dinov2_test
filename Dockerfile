FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

RUN apt-get update -y && apt-get install sudo git python3-opencv
RUN git clone https://github.com/Media-4-Machine-Labortory/dinov2_test.git
RUN cd dinov2_test
RUN pip install -r requirements.txt
RUN pip install -e .