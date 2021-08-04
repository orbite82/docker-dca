# Aula 0 : Docker DCA 00 - Preparação da Máquina (Windows / Linux):  https://www.youtube.com/watch?v=U-GGoWq26C4

┌─[orbite]@[orbite-Navita]:~/docker-dca
└──> $ vagrant box list
centos/7                           (virtualbox, 2004.01)
darkwizard242/ansibledebian10      (virtualbox, 1.0.1605131430)
trombik/ansible-centos-7.3-x86_64  (virtualbox, 1.3.0)
trombik/ansible-ubuntu-18.04-amd64 (virtualbox, 20201103)
ubuntu/bionic64 

vagrant destroy -f

┌─[orbite]@[orbite-Navita]:~/.vagrant.d/boxes
└──> $ ls -lha
total 28K
drwxrwxr-x 7 orbite orbite 4,0K ago  2 17:36 .
drwxrwxr-x 7 orbite orbite 4,0K ago  2 17:50 ..
drwxrwxr-x 3 orbite orbite 4,0K ago  2 17:36 centos-VAGRANTSLASH-7
drwxrwxr-x 3 orbite orbite 4,0K mai 26 17:11 darkwizard242-VAGRANTSLASH-ansibledebian10
drwxrwxr-x 3 orbite orbite 4,0K mai 26 17:01 trombik-VAGRANTSLASH-ansible-centos-7.3-x86_64
drwxrwxr-x 3 orbite orbite 4,0K mai 26 17:07 trombik-VAGRANTSLASH-ansible-ubuntu-18.04-amd64
drwxrwxr-x 3 orbite orbite 4,0K ago  2 17:35 ubuntu-VAGRANTSLASH-bionic64

┌─[orbite]@[orbite-Navita]:~/docker-dca
└──> $ vagrant up node01 node02
Bringing machine 'node01' up with 'virtualbox' provider...
Bringing machine 'node02' up with 'virtualbox' provider...
==> node01: Importing base box 'ubuntu/bionic64'...

┌─[orbite]@[orbite-Navita]:~/docker-dca
└──> $ vagrant global-status
id       name   provider   state   directory                           
-----------------------------------------------------------------------
3aefffb  node01 virtualbox running /home/orbite/docker-dca             
be6bfd9  node02 virtualbox running /home/orbite/docker-dca             
 
The above shows information about all known Vagrant environments
on this machine. This data is cached and may not be completely
up-to-date (use "vagrant global-status --prune" to prune invalid
entries). To interact with any of the machines, you can go to that
directory and run Vagrant, or you can use the ID directly with
Vagrant commands from any directory. For example:
"vagrant destroy 1a2b3c4d"

┌─[orbite]@[orbite-Navita]:~/docker-dca
└──> $ vagrant ssh node01
Welcome to Ubuntu 18.04.5 LTS (GNU/Linux 4.15.0-151-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Mon Aug  2 21:13:59 UTC 2021

  System load:  0.04              Users logged in:        0
  Usage of /:   4.4% of 38.71GB   IP address for enp0s3:  10.0.2.15
  Memory usage: 20%               IP address for enp0s8:  10.20.20.110
  Swap usage:   0%                IP address for docker0: 172.17.0.1
  Processes:    96


9 updates can be applied immediately.
8 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable

New release '20.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


vagrant@node01:~$

┌─[orbite]@[orbite-Navita]:~/docker-dca
└──> $ vagrant ssh node02
[vagrant@node02 ~]$ sudo -i
[root@node02 ~]

vagrant halt

==========================================

# Aula 1 : Docker DCA 01 - Instalação e Fundamentos: https://www.youtube.com/watch?v=o5v8hy0joa4&t=806s

┌─[orbite]@[orbite-Navita]:~/docker-dca
└──> $ vagrant up node01 node02

┌─[orbite]@[orbite-Navita]:~/docker-dca
└──> $ vagrant status
Current machine states:

master                    not created (virtualbox)
node01                    running (virtualbox)
node02                    running (virtualbox)
registry                  not created (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.

┌─[orbite]@[orbite-Navita]:~/docker-dca
└──> $ vagrant ssh node01
Welcome to Ubuntu 18.04.5 LTS (GNU/Linux 4.15.0-151-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Aug  3 14:44:06 UTC 2021

  System load:  0.74              Users logged in:        0
  Usage of /:   4.4% of 38.71GB   IP address for enp0s3:  10.0.2.15
  Memory usage: 20%               IP address for enp0s8:  10.20.20.110
  Swap usage:   0%                IP address for docker0: 172.17.0.1
  Processes:    111

 * Super-optimized for small spaces - read how we shrank the memory
   footprint of MicroK8s to make it the smallest full K8s around.

   https://ubuntu.com/blog/microk8s-memory-optimisation

1 update can be applied immediately.
To see these additional updates run: apt list --upgradable

New release '20.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Mon Aug  2 21:14:01 2021 from 10.0.2.2
vagrant@node01:~$

# Install Docker

https://docs.docker.com/engine/install/ubuntu/

sudo apt-get update

sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

ls /etc/apt/sources.list.d/  

cat /etc/apt/sources.list.d/docker.list

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo $USER

sudo usermod -aG docker $USER

# em caso de erro seguir esse passo
# https://docs.docker.com/engine/install/linux-postinstall/

┌─[orbite]@[Orbite-Desktop]:~
└──> $ sudo usermod -aG docker $USER
usermod: group 'docker' does not exist

sudo groupadd docker

sudo usermod -aG docker $USER

getent group docker

docker system info

# Install command completion

https://docs.docker.com/compose/completion/

sudo curl \
    -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/bash/docker-compose \
    -o /etc/bash_completion.d/docker-compose

# Node02

https://docs.docker.com/engine/install/centos/

vagrant ssh node02

sudo yum install yum-utils epel-release -y

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker Engine

sudo yum install docker-ce docker-ce-cli containerd.io -y

#sudo localectl list-locales | grep en_US

#sudo localectl set-locale en_US.utf8

sudo systemctl enable docker

sudo systemctl start  docker

sudo usermod -aG docker $USER

vagrant@node01:~$ docker container run --rm -it hello-world

