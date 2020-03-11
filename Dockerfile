FROM dorowu/ubuntu-desktop-lxde-vnc:bionic

RUN sudo apt-get update
RUN sudo apt-get install -y git sshfs openssh-server dos2unix terminator screen

################## INSTALL VSCODE ##################

RUN sudo apt-get install -y gpg-agent

RUN sudo apt-get install -y curl apt-transport-https

RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc -o microsoft.asc
RUN sudo apt-key add microsoft.asc
# sudo rm microsoft.asc;
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"  | sudo tee /etc/apt/sources.list.d/vscode.list
RUN sudo apt update
RUN sudo apt install -y code

################## END INSTALL VSCODE ##################

RUN sudo apt-get install -y rsync grsync cron vim nano

# RUN sudo apt-get install -y python3-pip # Fails due to being unable to fetch 

#RUN sudo mkdir /mnt/gce_home
#RUN sudo chmod 777 /mnt/gce_home

#RUN echo "source /usr/share/bash-completion/completions/git" >> /root/.bashrc


################## INSTALL DOCKER AND KUBERNETES ##################
RUN sudo apt install -y docker.io

################## END INSTALL DOCKER AND KUBERNETES ##################

RUN sudo mkdir /root/.ssh
RUN sudo mkdir /tmp/.ssh/
# ADD /c/Users/insn/.ssh /root/.ssh

RUN sudo mkdir /tmp/stuff

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN dos2unix /bin/docker-entrypoint.sh

RUN chmod +x /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]