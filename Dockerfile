FROM balenalib/aarch64-debian-node:latest
LABEL maintainer="meehog527"

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

#Update
RUN apt-get update && apt-get dist-upgrade -y

# Install Dependencies
RUN apt-get install -y --force-yes\
    git\ 
    python3\
    python3-pip\
    python3-dev\
    python-dev \
    bluetooth\ 
    bluez\
    libglib2.0-dev\
    build-essential\
    make\
 && apt-get clean


RUN git clone https://github.com/IanHarvey/bluepy.git \
&& cd bluepy \
&& python3 setup.py build \
&& python3 setup.py install 

WORKDIR /opt

RUN git clone https://github.com/meehog527/bt-mqtt-gateway.git

WORKDIR /opt/bt-mqtt-gateway

RUN pip3 install -r requirements.txt

RUN apt-get remove git -y && apt-get clean


CMD ["/opt/bt-mqtt-gateway/gateway.py","-d"]
