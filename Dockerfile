FROM ubuntu:latest
LABEL maintainer="itoumagic@gmail.com"

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#\?PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# X11 forwerding config
RUN sed -i 's/#\?ForwardX11 no/ForwardX11 yes/' /etc/ssh/sshd_config
RUN apt-get install -y xauth
RUN echo AddressFamily inet >> /etc/ssh/sshd_config
ENV DISPLAY=host.docker.internal:0

RUN echo "export DISPLAY=host.docker.internal:0" >> ~/.bashrc
RUN apt install -y x11-apps

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
