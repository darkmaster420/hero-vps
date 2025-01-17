FROM ubuntu:latest
FROM codercom/code-server:4.0.2

ENV DEBIAN_FRONTEND=noninteractive

RUN sudo apt-get update && sudo apt-get install -y apt-transport-https

RUN sudo apt-get update && sudo apt-get install -y \
    dbus-x11 \
    sudo \ 
    bash \ 
    net-tools \
    novnc \ 
    x11vnc \ 
    xvfb \
    supervisor \ 
    xfce4 \
    gnome-shell \
    gnome-session \ 
    gdm3 \ 
    tasksel \
    ssh \
    terminator \
    git \
    nano \
    curl \
    wget \ 
    zip \
    unzip \
    falkon

COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
