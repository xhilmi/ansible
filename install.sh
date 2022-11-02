#!/bin/bash
===============================================
==================== ANSIBLE ====================
===============================================
sudo apt update -y;
sudo apt install software-properties-common -yl
sudo add-apt-repository --yes --update ppa:ansible/ansible;
sudo apt install ansible -y;

# ssh-keygen -t rsa
# ssh-copy-id -p 64000 root@docker.thanos.my.id;
# ssh-copy-id -p 64000 root@kubernetes.thanos.my.id;
# ssh-copy-id -p 64000 root@jenkins.thanos.my.id;
# ssh-copy-id -p 64000 root@centos.thanos.my.id;
# ssh-copy-id -p 64000 root@ubuntu.thanos.my.id;
# ssh-copy-id -p 64000 root@rocky.thanos.my.id;
