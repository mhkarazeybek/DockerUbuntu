FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# # required packages
RUN apt-get update -y && apt-get install -y \
    wget \
    gnupg2 \
    lsb-release \
    ubuntu-desktop \
    xfce4-terminal \
    git \
    python3-pip \
    xrdp

RUN rm -f /run/reboot-required*

RUN useradd -m -s /bin/bash -G sudo mhkarazeybek

# # XRDP
RUN adduser xrdp ssl-cert
RUN sed -i '3 a echo "\
    export GNOME_SHELL_SESSION_MODE=ubuntu\\n\
    export XDG_SESSION_TYPE=x11\\n\
    export XDG_CURRENT_DESKTOP=ubuntu:GNOME\\n\
    export XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg\\n\
    " > ~/.xsessionrc' /etc/xrdp/startwm.sh

# RDP
EXPOSE 3389

# username & password
RUN echo "root:mhk12345" | chpasswd

WORKDIR /root/env/

# COPY runner .

CMD service dbus start; /usr/lib/systemd/systemd-logind & service xrdp start & bash