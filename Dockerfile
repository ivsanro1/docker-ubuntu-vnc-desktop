FROM dorowu/ubuntu-desktop-lxde-vnc:bionic

RUN sudo apt-get update
RUN sudo apt-get install -y git sshfs openssh-server dos2unix

RUN sudo mkdir /mnt/gce_home
RUN sudo chmod 777 /mnt/gce_home

RUN sudo mkdir /root/.ssh
RUN sudo mkdir /tmp/.ssh/
# ADD /c/Users/insn/.ssh /root/.ssh

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN dos2unix /bin/docker-entrypoint.sh

RUN chmod +x /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]