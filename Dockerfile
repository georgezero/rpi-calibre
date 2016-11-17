FROM resin/rpi-raspbian:jessie
MAINTAINER George Zero <georgezero@trove.nyc>

RUN apt-get update \
 && apt-get install -y \
      calibre rsync wget curl zip git zsh vim tmux \
 && rm -rf /tmp/*

RUN wget -O ~/.zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
RUN mkdir -p /opt/calibre

EXPOSE 8080
VOLUME ["/opt/calibre"]
CMD /usr/bin/calibre-server --with-library=/opt/calibre --username=$USERNAME --password=$PASSWORD
