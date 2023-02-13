FROM ubuntu:18.04

RUN apt-get update -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install ubuntu-desktop -y
RUN rm /run/reboot-required*

RUN apt-get update -y
RUN apt-get install xrdp -y
RUN adduser xrdp ssl-cert

RUN sed -i '3 a echo " export GNOME_SHELL_SESSION_MODE=ubuntu\\n export XDG_SESSION_TYPE=x11\\nexport XDG_CURRENT_DESKTOP=ubuntu:GNOME\\nexport XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg\\n\" > ~/.xsessionrc' /etc/xrdp/startwm.sh

EXPOSE 3389

CMD service dbus start; /usr/lib/systemd/systemd-logind & service xrdp start ; bash