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

vagrant@node01:~$ docker container run -it hello-world

vagrant@node01:~$ docker ps -a
CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS     NAMES
05e11e667b8c   hello-world   "/hello"   4 seconds ago   Exited (0) 3 seconds ago             romantic_lamarr
c60655eac05b   hello-world   "/hello"   6 seconds ago   Exited (0) 4 seconds ago             optimistic_joliot
db32bdac9729   hello-world   "/hello"   8 seconds ago   Exited (0) 7 seconds ago             trusting_pare

vagrant@node01:~$ docker container ls -aq
05e11e667b8c
c60655eac05b
db32bdac9729

vagrant@node01:~$ docker container rm $(docker container ls -aq)
05e11e667b8c
c60655eac05b
db32bdac9729
vagrant@node01:~$ docker container ls -aq
vagrant@node01:~$

# Aula 2 : Docker DCA 02 - Comandos Docker e Imagens
https://www.youtube.com/watch?v=nChxlWTDAak&t=10s

┌─[orbite]@[Orbite-Desktop]:~
└──> $ docker search debian
NAME                                               DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
ubuntu                                             Ubuntu is a Debian-based Linux operating sys…   12587     [OK]       
debian                                             Debian is a Linux distribution that's compos…   3934      [OK]       
arm32v7/debian                                     Debian is a Linux distribution that's compos…   72                   
itscaro/debian-ssh                                 debian:jessie                                   28                   [OK]
arm64v8/debian                                     Debian is a Linux distribution that's compos…   26                   
samueldebruyn/debian-git                           a minimal docker container with debian and g…   22                   [OK]
i386/debian                                        Debian is a Linux distribution that's compos…   14                   
multiarch/debian-debootstrap                       multiarch ports of debian-debootstrap           13                   
eboraas/debian                                     Debian base images, for all currently-availa…   8                    [OK]
vergissberlin/debian-development                   Docker debian image to use for development, …   6                    [OK]
smartentry/debian                                  debian with smartentry                          6                    [OK]
amd64/debian                                       Debian is a Linux distribution that's compos…   6                    
ppc64le/debian                                     Debian is a Linux distribution that's compos…   4                    
s390x/debian                                       Debian is a Linux distribution that's compos…   3                    
vicamo/debian                                      Debian docker images for all versions/archit…   3                    
arm32v5/debian                                     Debian is a Linux distribution that's compos…   2                    
vpgrp/debian                                       Docker images of Debian.                        2                    
dockershelf/debian                                 Repository for docker images of Debian. Test…   1                    [OK]
spritsail/debian-builder                           A Docker image based on debian:slim ideal fo…   1                    [OK]
1and1internet/debian-9-nginx-php-7.2-wordpress-4   debian-9-nginx-php-7.2-wordpress-4              0                    [OK]
mdoerges/debian-buster-nginx                       Debian Buster with Nginx                        0                    
fleshgrinder/debian                                Debian base images for production and multis…   0                    [OK]
casept/debian-amd64                                A debian image built from scratch. Mostly fo…   0                    
jdub/debian-sources-resource                       Concourse CI resource to check for updated D…   0                    [OK]
konstruktoid/debian                                Debian base image                               0                    [OK]

vagrant@node01:~$ docker image ls
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
hello-world   latest    d1165f221234   5 months ago   13.3kB
vagrant@node01:~$ docker image pull debian
Using default tag: latest
latest: Pulling from library/debian
627b765e08d1: Pull complete 
Digest: sha256:cc58a29c333ee594f7624d968123429b26916face46169304f07580644dde6b2
Status: Downloaded newer image for debian:latest
docker.io/library/debian:latest
vagrant@node01:~$ docker container run -dit --name debian1 --hostname c1 debian
9cc87bdb4b102af09b2985a2f328cfedd93534526b270e2993aa98cdc46ad1f5

vagrant@node01:~$ docker container attach debian1
root@c1:/#

#-c de color
root@c1:/# ip -c a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
5: eth0@if6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.17.0.2/16 brd 172.17.255.255 scope global eth0
       valid_lft forever preferred_lft forever
root@c1:/#

root@c1:/# ip -br -c a
lo               UNKNOWN        127.0.0.1/8 
eth0@if6         UP             172.17.0.2/16 

root@c1:/# exit
exit

#sair do container
<CTRL> + <P> + <Q>

vagrant@node01:~$ docker container logs debian1

vagrant@node01:~$ docker container rm -f debian1
debian1

vagrant@node01:~$ echo "Arquivo de Teste" > /tmp/arquivo
vagrant@node01:/tmp$ ls
arquivo  netplan_lytydep1  systemd-private-c6f1dc7da72948dd9d281aa410bbc8a6-systemd-resolved.service-sOXLUp
vagrant@node01:/tmp$ cat arquivo 
Arquivo de Teste

# copiar 

vagrant@node01:~$ docker container cp /tmp/
.ICE-unix/                                                                        .font-unix/
.Test-unix/                                                                       arquivo
.X11-unix/                                                                        netplan_lytydep1/
.XIM-unix/                                                                        systemd-private-c6f1dc7da72948dd9d281aa410bbc8a6-systemd-resolved.service-sOXLUp/
vagrant@node01:~$ docker container cp /tmp/arquivo debian1:/tmp

vagrant@node01:~$ docker container exec debian1 ls -l /tmp
total 4
-rw-rw-r-- 1 1000 1000 17 Aug  5 17:33 arquivo

vagrant@node01:~$ docker container rm -f debian1
debian1

vagrant@node01:~$ docker container rm -f $(docker container ls -aq)
969c25b8d5cb

vagrant@node01:~$ docker container run -di --name debian-container debian
fd0790bbb35b5f88460bb8ba349e59f4897c68934890dd13d784a858d65055bf
vagrant@node01:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED         STATUS         PORTS     NAMES
fd0790bbb35b   debian    "bash"    5 seconds ago   Up 4 seconds             debian-container
vagrant@node01:~$ docker container ls
CONTAINER ID   IMAGE     COMMAND   CREATED          STATUS          PORTS     NAMES
fd0790bbb35b   debian    "bash"    14 seconds ago   Up 13 seconds             debian-container
vagrant@node01:~$ 

vagrant@node01:~$ docker container exec debian-container ls -l /
total 64
drwxr-xr-x   2 root root 4096 Jul 21 00:00 bin
drwxr-xr-x   2 root root 4096 Jun 13 10:30 boot
drwxr-xr-x   5 root root  340 Aug  5 18:41 dev
drwxr-xr-x   1 root root 4096 Aug  5 18:41 etc
drwxr-xr-x   2 root root 4096 Jun 13 10:30 home
drwxr-xr-x   7 root root 4096 Jul 21 00:00 lib
drwxr-xr-x   2 root root 4096 Jul 21 00:00 lib64
drwxr-xr-x   2 root root 4096 Jul 21 00:00 media
drwxr-xr-x   2 root root 4096 Jul 21 00:00 mnt
drwxr-xr-x   2 root root 4096 Jul 21 00:00 opt
dr-xr-xr-x 116 root root    0 Aug  5 18:41 proc
drwx------   2 root root 4096 Jul 21 00:00 root
drwxr-xr-x   3 root root 4096 Jul 21 00:00 run
drwxr-xr-x   2 root root 4096 Jul 21 00:00 sbin
drwxr-xr-x   2 root root 4096 Jul 21 00:00 srv
dr-xr-xr-x  13 root root    0 Aug  5 18:41 sys
drwxrwxrwt   2 root root 4096 Jul 21 00:00 tmp
drwxr-xr-x  10 root root 4096 Jul 21 00:00 usr
drwxr-xr-x  11 root root 4096 Jul 21 00:00 var

vagrant@node01:~$ docker container rm -f $(docker container ls -aq)
fd0790bbb35b


# logar docker hub

vagrant@node01:~$ docker login -u orbite82
Password: 
WARNING! Your password will be stored unencrypted in /home/vagrant/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded

# local aonde fica gravado as credencias

ls -l ~/.docker/config.json

# executar sempre

vagrant@node01:~$ docker logout
Removing login credentials for https://index.docker.io/v1/

vagrant@node01:~$ docker image ls
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
debian        latest    0980b84bde89   2 weeks ago    114MB
hello-world   latest    d1165f221234   5 months ago   13.3kB

vagrant@node01:~$ docker image history debian

IMAGE          CREATED       CREATED BY                                      SIZE      COMMENT
0980b84bde89   2 weeks ago   /bin/sh -c #(nop)  CMD ["bash"]                 0B        
<missing>      2 weeks ago   /bin/sh -c #(nop) ADD file:e952f6979e4b0ead0…   114MB     
vagrant@node01:~$ 

vagrant@node01:~$ docker image inspect debian
[
    {
        "Id": "sha256:0980b84bde890bbdd5db43522a34b4f7c3c96f4d026527f4a7266f7ee408780d",
        "RepoTags": [
            "debian:latest"
        ],
        "RepoDigests": [
            "debian@sha256:cc58a29c333ee594f7624d968123429b26916face46169304f07580644dde6b2"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2021-07-22T00:45:31.247048715Z",
        "Container": "da0002591dceae02b7eca668624f6a54db7c82fea6273056766bef8c1cdc4f63",
        "ContainerConfig": {
            "Hostname": "da0002591dce",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"bash\"]"
            ],
            "Image": "sha256:bf7e83fd1aa58f6e291962c802d9cd7f5aeaaee261d910fee6a7777e86c8baa9",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "20.10.7",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "bash"
            ],
            "Image": "sha256:bf7e83fd1aa58f6e291962c802d9cd7f5aeaaee261d910fee6a7777e86c8baa9",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 114114306,
        "VirtualSize": 114114306,
        "GraphDriver": {
            "Data": {
                "MergedDir": "/var/lib/docker/overlay2/64951ec191976e3c3d27f6af9a6a2c085148dfd7242d07a97d6af2a774137e45/merged",
                "UpperDir": "/var/lib/docker/overlay2/64951ec191976e3c3d27f6af9a6a2c085148dfd7242d07a97d6af2a774137e45/diff",
                "WorkDir": "/var/lib/docker/overlay2/64951ec191976e3c3d27f6af9a6a2c085148dfd7242d07a97d6af2a774137e45/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:afa3e488a0ee76983343f8aa759e4b7b898db65b715eb90abc81c181388374e3"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]

vagrant@node01:~$ docker container run -dit --name servidor-debian debian
11030e133406e3bf5d9a7a3b147099e95f1c1e69f0fa19ddc53991101ddae4d5

# atualizando container

vagrant@node01:~$ docker container exec servidor-debian apt-get update
Get:1 http://security.debian.org/debian-security buster/updates InRelease [65.4 kB]
Get:2 http://security.debian.org/debian-security buster/updates/main amd64 Packages [299 kB]
Get:3 http://deb.debian.org/debian buster InRelease [122 kB]
Get:4 http://deb.debian.org/debian buster-updates InRelease [51.9 kB]
Get:5 http://deb.debian.org/debian buster/main amd64 Packages [7907 kB]
Get:6 http://deb.debian.org/debian buster-updates/main amd64 Packages [15.2 kB]
Fetched 8459 kB in 7s (1292 kB/s)
Reading package lists...

docker container exec servidor-debian apt-get install nginx -y

docker container commit servidor-debian webserver-nginx

vagrant@node01:~$ docker image ls
REPOSITORY        TAG       IMAGE ID       CREATED         SIZE
webserver-nginx   latest    0e5d2131f6f7   5 minutes ago   196MB
debian            latest    0980b84bde89   2 weeks ago     114MB
hello-world       latest    d1165f221234   5 months ago    13.3kB

# salvando a imagem local

vagrant@node01:~$ docker image save webserver-nginx -o orbite.tar

vagrant@node01:~$ ls -l
total 197128
-rw------- 1 vagrant vagrant 201857536 Aug  6 14:38 orbite.tar

vagrant@node01:~$ docker container  rm -f servidor-debian
servidor-debian

vagrant@node01:~$ docker image rm webserver-nginx
Untagged: webserver-nginx:latest
Deleted: sha256:0e5d2131f6f7f5f37195e2497c1b053deffa68bb02e929cf24683dfff261a29b
Deleted: sha256:1f594597d5b5fbf6ea74260fd5d7cfaaf8aef39e41ce411f5fc5962c4476284a

vagrant@node01:~$ docker image ls
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
debian        latest    0980b84bde89   2 weeks ago    114MB
hello-world   latest    d1165f221234   5 months ago   13.3kB

# carregando imgem local salva
# isso é mod gambiarra hahhahhha

vagrant@node01:~$ docker image load -i orbite.tar 
62d4349062b4: Loading layer [==================================================>]  82.58MB/82.58MB
Loaded image: webserver-nginx:latest

vagrant@node01:~$ docker image ls
REPOSITORY        TAG       IMAGE ID       CREATED          SIZE
webserver-nginx   latest    0e5d2131f6f7   11 minutes ago   196MB
debian            latest    0980b84bde89   2 weeks ago      114MB
hello-world       latest    d1165f221234   5 months ago     13.3kB


vagrant@node01:~$ docker image rm webserver-nginx
Untagged: webserver-nginx:latest
Deleted: sha256:0e5d2131f6f7f5f37195e2497c1b053deffa68bb02e929cf24683dfff261a29b
Deleted: sha256:1f594597d5b5fbf6ea74260fd5d7cfaaf8aef39e41ce411f5fc5962c4476284a

vagrant@node01:~$ docker image rm debian
Untagged: debian:latest
Untagged: debian@sha256:cc58a29c333ee594f7624d968123429b26916face46169304f07580644dde6b2
Deleted: sha256:0980b84bde890bbdd5db43522a34b4f7c3c96f4d026527f4a7266f7ee408780d
Deleted: sha256:afa3e488a0ee76983343f8aa759e4b7b898db65b715eb90abc81c181388374e3

vagrant@node01:~$ docker image load -i orbite.tar 
afa3e488a0ee: Loading layer [==================================================>]  119.3MB/119.3MB
62d4349062b4: Loading layer [==================================================>]  82.58MB/82.58MB
Loaded image: webserver-nginx:latest

vagrant@node01:~$ docker image ls
REPOSITORY        TAG       IMAGE ID       CREATED          SIZE
webserver-nginx   latest    0e5d2131f6f7   18 minutes ago   196MB
hello-world       latest    d1165f221234   5 months ago     13.3kB

# a camada já existe : 627b765e08d1: Already exists

vagrant@node01:~$ docker image pull debian
Using default tag: latest
latest: Pulling from library/debian
627b765e08d1: Already exists 
Digest: sha256:cc58a29c333ee594f7624d968123429b26916face46169304f07580644dde6b2
Status: Downloaded newer image for debian:latest
docker.io/library/debian:latest


vagrant@node01:~$ sudo ls -l /var/lib/docker/
total 44
drwx--x--x 4 root root 4096 Aug  4 15:27 buildkit
drwx-----x 2 root root 4096 Aug  6 14:39 containers
drwx------ 3 root root 4096 Aug  4 15:27 image
drwxr-x--- 3 root root 4096 Aug  4 15:27 network
drwx-----x 6 root root 4096 Aug  6 14:48 overlay2
drwx------ 4 root root 4096 Aug  4 15:27 plugins
drwx------ 2 root root 4096 Aug  6 12:47 runtimes
drwx------ 2 root root 4096 Aug  4 15:27 swarm
drwx------ 2 root root 4096 Aug  6 14:48 tmp
drwx------ 2 root root 4096 Aug  4 15:27 trust
drwx-----x 2 root root 4096 Aug  6 12:47 volumes


# local aonde fica as imagens do docker

vagrant@node01:~$ sudo ls -l /var/lib/docker/image/overlay2/layerdb/sha256

vagrant@node01:~$ sudo ls -l /var/lib/docker/image/
total 4
drwx------ 5 root root 4096 Aug  6 14:50 overlay2
vagrant@node01:~$ sudo ls -l /var/lib/docker/image/overlay2
total 16
drwx------ 4 root root 4096 Aug  4 16:36 distribution
drwx------ 4 root root 4096 Aug  4 15:27 imagedb
drwx------ 5 root root 4096 Aug  4 16:36 layerdb
-rw------- 1 root root  664 Aug  6 14:50 repositories.json
vagrant@node01:~$ sudo ls -l /var/lib/docker/image/overlay2/layerdb
total 12
drwxr-xr-x 2 root root 4096 Aug  6 14:39 mounts
drwxr-xr-x 5 root root 4096 Aug  6 14:48 sha256
drwxr-xr-x 2 root root 4096 Aug  6 14:48 tmp
vagrant@node01:~$ sudo ls -l /var/lib/docker/image/overlay2/layerdb/sha256
total 12
drwx------ 2 root root 4096 Aug  6 14:48 1f594597d5b5fbf6ea74260fd5d7cfaaf8aef39e41ce411f5fc5962c4476284a
drwx------ 2 root root 4096 Aug  6 14:48 afa3e488a0ee76983343f8aa759e4b7b898db65b715eb90abc81c181388374e3
drwx------ 2 root root 4096 Aug  4 16:36 f22b99068db93900abe17f7f5e09ec775c2826ecfe9db961fea68293744144bd

vagrant@node01:~$ sudo du -sh /var/lib/docker/image/overlay2/layerdb/sha256
512K    /var/lib/docker/image/overlay2/layerdb/sha256

vagrant@node01:~$ sudo du -sh /var/lib/docker/overlay2
206M    /var/lib/docker/overlay2


# Aprendnedo o Dockerfile

FROM --> Diz qual é a origem da imagem (qual imagem base)

COPY --> Copia aquivos ou diretorios de origem local para imagem do container

RUN --> Executa um comando dentro do container

ADD --> Quase igual ao copy, mas aceita URL e alterar as permissionamentos

EXPOSE --> Expoe uma porta para o docker daemon (REDE)

ENTRYPOINT --> Ponto de Entrada do container (O que mantem o container vivo)

CMD --> Argumentos para o Entrypoint

https://docs.docker.com/engine/reference/builder/

vagrant@node01:~$ mkdir -p ~/dockerfiles/echo-container

vagrant@node01:~$ cd ~/dockerfiles/echo-container
vagrant@node01:~/dockerfiles/echo-container$

vagrant@node01:~/dockerfiles/echo-container$ vim Dockerfile

FROM         alpine
ENTRYPOINT   ["echo"]
CMD          ["--help"]

vagrant@node01:~/dockerfiles/echo-container$ docker image build -t echo-container .

# quando ocorrer esse erro

vagrant@node01:~/dockerfiles/echo-container$ docker image build -t echo-container .
Sending build context to Docker daemon  2.048kB
Step 1/3 : FROM      alpine
Get "https://registry-1.docker.io/v2/": context deadline exceeded (Client.Timeout exceeded while awaiting headers)

# seguir desta forma
# https://stackoverflow.com/questions/48056365/error-get-https-registry-1-docker-io-v2-net-http-request-canceled-while-b

sudo systemctl daemon-reload
sudo systemctl restart docker

vagrant@node01:~/dockerfiles/echo-container$ sudo vim /etc/resolv.conf

nameserver 8.8.8.8
nameserver 8.8.4.4
nameserver 127.0.0.53
options edns0
search nvta.corp

vagrant@node01:~/dockerfiles/echo-container$ docker image build -t echo-container2 .
Sending build context to Docker daemon  2.048kB
Step 1/3 : FROM      alpine
 ---> d4ff818577bc
Step 2/3 : ENTRYPOINT   ["echo"]
 ---> Using cache
 ---> 4467e512a4cb
Step 3/3 : CMD       ["--help"]
 ---> Using cache
 ---> 73e810bbe992
Successfully built 73e810bbe992
Successfully tagged echo-container2:latest

vagrant@node01:~/dockerfiles/echo-container$ docker image ls
REPOSITORY        TAG       IMAGE ID       CREATED             SIZE
echo-container2   latest    73e810bbe992   37 seconds ago      5.6MB
echo-container    latest    73e810bbe992   37 seconds ago      5.6MB
webserver-nginx   latest    0e5d2131f6f7   About an hour ago   196MB
debian            latest    0980b84bde89   2 weeks ago         114MB
alpine            latest    d4ff818577bc   7 weeks ago         5.6MB
hello-world       latest    d1165f221234   5 months ago        13.3kBc

# rodar o container que foi criado
# --rm : remove

#
FROM    debian
RUN     apt-get update
RUN     apt-get install wget git apache2 -yq
EXPOSE  80
CMD     ["apachectl", "-D", "FOREGROUND"]

# criando essa imagem

vagrant@node01:~/dockerfiles/webserver$ docker image build -t webserver .
Sending build context to Docker daemon  2.048kB
Step 1/5 : FROM debian
 ---> 0980b84bde89
Step 2/5 : RUN  apt-get update
 ---> Running in dff4103cf9d2
#


docker container run --rm -it echo-container

vagrant@node01:~/dockerfiles/echo-container$ docker container run --rm -it echo-container

# saida -->

#BusyBox v1.33.1 () multi-call binary.

#Usage: echo [-neE] [ARG]...

#Print the specified ARGs to stdout

#        -n      Suppress trailing newline
#        -e      Interpret backslash escapes (i.e., \t=tab)
#        -E      Don't interpret backslash escapes (default)



mkdir webservers

vagrant@node01:~/dockerfiles/webserver$ vim Dockerfile

#pior pratica

FROM    debian
RUN     apt-get update
RUN     apt-get install wget git apache2 -yq
EXPOSE  80
CMD     ["apachectl", "-D", "FOREGROUND"]

$ mkdir dockerfiles
$ mkdir  ~/dockerfiles/webserver
$ cd ~/dockerfiles/webserver
$ vim Dockerfile

# melhor pratica

FROM    debian
RUN     apt-get update; \
        apt-get install wget git apache2 -yq
EXPOSE  80          
CMD     ["apachectl", "-D", "FOREGROUND"]

$ docker image build -t webserver .

# resumo
vagrant@node01:~/dockerfiles/webserver$ docker image build -t webserver .
Sending build context to Docker daemon  2.048kB
Step 1/4 : FROM    debian
latest: Pulling from library/debian
627b765e08d1: Pull complete 
Digest: sha256:cc58a29c333ee594f7624d968123429b26916face46169304f07580644dde6b2
Status: Downloaded newer image for debian:latest
 ---> 0980b84bde89
Step 2/4 : RUN     apt-get update;         apt-get install wget git apache2 -yq
 ---> Running in 3780ede7ff5a
Get:1 http://deb.debian.org/debian buster InRelease [122 kB]

docker image build -t echo-container .

Sending build context to Docker daemon  2.048kB
Step 1/4 : FROM    debian
 ---> 0980b84bde89
Step 2/4 : RUN     apt-get update;         apt-get install wget git apache2 -yq
 ---> Using cache
 ---> 61243cb6f67c
Step 3/4 : EXPOSE  80
 ---> Using cache
 ---> 041d10e64b10
Step 4/4 : CMD     ["apachectl", "-D", "FOREGROUND"]
 ---> Using cache
 ---> a520e15c2329
Successfully built a520e15c2329
Successfully tagged echo-container:latest

vagrant@node01:~/dockerfiles/webserver$ docker image ls
REPOSITORY       TAG       IMAGE ID       CREATED              SIZE
echo-container   latest    a520e15c2329   About a minute ago   294MB
webserver        latest    a520e15c2329   About a minute ago   294MB
debian           latest    0980b84bde89   2 weeks ago          114MB

Removing intermediate container 3780ede7ff5a
 ---> 61243cb6f67c
Step 3/4 : EXPOSE  80
 ---> Running in 439a5996162c
Removing intermediate container 439a5996162c
 ---> 041d10e64b10
Step 4/4 : CMD     ["apachectl", "-D", "FOREGROUND"]
 ---> Running in d5f0e5dd951b
Removing intermediate container d5f0e5dd951b
 ---> a520e15c2329
Successfully built a520e15c2329
Successfully tagged webserver:latest

# enviar a imagem para docker hub

vagrant@node01:~/dockerfiles/webserver$ docker login -u orbite82

vagrant@node01:~/dockerfiles/webserver$ docker image ls
REPOSITORY       TAG       IMAGE ID       CREATED          SIZE
echo-container   latest    a520e15c2329   14 minutes ago   294MB
webserver        latest    a520e15c2329   14 minutes ago   294MB
debian           latest    0980b84bde89   2 weeks ago      114MB

vagrant@node01:~/dockerfiles/webserver$ docker image tag echo-container orbite82/echo-container:dca

vagrant@node01:~/dockerfiles/webserver$ docker image ls
REPOSITORY                TAG       IMAGE ID       CREATED          SIZE
echo-container            latest    a520e15c2329   16 minutes ago   294MB
webserver                 latest    a520e15c2329   16 minutes ago   294MB
orbite82/echo-container   dca       a520e15c2329   16 minutes ago   294MB
debian                    latest    0980b84bde89   2 weeks ago      114MB

# enviando para docker hub

vagrant@node01:~/dockerfiles/webserver$ docker push orbite82/echo-container:dca
The push refers to repository [docker.io/orbite82/echo-container]
c533c9048d64: Pushed 
afa3e488a0ee: Mounted from library/debian 
dca: digest: sha256:2374ba8b3593ef672a26747885d303bd184bfd7abf20b65fd26d2f1d30eeca16 size: 741

# baixar a imagem do docker hub ex:

docker image pull caiodelgadonew/echo-container:dca

vagrant@node01:~/dockerfiles/webserver$ docker image pull caiodelgadonew/echo-container:dca
dca: Pulling from caiodelgadonew/echo-container
5843afab3874: Pull complete 
Digest: sha256:8da4fcf28e37e2d45be9e0eed35b02c712522e35700d966fa77f5454cb36b0a9
Status: Downloaded newer image for caiodelgadonew/echo-container:dca
docker.io/caiodelgadonew/echo-container:dca

vagrant@node01:~/dockerfiles/webserver$ docker image ls
REPOSITORY                      TAG       IMAGE ID       CREATED          SIZE
echo-container                  latest    a520e15c2329   19 minutes ago   294MB
webserver                       latest    a520e15c2329   19 minutes ago   294MB
orbite82/echo-container         dca       a520e15c2329   19 minutes ago   294MB
debian                          latest    0980b84bde89   2 weeks ago      114MB
caiodelgadonew/echo-container   dca       b2b066932d4b   6 weeks ago      5.6MB

vagrant@node01:~/dockerfiles/webserver$ docker logout
Removing login credentials for https://index.docker.io/v1/

# Aula 03 : Docker DCA 03 - Docker Images - Melhores Práticas e Multistage Build
https://www.youtube.com/watch?v=e9bEdFo_ZLc&t=6s

mkdir echo-container
cd echo-container/
ls
vim Dockerfile

FROM        alpine
ENTRYPOINT  ["echo"]
CMD         ["--help"]

vagrant@node01:~/dockerfiles/echo-container$ docker image build -t teste:latest .
Sending build context to Docker daemon  2.048kB
Step 1/3 : FROM     alpine
latest: Pulling from library/alpine
29291e31a76a: Pull complete 
Digest: sha256:eb3e4e175ba6d212ba1d6e04fc0782916c08e1c9d7b45892e9796141b1d379ae
Status: Downloaded newer image for alpine:latest
 ---> 021b3423115f
Step 2/3 : ENTRYPOINT  ["echo"]
 ---> Running in a66a82553832
Removing intermediate container a66a82553832
 ---> ddd9407175cd
Step 3/3 : CMD      ["--help"]
 ---> Running in f1957d6ff1a6
Removing intermediate container f1957d6ff1a6
 ---> 45be85758dc3
Successfully built 45be85758dc3
Successfully tagged teste:latest

/home/vagrant/dockerfiles/echo-container

# desta forma consigo passar o path aonde esta meu Docker file

vagrant@node01:~/dockerfiles/echo-container$ cd ..
vagrant@node01:~/dockerfiles$ docker image build -t teste -f echo-container/Dockerfile .
Sending build context to Docker daemon  4.096kB
Step 1/3 : FROM     alpine
 ---> 021b3423115f
Step 2/3 : ENTRYPOINT  ["echo"]
 ---> Using cache
 ---> ddd9407175cd
Step 3/3 : CMD      ["--help"]
 ---> Using cache
 ---> 45be85758dc3
Successfully built 45be85758dc3
Successfully tagged teste:latest

vagrant@node01:~/dockerfiles$ pwd
/home/vagrant/dockerfiles

vagrant@node01:~/dockerfiles$ mkdir -p dockerfiles/exemplo1

vagrant@node01:~/dockerfiles$ ls

dockerfiles  echo-container  webserver

vagrant@node01:~/dockerfiles$ cd dockerfiles/exemplo1/

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ echo "Dockerfile Melhores Praticas" > conteudo.txt

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ cat conteudo.txt 
Dockerfile Melhores Praticas

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ vim Dockerfile

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ cat Dockerfile 
FROM  busybox
COPY  conteudo.txt /
RUN   cat /conteudo.txt

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ docker image build -t exemplo:v1 .
Sending build context to Docker daemon  3.072kB
Step 1/3 : FROM  busybox
latest: Pulling from library/busybox
b71f96345d44: Pull complete 
Digest: sha256:0f354ec1728d9ff32edcd7d1b8bbdfc798277ad36120dc3dc683be44524c8b60
Status: Downloaded newer image for busybox:latest
 ---> 69593048aa3a
Step 2/3 : COPY  conteudo.txt /
 ---> 5f5644f1577f
Step 3/3 : RUN   cat /conteudo.txt
 ---> Running in 0289a4a94131
Dockerfile Melhores Praticas
Removing intermediate container 0289a4a94131
 ---> c6322957b8fb
Successfully built c6322957b8fb
Successfully tagged exemplo:v1

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ mkdir image
vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ mkdir context
vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ ls -lha
total 24K
drwxrwxr-x 4 vagrant vagrant 4.0K Aug  9 16:03 .
drwxrwxr-x 3 vagrant vagrant 4.0K Aug  9 15:55 ..
-rw-rw-r-- 1 vagrant vagrant   60 Aug  9 16:00 Dockerfile
-rw-rw-r-- 1 vagrant vagrant   29 Aug  9 15:57 conteudo.txt
drwxrwxr-x 2 vagrant vagrant 4.0K Aug  9 16:03 context
drwxrwxr-x 2 vagrant vagrant 4.0K Aug  9 16:03 image

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ mv Dockerfile image/
vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ mv conteudo.txt context/

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ sudo apt-get install tree

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ tree
.
├── context
│   └── conteudo.txt
└── image
    └── Dockerfile

2 directories, 2 files

# vai dar erro falta argumentos

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ ls
context  image
vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ docker image build --no-cache -t exemplo:v2 -f image/Dockerfile .

# forma correta

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ ls
context  image
vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ docker image build --no-cache -t exemplo:v2 -f image/Dockerfile context/

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ docker image build --no-cache -t exemplo:v2 -f image/Dockerfile context/
Sending build context to Docker daemon  2.607kB
Step 1/3 : FROM  busybox
 ---> 69593048aa3a
Step 2/3 : COPY  conteudo.txt /
 ---> 62e2eba9e56e
Step 3/3 : RUN   cat /conteudo.txt
 ---> Running in 7cfd61621ddf
Dockerfile Melhores Praticas
Removing intermediate container 7cfd61621ddf
 ---> 7328d9f6e247
Successfully built 7328d9f6e247
Successfully tagged exemplo:v2

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ docker image prune
WARNING! This will remove all dangling images.
Are you sure you want to continue? [y/N] y
Total reclaimed space: 0B

# Pegar só a imagem que eu quero

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ docker image ls | head -n1 ; docker image ls | grep exemplo
REPOSITORY                      TAG       IMAGE ID       CREATED          SIZE
exemplo                         v2        7328d9f6e247   8 minutes ago    1.24MB
exemplo                         v1        c6322957b8fb   17 minutes ago   1.24MB

# Comando para pegar o ip do container

docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "digitar o ID aqui"

# se der erro é porque está em outro local

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ sudo cp -r /var/log ~/dockerfiles/exemplo1/context/
cp: cannot create directory '/home/vagrant/dockerfiles/exemplo1/context/': No such file or directory
vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ ^C
vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ sudo cp -r /var/log/ ~/dockerfiles/exemplo1/context/
cp: cannot create directory '/home/vagrant/dockerfiles/exemplo1/context/': No such file or directory
vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ ls
context  image
vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ pwd
/home/vagrant/dockerfiles/dockerfiles/exemplo1

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ sudo cp -r /var/log/ ~/dockerfiles/dockerfiles/exemplo1/context/

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ sudo du -sh
17M 

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ tree
.
├── context
│   ├── conteudo.txt
│   └── log
│       ├── apt
│       │   ├── eipp.log.xz
│       │   ├── history.log
│       │   └── term.log
│       ├── auth.log
│       ├── btmp
│       ├── cloud-init-output.log
│       ├── cloud-init.log
│       ├── dist-upgrade
│       ├── dpkg.log
│       ├── journal
│       │   └── d217dd6f2d004f42bb5d31510a886176
│       │       ├── system.journal
│       │       └── user-1000.journal
│       ├── kern.log
│       ├── landscape
│       │   └── sysinfo.log
│       ├── lastlog
│       ├── lxd
│       ├── syslog
│       ├── tallylog
│       ├── ubuntu-advantage.log
│       ├── unattended-upgrades [error opening dir]
│       └── wtmp
└── image
    └── Dockerfile

10 directories, 19 files

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ tree -L 2
.
├── context
│   ├── conteudo.txt
│   └── log
└── image
    └── Dockerfile

3 directories, 2 files

# Metodos de verificar o nome da imagem

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ docker image ls | head -n1 ; docker image ls | grep exemplo
REPOSITORY                      TAG       IMAGE ID       CREATED          SIZE
exemplo                         v2        7328d9f6e247   22 minutes ago   1.24MB
exemplo                         v1        c6322957b8fb   30 minutes ago   1.24MB

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ docker image ls | egrep "REPO|exemplo"
REPOSITORY                      TAG       IMAGE ID       CREATED          SIZE
exemplo                         v2        7328d9f6e247   22 minutes ago   1.24MB
exemplo                         v1        c6322957b8fb   31 minutes ago   1.24MB


vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ ls -l context/
total 8
-rw-rw-r-- 1 vagrant vagrant   29 Aug  9 15:57 conteudo.txt
drwxr-xr-x 8 root    root    4096 Aug  9 16:29 log

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ sudo chown -R vagrant. ~/dockerfiles/dockerfiles/exemplo1/context/log/
vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ ls -l context/
total 8
-rw-rw-r-- 1 vagrant vagrant   29 Aug  9 15:57 conteudo.txt
drwxr-xr-x 8 vagrant vagrant 4096 Aug  9 16:29 log

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ docker image build --no-cache -t exemplo:v3 -f image/Dockerfile context
Sending build context to Docker daemon  17.77MB
Step 1/3 : FROM  busybox
 ---> 69593048aa3a
Step 2/3 : COPY  conteudo.txt /
 ---> 4746f03ecfd9
Step 3/3 : RUN   cat /conteudo.txt
 ---> Running in c7c97db9ba49
Dockerfile Melhores Praticas
Removing intermediate container c7c97db9ba49
 ---> 2e09f79a7bab
Successfully built 2e09f79a7bab
Successfully tagged exemplo:v3

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ docker image ls | egrep "REPO|exemplo"
REPOSITORY                      TAG       IMAGE ID       CREATED          SIZE
exemplo                         v3        2e09f79a7bab   24 seconds ago   1.24MB
exemplo                         v2        7328d9f6e247   2 hours ago      1.24MB
exemplo                         v1        c6322957b8fb   2 hours ago      1.24MB

# time

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ time docker image build --no-cache -t exemplo:v3 -f image/Dockerfile context
Sending build context to Docker daemon  17.77MB
Step 1/3 : FROM  busybox
 ---> 69593048aa3a
Step 2/3 : COPY  conteudo.txt /
 ---> 0d04cfe03932
Step 3/3 : RUN   cat /conteudo.txt
 ---> Running in 4f23958a074a
Dockerfile Melhores Praticas
Removing intermediate container 4f23958a074a
 ---> c69db7cbbb82
Successfully built c69db7cbbb82
Successfully tagged exemplo:v3

real    0m3.201s
user    0m0.099s
sys     0m0.055s

# boas praticas igual .gitignore / .dockerignore

vim context/.dockerignore
# Comentario: Ignorando arquivos do diretorio de log
log
~    

# diferença de tempo e tamanho

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ time docker image build --no-cache -t exemplo:v4 -f image/Dockerfile context
Sending build context to Docker daemon   2.62kB
Step 1/3 : FROM  busybox
 ---> 69593048aa3a
Step 2/3 : COPY  conteudo.txt /
 ---> e76aea9efe7f
Step 3/3 : RUN   cat /conteudo.txt
 ---> Running in b8b46af4c931
Dockerfile Melhores Praticas
Removing intermediate container b8b46af4c931
 ---> 22d6bdb8b026
Successfully built 22d6bdb8b026
Successfully tagged exemplo:v4

real    0m1.981s
user    0m0.038s
sys     0m0.042s

vagrant@node01:~/dockerfiles/dockerfiles/exemplo1$ docker image ls | egrep "REPO|exemplo"
REPOSITORY                      TAG       IMAGE ID       CREATED              SIZE
exemplo                         v4        22d6bdb8b026   About a minute ago   1.24MB
exemplo                         v3        c69db7cbbb82   13 minutes ago       1.24MB
exemplo                         v2        7328d9f6e247   2 hours ago          1.24MB
exemplo                         v1        c6322957b8fb   3 hours ago          1.24MB

vagrant@node01:~$ mkdir -p dockerfiles/dicas
vagrant@node01:~$ ls
dockerfiles
vagrant@node01:~$ cd dockerfiles/d
dicas/       dockerfiles/ 
vagrant@node01:~$ cd dockerfiles/dicas/

vagrant@node01:~/dockerfiles/dicas$ git clone https://github.com/caiodelgadonew/java-wc-app.git
# https://github.com/caiodelgadonew/java-wc-app

vagrant@node01:~/dockerfiles/dicas$ tree
.
└── java-wc-app
    ├── Count.class
    ├── Count.java
    ├── README.md
    ├── manifest
    ├── samples
    │   ├── 1.txt
    │   └── 2.txt
    └── target
        ├── app.jar
        ├── sample.txt
        └── sample2.txt

3 directories, 9 files

# DICA1 : A ordem importa para o cache

# errado
vagrant@node01:~/dockerfiles/dicas$ vim Dockerfile

FROM         debian:9
#COPY         app /app : forma errada
RUN          apt-get update
RUN          apt-get install -y openjdk-8-jdk wget ssh vim
COPY         app /app
ENTRYPOINT   ["java", "-jar", "/app/target/app.jar"]

vagrant@node01:~/dockerfiles/dicas$ docker image build -t dicas:v1 .

# corrigindo o erro do build acima

vagrant@node01:~/dockerfiles/dicas$ rm -rf java-wc-app/
vagrant@node01:~/dockerfiles/dicas$ ls
Dockerfile
vagrant@node01:~/dockerfiles/dicas$ git clone https://github.com/caiodelgadonew/java-wc-app.git app
Cloning into 'app'...
remote: Enumerating objects: 11, done.
remote: Counting objects: 100% (11/11), done.
remote: Compressing objects: 100% (10/10), done.
remote: Total 11 (delta 0), reused 11 (delta 0), pack-reused 0
Unpacking objects: 100% (11/11), done.
vagrant@node01:~/dockerfiles/dicas$ ls
Dockerfile  app

vagrant@node01:~/dockerfiles/dicas$ docker image build --no-cache -t dicas:v1 .

vagrant@node01:~/dockerfiles/dicas$ docker image ls | egrep "REPOSITORY|dicas"
REPOSITORY                      TAG       IMAGE ID       CREATED          SIZE
dicas                           v1        4052eccc6095   29 seconds ago   655MB

# usando o cache

vagrant@node01:~/dockerfiles/dicas$ time docker image build -t dicas:v1 .
Sending build context to Docker daemon  84.48kB
Step 1/5 : FROM        debian:9
 ---> 2c3ad12c6ecf
Step 2/5 : RUN         apt-get update
 ---> Using cache
 ---> 49c0d04efcba
Step 3/5 : RUN         apt-get install -y openjdk-8-jdk wget ssh vim
 ---> Using cache
 ---> b514150b491a
Step 4/5 : COPY        app /app
 ---> Using cache
 ---> 84cca00f85cc
Step 5/5 : ENTRYPOINT  ["java", "-jar", "/app/target/app.jar"]
 ---> Using cache
 ---> 4052eccc6095
Successfully built 4052eccc6095
Successfully tagged dicas:v1

real    0m0.404s
user    0m0.105s
sys     0m0.107s

==========

# correto

vim Dockerfile

    FROM        debian:9
    RUN         apt-get update
    RUN         apt-get install -y openjdk-8-jdk wget ssh vim
    COPY        app /app
    ENTRYPOINT  ["java", "-jar", "/app/target/app.jar"]

# DICA 2 : COPY mais especifico para limitar a quebra de cache

vagrant@node01:~/dockerfiles/dicas$ tree
.
├── Dockerfile
└── app
    ├── Count.class
    ├── Count.java
    ├── README.md
    ├── manifest
    ├── samples
    │   ├── 1.txt
    │   └── 2.txt
    └── target
        ├── app.jar
        ├── sample.txt
        └── sample2.txt

3 directories, 10 files

FROM        debian:9
RUN         apt-get update
RUN         apt-get install -y openjdk-8-jdk wget ssh vim
COPY        app/target/app.jar /app/app.jar
COPY        app/samples /samples
ENTRYPOINT  ["java", "-jar", "/app/app.jar"]

vagrant@node01:~/dockerfiles/dicas$ time docker image build -t dicas:v2 .
Sending build context to Docker daemon   85.5kB
Step 1/6 : FROM        debian:9
 ---> 2c3ad12c6ecf
Step 2/6 : RUN         apt-get update
 ---> Using cache
 ---> 49c0d04efcba
Step 3/6 : RUN         apt-get install -y openjdk-8-jdk wget ssh vim
 ---> Using cache
 ---> b514150b491a
Step 4/6 : COPY        app/target/app.jar /app/app.jar
 ---> 5ebe51c97e45
Step 5/6 : COPY        app/samples /amples
 ---> 7c3bbb5d902e
Step 6/6 : ENTRYPOINT  ["java", "-jar", "/app/app.jar"]
 ---> Running in b84a33c09284
Removing intermediate container b84a33c09284
 ---> 87483f0d80fe
Successfully built 87483f0d80fe
Successfully tagged dicas:v2

real    0m2.528s
user    0m0.046s
sys     0m0.092s

vagrant@node01:~/dockerfiles/dicas$ docker image ls | egrep "REPOSITORY|dicas"
REPOSITORY                      TAG       IMAGE ID       CREATED             SIZE
dicas                           v2        87483f0d80fe   19 seconds ago      655MB
dicas                           v1        4052eccc6095   11 minutes ago      655MB

# dicas 1 : test run
vagrant@node01:~/dockerfiles/dicas$ docker container run --rm -it dicas:v1 /app/samples/1.txt
Counted 446 chars.

# dicas 2 : teste run

vagrant@node01:~/dockerfiles/dicas$ docker container run --rm -it dicas:v2 /samples/1.txt
Counted 446 chars.

# opcional
vagrant@node01:~/dockerfiles/dicas$ docker container run --rm -it dicas:v2 /samples/2.txt
Counted 702 chars.

# DICA 3 : Identifique as instruções que podem ser AGRUPADAS

FROM        debian:9
RUN         apt-get update \
            && apt-get install -y \
            openjdk-8-jdk \ 
            wget \ 
            ssh \ 
            vim
COPY        app/target/app.jar /app/app.jar
COPY        app/samples /samples
ENTRYPOINT  ["java", "-jar", "/app/app.jar"]

# ou

FROM        debian:9
RUN         apt-get update \
            && apt-get install -y \
            openjdk-8-jdk wget \ 
            ssh vim 
COPY        app/target/app.jar /app/app.jar
COPY        app/samples /samples
ENTRYPOINT  ["java", "-jar", "/app/app.jar"]

vagrant@node01:~/dockerfiles/dicas$ docker image build -t dicas:3 .

REPOSITORY                      TAG       IMAGE ID       CREATED          SIZE
dicas                           3         39794586173e   20 seconds ago   655MB
dicas                           v2        d685d6fac049   2 hours ago      655MB
dicas                           v1        4052eccc6095   2 hours ago      655MB


# DICA 4 : Remova as dependencias desnecessárias

# melhor pratica --no-install-recomends

FROM        debian:9
RUN         apt-get update \
            && apt-get install -y --no-install-recommends \
            openjdk-8-jdk wget \
            ssh vim 
COPY        app/target/app.jar /app/app.jar
COPY        app/samples /samples
ENTRYPOINT  ["java", "-jar", "/app/app.jar"]

# DICA 5 : Remover o cache do gerenciador de Pacotes

# arquivos de cache que é enviado para o container

vagrant@node01:~/dockerfiles/dicas$ ls -l /var/lib/apt/lists/
archive.ubuntu.com_ubuntu_dists_bionic-backports_InRelease                         archive.ubuntu.com_ubuntu_dists_bionic_restricted_binary-amd64_Packages
archive.ubuntu.com_ubuntu_dists_bionic-backports_main_binary-amd64_Packages        archive.ubuntu.com_ubuntu_dists_bionic_restricted_i18n_Translation-en
archive.ubuntu.com_ubuntu_dists_bionic-backports_main_i18n_Translation-en          archive.ubuntu.com_ubuntu_dists_bionic_universe_binary-amd64_Packages
archive.ubuntu.com_ubuntu_dists_bionic-backports_universe_binary-amd64_Packages    archive.ubuntu.com_ubuntu_dists_bionic_universe_i18n_Translation-en
archive.ubuntu.com_ubuntu_dists_bionic-backports_universe_i18n_Translation-en      auxfiles/
archive.ubuntu.com_ubuntu_dists_bionic-updates_InRelease                           download.docker.com_linux_ubuntu_dists_bionic_InRelease
archive.ubuntu.com_ubuntu_dists_bionic-updates_main_binary-amd64_Packages          download.docker.com_linux_ubuntu_dists_bionic_stable_binary-amd64_Packages
archive.ubuntu.com_ubuntu_dists_bionic-updates_main_i18n_Translation-en            lock
archive.ubuntu.com_ubuntu_dists_bionic-updates_multiverse_binary-amd64_Packages    partial/
archive.ubuntu.com_ubuntu_dists_bionic-updates_multiverse_i18n_Translation-en      security.ubuntu.com_ubuntu_dists_bionic-security_InRelease
archive.ubuntu.com_ubuntu_dists_bionic-updates_restricted_binary-amd64_Packages    security.ubuntu.com_ubuntu_dists_bionic-security_main_binary-amd64_Packages
archive.ubuntu.com_ubuntu_dists_bionic-updates_restricted_i18n_Translation-en      security.ubuntu.com_ubuntu_dists_bionic-security_main_i18n_Translation-en
archive.ubuntu.com_ubuntu_dists_bionic-updates_universe_binary-amd64_Packages      security.ubuntu.com_ubuntu_dists_bionic-security_multiverse_binary-amd64_Packages
archive.ubuntu.com_ubuntu_dists_bionic-updates_universe_i18n_Translation-en        security.ubuntu.com_ubuntu_dists_bionic-security_multiverse_i18n_Translation-en
archive.ubuntu.com_ubuntu_dists_bionic_InRelease                                   security.ubuntu.com_ubuntu_dists_bionic-security_restricted_binary-amd64_Packages
archive.ubuntu.com_ubuntu_dists_bionic_main_binary-amd64_Packages                  security.ubuntu.com_ubuntu_dists_bionic-security_restricted_i18n_Translation-en
archive.ubuntu.com_ubuntu_dists_bionic_main_i18n_Translation-en                    security.ubuntu.com_ubuntu_dists_bionic-security_universe_binary-amd64_Packages
archive.ubuntu.com_ubuntu_dists_bionic_multiverse_binary-amd64_Packages            security.ubuntu.com_ubuntu_dists_bionic-security_universe_i18n_Translation-en
archive.ubuntu.com_ubuntu_dists_bionic_multiverse_i18n_Translation-en 

vagrant@node01:~/dockerfiles/dicas$ tree /var/cache/apt
/var/cache/apt
├── archives
│   ├── apt-transport-https_1.6.14_all.deb
│   ├── containerd.io_1.4.9-1_amd64.deb
│   ├── curl_7.58.0-2ubuntu3.14_amd64.deb
│   ├── docker-ce-cli_5%3a20.10.8~3-0~ubuntu-bionic_amd64.deb
│   ├── docker-ce-rootless-extras_5%3a20.10.8~3-0~ubuntu-bionic_amd64.deb
│   ├── docker-ce_5%3a20.10.8~3-0~ubuntu-bionic_amd64.deb
│   ├── docker-scan-plugin_0.8.0~ubuntu-bionic_amd64.deb
│   ├── libcurl4_7.58.0-2ubuntu3.14_amd64.deb
│   ├── lock
│   ├── partial [error opening dir]
│   └── tree_1.7.0-5_amd64.deb
├── pkgcache.bin
└── srcpkgcache.bin

2 directories, 12 files

# removendo o cache desses diretórios

/var/cache/apt
/var/lib/apt/lists/

FROM        debian:9
RUN         apt-get update \
            && apt-get install -y --no-install-recommends \
            openjdk-8-jdk wget \ 
            && rm -rf /var/lib/apt/lists \
            && rm -rf /var/cache/apt
COPY        app/target/app.jar /app/app.jar
COPY        app/samples /samples
ENTRYPOINT  ["java", "-jar", "/app/app.jar"]

vagrant@node01:~/dockerfiles/dicas$ docker image build -t dicas:v5 .

vagrant@node01:~/dockerfiles/dicas$ docker image ls | egrep "REPOSITORY|dicas"
REPOSITORY                      TAG       IMAGE ID       CREATED          SIZE
dicas                           v5        ff093026a589   37 seconds ago   480MB
dicas                           v4        834e0aea8cb6   56 minutes ago   538MB
dicas                           3         39794586173e   18 hours ago     655MB
dicas                           v3        39794586173e   18 hours ago     655MB
dicas                           v2        d685d6fac049   19 hours ago     655MB
dicas                           v1        4052eccc6095   20 hours ago     655MB

# DICA 6 : Utilizar imagens oficiais sempre que possivel

# Substituir os arquivos do dockerfile anterior pra uma imagem pronta!

FROM        openjdk
COPY        app/target/app.jar /app/app.jar
COPY        app/samples /samples
ENTRYPOINT  ["java", "-jar", "/app/app.jar"]

vagrant@node01:~/dockerfiles/dicas$ docker image ls | egrep "REPOSITORY|dicas"
REPOSITORY                      TAG       IMAGE ID       CREATED             SIZE
dicas                           v6        d34e15f8dec2   15 seconds ago      467MB
dicas                           v5        ff093026a589   7 minutes ago       480MB
dicas                           v4        834e0aea8cb6   About an hour ago   538MB
dicas                           3         39794586173e   18 hours ago        655MB
dicas                           v3        39794586173e   18 hours ago        655MB
dicas                           v2        d685d6fac049   20 hours ago        655MB
dicas                           v1        4052eccc6095   20 hours ago        655MB  

# DICA 7 : Utilize TAGS mais especificas

FROM        openjdk:8
COPY        app/target/app.jar /app/app.jar
COPY        app/samples /samples
ENTRYPOINT  ["java", "-jar", "/app/app.jar"]

vagrant@node01:~/dockerfiles/dicas$ docker image build -t dicas:v7 .

vagrant@node01:~/dockerfiles/dicas$ docker image ls | egrep "REPOSITORY|dicas"
REPOSITORY                      TAG       IMAGE ID       CREATED             SIZE
dicas                           v7        621e289a0fc9   14 seconds ago      514MB
dicas                           v6        d34e15f8dec2   10 minutes ago      467MB
dicas                           v5        ff093026a589   17 minutes ago      480MB
dicas                           v4        834e0aea8cb6   About an hour ago   538MB
dicas                           3         39794586173e   18 hours ago        655MB
dicas                           v3        39794586173e   18 hours ago        655MB
dicas                           v2        d685d6fac049   20 hours ago        655MB
dicas                           v1        4052eccc6095   20 hours ago        655MB

# DICA 8 : Procura por flavors minimos

slim --> DEBIAN -> GNU libcurl4_7

aline --> ALPINE --> musl lbc 

vagrant@node01:~/dockerfiles/dicas$ docker image pull openjdk:8

vagrant@node01:~/dockerfiles/dicas$ docker image pull openjdk:8-jre

vagrant@node01:~/dockerfiles/dicas$ docker image pull openjdk:8-jre-slim

vagrant@node01:~/dockerfiles/dicas$ docker image pull openjdk:8-jre-alpine

vagrant@node01:~/dockerfiles/dicas$ docker image ls | egrep "REPOSITORY|openjdk"
REPOSITORY                      TAG            IMAGE ID       CREATED             SIZE
openjdk                         latest         c9022ce77bf9   2 weeks ago         467MB
openjdk                         8-jre-slim     621434f053cf   2 weeks ago         187MB
openjdk                         8-jre          5d392f8284fe   2 weeks ago         268MB
openjdk                         8              f67a59e543c1   2 weeks ago         514MB
openjdk                         8-jre-alpine   f7a292bbb70c   2 years ago         84.9MB

FROM        openjdk:8-jre-alpine
COPY        app/target/app.jar /app/app.jar
COPY        app/samples /samples
ENTRYPOINT  ["java", "-jar", "/app/app.jar"]

vagrant@node01:~/dockerfiles/dicas$ docker image build -t dicas:v8 .

# DICA 9 : MULTI-STAGE BUILD

git clone https://github.com/alexellis/href-counter.git  

vagrant@node01:~/dockerfiles/dicas$ cd ..
vagrant@node01:~/dockerfiles$ ls
dicas  dockerfiles  echo-container  webserver
vagrant@node01:~/dockerfiles$ git clone https://github.com/alexellis/href-counter.git ~/dockerfiles/multistage
Cloning into '/home/vagrant/dockerfiles/multistage'...
remote: Enumerating objects: 63, done.
remote: Total 63 (delta 0), reused 0 (delta 0), pack-reused 63
Unpacking objects: 100% (63/63), done.

vagrant@node01:~/dockerfiles$ ls
dicas  dockerfiles  echo-container  multistage  webserve

vagrant@node01:~/dockerfiles/multistage$ ls
Dockerfile  Dockerfile.build  Dockerfile.multi  Gopkg.lock  Gopkg.toml  LICENSE  README.md  app.go  build-multi-dockerfiles.sh  build.sh  vendor
vagrant@node01:~/dockerfiles/multistage$ rm Docker*
vagrant@node01:~/dockerfiles/multistage$ ls
Gopkg.lock  Gopkg.toml  LICENSE  README.md  app.go  build-multi-dockerfiles.sh  build.sh  vendor

FROM      golang:1.7.3
WORKDIR   go/src/github.com/alexellis/href-counter/
RUN       go get -d -v golang.org/x/net/html
COPY      app.go .
RUN       CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .
CMD       ["./app"]


vagrant@node01:~/dockerfiles/multistage$ vim Dockerfile
vagrant@node01:~/dockerfiles/multistage$ ls
Dockerfile  Gopkg.lock  Gopkg.toml  LICENSE  README.md  app.go  build-multi-dockerfiles.sh  build.sh  vendor

# Resultado que nossa imagem não quebrou

vagrant@node01:~/dockerfiles/multistage$ docker container run --rm -it dicas:v2 /samples/1.txt
Counted 446 chars.
vagrant@node01:~/dockerfiles/multistage$ docker container run --rm -it dicas:v3 /samples/1.txt
Counted 446 chars.
vagrant@node01:~/dockerfiles/multistage$ docker container run --rm -it dicas:v4 /samples/1.txt
Counted 446 chars.
vagrant@node01:~/dockerfiles/multistage$ docker container run --rm -it dicas:v5 /samples/1.txt
Counted 446 chars.
vagrant@node01:~/dockerfiles/multistage$ docker container run --rm -it dicas:v6 /samples/1.txt
Counted 446 chars.
vagrant@node01:~/dockerfiles/multistage$ docker container run --rm -it dicas:v7 /samples/1.txt
Counted 446 chars.
vagrant@node01:~/dockerfiles/multistage$ docker container run --rm -it dicas:v8 /samples/1.txt
Counted 446 chars.
vagrant@node01:~/dockerfiles/multistage$

vagrant@node01:~/dockerfiles/multistage$ docker image build -t multistage:v1 .

vagrant@node01:~/dockerfiles/multistage$ docker image ls | egrep "REPOSITORY|multistage"
REPOSITORY                      TAG            IMAGE ID       CREATED          SIZE
multistage                      v1             62a926024cb3   24 seconds ago   699MB

FROM     golang:1.7.3 AS builder
WORKDIR  /go/src/github.com/alexellis/href-counter/
RUN      go get -d -v golang.org/x/net/html
COPY     app.go    .
RUN      CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM     alpine:latest
RUN      apk --no-cache add ca-certificates
WORKDIR  /root/
COPY     --from=builder /go/src/github.com/alexellis/href-counter/app .
CMD      ["./app"]

vagrant@node01:~/dockerfiles/multistage$ docker image ls | egrep "REPOSITORY|multistage"
REPOSITORY                      TAG            IMAGE ID       CREATED             SIZE
multistage                      v2             9e7f632b2904   8 seconds ago       11.7MB
multistage                      v1             62a926024cb3   39 minutes ago      699MB

vagrant@node01:~/dockerfiles/multistage$ cd 
vagrant@node01:~$ docker container run --rm -it -e url=https://youtube.com/caiodelgadonew multistage:v1
{"internal":5,"external":9}

vagrant@node01:~$ docker container run --rm -it -e url=https://youtube.com/caiodelgadonew multistage:v2
{"internal":5,"external":9}

FROM     alpine:latest
WORKDIR  /root/
COPY     --from=dicas:v8 /samples/1.txt .
CMD      ["cat","1.txt"]

vagrant@node01:~/dockerfiles/multistage$ docker image build -t multistage:v3 .

vagrant@node01:~/dockerfiles/multistage$ docker image ls | egrep "REPOSITORY|multistage"
REPOSITORY                      TAG            IMAGE ID       CREATED             SIZE
multistage                      v3             d705565ba5e3   49 seconds ago      5.6MB
multistage                      v2             9e7f632b2904   30 minutes ago      11.7MB
multistage                      v1             62a926024cb3   About an hour ago   699MB

vagrant@node01:~/dockerfiles/multistage$ docker container run --rm -it multistage:v3
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

vagrant@node01:~/dockerfiles/multistage$ cat ../dicas/app/samples/1.txt 
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

vagrant@node01:~/dockerfiles/multistage$ docker image prune
WARNING! This will remove all dangling images.
Are you sure you want to continue? [y/N] y
Deleted Images:
deleted: sha256:b20366e8df383d5933000d561be9c98b91d77c3779c440b9ad6d38292bd4963c
deleted: sha256:f329f178b80955f67a8cd2278e49a29d239546b6e63527bf7d75e9ba2497dfc4
deleted: sha256:c42df77985c2228d3349d20d9e3fa28411d2a9a9b2dab4b31b6b72a803ca8238
deleted: sha256:84845b5022dbdcc0da2490bc35a3b7fc4212b77e32e5290fbcebd5929658fc33
deleted: sha256:452552c36a396b2cb93c85379fa07c06d6729957de9b5a6ea6cfc75359505452
deleted: sha256:ff85bac7a24b84a5ee5caba198c393cdd33226a9482921c1261aade0c7540de3
deleted: sha256:24a50f800c3a5cfb641cf43f5df7936a5bd24fb557d63175285c31d238b665d5
deleted: sha256:2ee772443d979b60c7c9c1a7e621bfab8f78519bb99994566b1d5527378764a4
deleted: sha256:54d89d76415efda94d73a10329f48c7d6868b8fd2712aadb2469b73ea674bb5a
deleted: sha256:690b39e63eabc2e8e55cf55c864d0ec861d65eec4cf1866e152eaf203db4072b
deleted: sha256:726080852fb03718fe206aec50eb0047ec0c28dcd0c3ac7d1ec394907e7af448
deleted: sha256:6ad8d5d32d4c054c9caa2eddc4976f92fffbea21d2ecdb19d0b3804abc80abd5
deleted: sha256:87483f0d80fe347bf7c63102c494727b61bf0e265343a95aed1b5cae0bc6713c
deleted: sha256:7c3bbb5d902e05ad62a7ffdf9d4ce338faa4609349218bcc8cf81788f1896133
deleted: sha256:7f9c36b08bf988ac8c9813bcefea8c1649bf1dd2e4bf5a7532660c84f42c35d0

Total reclaimed space: 580.5MB

vagrant@node01:~/dockerfiles/multistage$ docker image ls
REPOSITORY                      TAG            IMAGE ID       CREATED             SIZE
multistage                      v3             d705565ba5e3   7 minutes ago       5.6MB
multistage                      v2             9e7f632b2904   37 minutes ago      11.7MB
multistage                      v1             62a926024cb3   About an hour ago   699MB
dicas                           v8             fff0b78fc542   2 hours ago         84.9MB
dicas                           v7             621e289a0fc9   2 hours ago         514MB
dicas                           v6             d34e15f8dec2   2 hours ago         467MB
dicas                           v5             ff093026a589   2 hours ago         480MB
dicas                           v4             834e0aea8cb6   3 hours ago         538MB
dicas                           3              39794586173e   20 hours ago        655MB
dicas                           v3             39794586173e   20 hours ago        655MB
dicas                           v2             d685d6fac049   22 hours ago        655MB
dicas                           v1             4052eccc6095   22 hours ago        655MB
exemplo                         v4             22d6bdb8b026   22 hours ago        1.24MB
exemplo                         v3             c69db7cbbb82   23 hours ago        1.24MB
exemplo                         v2             7328d9f6e247   25 hours ago        1.24MB
exemplo                         v1             c6322957b8fb   25 hours ago        1.24MB
teste                           latest         45be85758dc3   25 hours ago        5.6MB
echo-container                  latest         a520e15c2329   3 days ago          294MB
webserver                       latest         a520e15c2329   3 days ago          294MB
orbite82/echo-container         dca            a520e15c2329   3 days ago          294MB
alpine                          latest         021b3423115f   4 days ago          5.6MB
openjdk                         latest         c9022ce77bf9   2 weeks ago         467MB
openjdk                         8-jre-slim     621434f053cf   2 weeks ago         187MB
openjdk                         8-jre          5d392f8284fe   2 weeks ago         268MB
openjdk                         8              f67a59e543c1   2 weeks ago         514MB
debian                          9              2c3ad12c6ecf   2 weeks ago         101MB
debian                          latest         0980b84bde89   2 weeks ago         114MB
caiodelgadonew/echo-container   dca            b2b066932d4b   7 weeks ago         5.6MB
busybox                         latest         69593048aa3a   2 months ago        1.24MB
openjdk                         8-jre-alpine   f7a292bbb70c   2 years ago         84.9MB
golang                          1.7.3          ef15416724f6   4 years ago         672MB

# remove todas as imagens dos containes que não estão rodandos ou sem uso!

vagrant@node01:~/dockerfiles/multistage$ ducker image prune -a

=================

# Aula 4 : Docker DCA 04 - Volumes

https://www.youtube.com/watch?v=6_85T7GObJs&t=8s

vagrant@node01:~$ docker system info | grep Storage
 Storage Driver: overlay2
WARNING: No swap limit support

# opcional não precisa modificar ou criar

vagrant@node01:~$ sudo vim /etc/docker/daemon.json

{
  "storage-driver": "overlay2"
}

vagrant@node01:~$ sudo systemctl restart docker

vagrant@node01:~$ docker system info | grep Storage
 Storage Driver: overlay2
WARNING: No swap limit support

-v --volume
--mount

# volume do tipo bind mmount
# origin : /srv:
# destino : /srv
vagrant@node01:~$ docker container run -dit --name servdor -v /srv:/srv debian
f9a8ecb83089bf281caeeff3e512b261c4907e260150c4e179bc925b03fe6f0d

# df -Th : listar todos os filesystem, file sistem disk spcae usage | liste todas as partições em formato humano traduzir

vagrant@node01:~$ pwd
/home/vagrant

vagrant@node01:~$ cd /

vagrant@node01:/$ pwd
/

vagrant@node01:/$ docker container run -dit --name servidor -v /srv:/srv debian
523230e8660cea646b1b9f610bc6451e5f50df5456e6198efe35d16ac87ebc43

vagrant@node01:/$ docker container exec servidor df -Th
Filesystem     Type     Size  Used Avail Use% Mounted on
overlay        overlay   39G  6.3G   33G  17% /
tmpfs          tmpfs     64M     0   64M   0% /dev
tmpfs          tmpfs    493M     0  493M   0% /sys/fs/cgroup
shm            tmpfs     64M     0   64M   0% /dev/shm
/dev/sda1      ext4      39G  6.3G   33G  17% /srv
tmpfs          tmpfs    493M     0  493M   0% /proc/acpi
tmpfs          tmpfs    493M     0  493M   0% /proc/scsi
tmpfs          tmpfs    493M     0  493M   0% /sys/firmware

vagrant@node01:/$ ls -lha
total 100K
drwxr-xr-x  24 root    root    4.0K Aug 11 15:01 .
drwxr-xr-x  24 root    root    4.0K Aug 11 15:01 ..
drwxr-xr-x   2 root    root    4.0K Aug  9 15:27 bin
drwxr-xr-x   3 root    root    4.0K Aug  9 15:28 boot
drwxr-xr-x  16 root    root    3.6K Aug 11 15:01 dev
drwxr-xr-x  94 root    root    4.0K Aug  9 15:27 etc
drwxr-xr-x   4 root    root    4.0K Aug  6 17:27 home
lrwxrwxrwx   1 root    root      34 Aug  9 15:28 initrd.img -> boot/initrd.img-4.15.0-153-generic
lrwxrwxrwx   1 root    root      34 Jul 21 00:36 initrd.img.old -> boot/initrd.img-4.15.0-151-generic
drwxr-xr-x  21 root    root    4.0K Jul 21 00:45 lib
drwxr-xr-x   2 root    root    4.0K Jul 21 00:35 lib64
drwx------   2 root    root     16K Jul 21 00:37 lost+found
drwxr-xr-x   2 root    root    4.0K Jul 21 00:34 media
drwxr-xr-x   2 root    root    4.0K Jul 21 00:34 mnt
drwxr-xr-x   3 root    root    4.0K Aug  6 17:29 opt
dr-xr-xr-x 113 root    root       0 Aug 11 15:01 proc
drwx------   3 root    root    4.0K Aug  6 17:27 root
drwxr-xr-x  26 root    root     920 Aug 11 18:40 run
drwxr-xr-x   2 root    root     12K Aug  9 15:26 sbin
drwxr-xr-x   2 root    root    4.0K Aug  6 17:27 snap
drwxr-xr-x   2 root    root    4.0K Jul 21 00:34 srv
dr-xr-xr-x  13 root    root       0 Aug 11 15:00 sys
drwxrwxrwt   9 root    root    4.0K Aug 11 20:46 tmp
drwxr-xr-x  12 root    root    4.0K Aug  6 17:28 usr
drwxrwxr-x   1 vagrant vagrant 4.0K Aug  4 15:24 vagrant
drwxr-xr-x  13 root    root    4.0K Jul 21 00:36 var
lrwxrwxrwx   1 root    root      31 Aug  9 15:28 vmlinuz -> boot/vmlinuz-4.15.0-153-generic
lrwxrwxrwx   1 root    root      31 Jul 21 00:36 vmlinuz.old -> boot/vmlinuz-4.15.0-151-generi

# lista caminho completo recursivo : ls -lR /srv
vagrant@node01:/$ docker container exec servidor ls -lR /srv
/srv:
total 0

vagrant@node01:/$ docker container exec servidor ls -l /srv
total 0

vagrant@node01:/$ sudo cp -r ~/dockerfiles/ /srv

vagrant@node01:/$ docker container exec servidor ls -lR /srv
/srv:
total 4
drwxr-xr-x 7 root root 4096 Aug 11 20:53 dockerfiles

/srv/dockerfiles:
total 20
drwxr-xr-x 3 root root 4096 Aug 11 20:53 dicas
drwxr-xr-x 3 root root 4096 Aug 11 20:53 dockerfiles
drwxr-xr-x 2 root root 4096 Aug 11 20:53 echo-container
drwxr-xr-x 4 root root 4096 Aug 11 20:53 multistage
drwxr-xr-x 2 root root 4096 Aug 11 20:53 webserver

/srv/dockerfiles/dicas:
total 36
-rw-r--r-- 1 root root  155 Aug 11 20:53 Dockerfile
-rw-r--r-- 1 root root  179 Aug 11 20:53 Dockerfile1
-rw-r--r-- 1 root root  228 Aug 11 20:53 Dockerfile2
-rw-r--r-- 1 root root  292 Aug 11 20:53 Dockerfile3
-rw-r--r-- 1 root root  287 Aug 11 20:53 Dockerfile4
-rw-r--r-- 1 root root  347 Aug 11 20:53 Dockerfile5
-rw-r--r-- 1 root root  142 Aug 11 20:53 Dockerfile6
-rw-r--r-- 1 root root  144 Aug 11 20:53 Dockerfile7
drwxr-xr-x 5 root root 4096 Aug 11 20:53 app

/srv/dockerfiles/dicas/app:
total 24
-rw-r--r-- 1 root root 1044 Aug 11 20:53 Count.class
-rw-r--r-- 1 root root 2090 Aug 11 20:53 Count.java
-rw-r--r-- 1 root root  145 Aug 11 20:53 README.md
-rw-r--r-- 1 root root   18 Aug 11 20:53 manifest
drwxr-xr-x 2 root root 4096 Aug 11 20:53 samples
drwxr-xr-x 2 root root 4096 Aug 11 20:53 target

/srv/dockerfiles/dicas/app/samples:
total 8
-rw-r--r-- 1 root root 446 Aug 11 20:53 1.txt
-rw-r--r-- 1 root root 702 Aug 11 20:53 2.txt

/srv/dockerfiles/dicas/app/target:
total 12
-rw-r--r-- 1 root root 1088 Aug 11 20:53 app.jar
-rw-r--r-- 1 root root  446 Aug 11 20:53 sample.txt
-rw-r--r-- 1 root root  702 Aug 11 20:53 sample2.txt

/srv/dockerfiles/dockerfiles:
total 4
drwxr-xr-x 4 root root 4096 Aug 11 20:53 exemplo1

/srv/dockerfiles/dockerfiles/exemplo1:
total 8
drwxr-xr-x 3 root root 4096 Aug 11 20:53 context
drwxr-xr-x 2 root root 4096 Aug 11 20:53 image

/srv/dockerfiles/dockerfiles/exemplo1/context:
total 8
-rw-r--r-- 1 root root   29 Aug 11 20:53 conteudo.txt
drwxr-xr-x 8 root root 4096 Aug 11 20:53 log

/srv/dockerfiles/dockerfiles/exemplo1/context/log:
total 600
drwxr-xr-x 2 root root   4096 Aug 11 20:53 apt
-rw-r----- 1 root root  19739 Aug 11 20:53 auth.log
-rw-r----- 1 root root      0 Aug 11 20:53 btmp
-rw-r----- 1 root root   8199 Aug 11 20:53 cloud-init-output.log
-rw-r--r-- 1 root root 182190 Aug 11 20:53 cloud-init.log
drwxr-xr-x 2 root root   4096 Aug 11 20:53 dist-upgrade
-rw-r--r-- 1 root root  28703 Aug 11 20:53 dpkg.log
drwxr-xr-x 3 root root   4096 Aug 11 20:53 journal
-rw-r----- 1 root root 101905 Aug 11 20:53 kern.log
drwxr-xr-x 2 root root   4096 Aug 11 20:53 landscape
-rw-r--r-- 1 root root 292584 Aug 11 20:53 lastlog
drwxr-xr-x 2 root root   4096 Aug 11 20:53 lxd
-rw-r----- 1 root root 216950 Aug 11 20:53 syslog
-rw------- 1 root root  64128 Aug 11 20:53 tallylog
-rw------- 1 root root    664 Aug 11 20:53 ubuntu-advantage.log
drwxr-x--- 2 root root   4096 Aug 11 20:53 unattended-upgrades
-rw-r--r-- 1 root root   6912 Aug 11 20:53 wtmp

/srv/dockerfiles/dockerfiles/exemplo1/context/log/apt:
total 40
-rw-r--r-- 1 root root 20208 Aug 11 20:53 eipp.log.xz
-rw-r--r-- 1 root root  3171 Aug 11 20:53 history.log
-rw-r----- 1 root root 15372 Aug 11 20:53 term.log

/srv/dockerfiles/dockerfiles/exemplo1/context/log/dist-upgrade:
total 0

/srv/dockerfiles/dockerfiles/exemplo1/context/log/journal:
total 4
drwxr-xr-x 2 root root 4096 Aug 11 20:53 d217dd6f2d004f42bb5d31510a886176

/srv/dockerfiles/dockerfiles/exemplo1/context/log/journal/d217dd6f2d004f42bb5d31510a886176:
total 16384
-rw-r----- 1 root root 8388608 Aug 11 20:53 system.journal
-rw-r----- 1 root root 8388608 Aug 11 20:53 user-1000.journal

/srv/dockerfiles/dockerfiles/exemplo1/context/log/landscape:
total 0
-rw-r--r-- 1 root root 0 Aug 11 20:53 sysinfo.log

/srv/dockerfiles/dockerfiles/exemplo1/context/log/lxd:
total 0

/srv/dockerfiles/dockerfiles/exemplo1/context/log/unattended-upgrades:
total 20
-rw-r--r-- 1 root root 8897 Aug 11 20:53 unattended-upgrades-dpkg.log
-rw-r--r-- 1 root root  112 Aug 11 20:53 unattended-upgrades-shutdown.log
-rw-r--r-- 1 root root 1107 Aug 11 20:53 unattended-upgrades.log

/srv/dockerfiles/dockerfiles/exemplo1/image:
total 4
-rw-r--r-- 1 root root 60 Aug 11 20:53 Dockerfile

/srv/dockerfiles/echo-container:
total 4
-rw-r--r-- 1 root root 56 Aug 11 20:53 Dockerfile

/srv/dockerfiles/multistage:
total 44
-rw-r--r-- 1 root root  106 Aug 11 20:53 Dockerfile
-rw-r--r-- 1 root root  234 Aug 11 20:53 Dockerfile1
-rw-r--r-- 1 root root  399 Aug 11 20:53 Dockerfile2
-rw-r--r-- 1 root root  510 Aug 11 20:53 Gopkg.lock
-rw-r--r-- 1 root root  719 Aug 11 20:53 Gopkg.toml
-rw-r--r-- 1 root root 1067 Aug 11 20:53 LICENSE
-rw-r--r-- 1 root root 1167 Aug 11 20:53 README.md
-rw-r--r-- 1 root root 1709 Aug 11 20:53 app.go
-rwxr-xr-x 1 root root  382 Aug 11 20:53 build-multi-dockerfiles.sh
-rwxr-xr-x 1 root root  128 Aug 11 20:53 build.sh
drwxr-xr-x 3 root root 4096 Aug 11 20:53 vendor

/srv/dockerfiles/multistage/vendor:
total 4
drwxr-xr-x 3 root root 4096 Aug 11 20:53 golang.org

/srv/dockerfiles/multistage/vendor/golang.org:
total 4
drwxr-xr-x 3 root root 4096 Aug 11 20:53 x

/srv/dockerfiles/multistage/vendor/golang.org/x:
total 4
drwxr-xr-x 3 root root 4096 Aug 11 20:53 net

/srv/dockerfiles/multistage/vendor/golang.org/x/net:
total 20
-rw-r--r-- 1 root root  173 Aug 11 20:53 AUTHORS
-rw-r--r-- 1 root root  170 Aug 11 20:53 CONTRIBUTORS
-rw-r--r-- 1 root root 1479 Aug 11 20:53 LICENSE
-rw-r--r-- 1 root root 1303 Aug 11 20:53 PATENTS
drwxr-xr-x 3 root root 4096 Aug 11 20:53 html

/srv/dockerfiles/multistage/vendor/golang.org/x/net/html:
total 256
drwxr-xr-x 2 root root   4096 Aug 11 20:53 atom
-rw-r--r-- 1 root root   2618 Aug 11 20:53 const.go
-rw-r--r-- 1 root root   3415 Aug 11 20:53 doc.go
-rw-r--r-- 1 root root   4925 Aug 11 20:53 doctype.go
-rw-r--r-- 1 root root 114594 Aug 11 20:53 entity.go
-rw-r--r-- 1 root root   6053 Aug 11 20:53 escape.go
-rw-r--r-- 1 root root   6913 Aug 11 20:53 foreign.go
-rw-r--r-- 1 root root   5355 Aug 11 20:53 node.go
-rw-r--r-- 1 root root  57896 Aug 11 20:53 parse.go
-rw-r--r-- 1 root root   7062 Aug 11 20:53 render.go
-rw-r--r-- 1 root root  30558 Aug 11 20:53 token.go

/srv/dockerfiles/multistage/vendor/golang.org/x/net/html/atom:
total 44
-rw-r--r-- 1 root root  2321 Aug 11 20:53 atom.go
-rw-r--r-- 1 root root 11995 Aug 11 20:53 gen.go
-rw-r--r-- 1 root root 27822 Aug 11 20:53 table.go

/srv/dockerfiles/webserver:
total 4
-rw-r--r-- 1 root root 149 Aug 11 20:53 Dockerfile

vagrant@node01:/$ docker container exec servidor ls -l /srv
total 4
drwxr-xr-x 7 root root 4096 Aug 11 20:53 dockerfiles

vagrant@node01:/$ docker container exec servidor touch /srv/arquivo_teste

vagrant@node01:/$ docker container exec servidor ls -l /srv
total 4
-rw-r--r-- 1 root root    0 Aug 11 20:57 arquivo_teste
drwxr-xr-x 7 root root 4096 Aug 11 20:53 dockerfiles

vagrant@node01:/$ docker container rm -f servidor
servidor

# volume anonimo

vagrant@node01:/$ docker container run --name servidor -v /volume debian

vagrant@node01:/$ docker volume ls
DRIVER    VOLUME NAME
local     fad270c09c4106680a4ac92f01778615e81290336586c5c17f2441efc8dd239f

vagrant@node01:/$ docker container inspect servidor | grep volume
                "Type": "volume",
                "Source": "/var/lib/docker/volumes/fad270c09c4106680a4ac92f01778615e81290336586c5c17f2441efc8dd239f/_data",
                "Destination": "/volume",
                "/volume": {}

vagrant@node01:/$ docker volume inspect fad270c09c4106680a4ac92f01778615e81290336586c5c17f2441efc8dd239f
[
    {
        "CreatedAt": "2021-08-11T21:01:25Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/fad270c09c4106680a4ac92f01778615e81290336586c5c17f2441efc8dd239f/_data",
        "Name": "fad270c09c4106680a4ac92f01778615e81290336586c5c17f2441efc8dd239f",
        "Options": null,
        "Scope": "local"
    }
]

# passar sempre -dit se nçao ele morre

vagrant@node01:/$ docker container run -dit --name servidor -v /volume debian

vagrant@node01:/$ docker container rm -f servidor
servidor

vagrant@node01:/$ docker container run -dit --name servidor -v /volume debian
cd73e7d1ce8796bca08c13910266c27c463fde3ccc21ed1e01d46815844148e0

vagrant@node01:/$ docker volume ls
DRIVER    VOLUME NAME
local     24c0f9fd833cef92d1d0ef79cfce7708e43600bb24c72b4fe6b0bfe737c39e41
local     25b0d8ad206db7c80659eb847ee482c639d1c048702511797b63f8d4547cbf00
local     fad270c09c4106680a4ac92f01778615e81290336586c5c17f2441efc8dd239f
vagrant@node01:/$ 

vagrant@node01:/$ docker container exec servidor df -Th
Filesystem     Type     Size  Used Avail Use% Mounted on
overlay        overlay   39G  6.4G   33G  17% /
tmpfs          tmpfs     64M     0   64M   0% /dev
tmpfs          tmpfs    493M     0  493M   0% /sys/fs/cgroup
shm            tmpfs     64M     0   64M   0% /dev/shm
/dev/sda1      ext4      39G  6.4G   33G  17% /volume
tmpfs          tmpfs    493M     0  493M   0% /proc/acpi
tmpfs          tmpfs    493M     0  493M   0% /proc/scsi
tmpfs          tmpfs    493M     0  493M   0% /sys/firmware

vagrant@node01:/$ docker container exec servidor ls -lR volume
volume:
total 0

vagrant@node01:/$ docker container exec servidor touch /volume/arquivo_do_volume

vagrant@node01:/$ docker container exec servidor ls -lR volume
volume:
total 0
-rw-r--r-- 1 root root 0 Aug 11 21:10 arquivo_do_volume

vagrant@node01:/$ docker container inspect servidor | grep volume
                "Type": "volume",
                "Source": "/var/lib/docker/volumes/25b0d8ad206db7c80659eb847ee482c639d1c048702511797b63f8d4547cbf00/_data",
                "Destination": "/volume",
                "/volume": {}

# /var/lib/docker/volumes/ : padrão aonde é criado os volumes do docker

vagrant@node01:/$ ls /var/lib/docker/volumes/25b0d8ad206db7c80659eb847ee482c639d1c048702511797b63f8d4547cbf00/_data
arquivo_do_volume

vagrant@node01:/$ sudo touch /var/lib/docker/volumes/25b0d8ad206db7c80659eb847ee482c639d1c048702511797b63f8d4547cbf00/_data/arquivo2

vagrant@node01:/$ ls /var/lib/docker/volumes/25b0d8ad206db7c80659eb847ee482c639d1c048702511797b63f8d4547cbf00/_data
arquivo2  arquivo_do_volume

vagrant@node01:/$ docker container exec servidor ls /volume
arquivo2
arquivo_do_volume

vagrant@node01:/$ docker container rm -f servidor
servidor

vagrant@node01:~/dockerfiles$ docker container run -dit --name servidor2 -v volume:/^Clume debian

vagrant@node01:~/dockerfiles$ docker volume ls
DRIVER    VOLUME NAME
local     24c0f9fd833cef92d1d0ef79cfce7708e43600bb24c72b4fe6b0bfe737c39e41
local     25b0d8ad206db7c80659eb847ee482c639d1c048702511797b63f8d4547cbf00
local     fad270c09c4106680a4ac92f01778615e81290336586c5c17f2441efc8dd239f
local     volume

# volume do tipo nomeado

vagrant@node01:~/dockerfiles$ docker container rm -f servidor
servidor

vagrant@node01:~/dockerfiles$ docker container run -dit --name servidor -v volume:/volume debian
2ebbd0b88fadcec8169dadf4e0d19e9804a1eb5afdccf85b408be2f37848ba59
vagrant@node01:~/dockerfiles$ docker volume ls
DRIVER    VOLUME NAME
local     24c0f9fd833cef92d1d0ef79cfce7708e43600bb24c72b4fe6b0bfe737c39e41
local     25b0d8ad206db7c80659eb847ee482c639d1c048702511797b63f8d4547cbf00
local     fad270c09c4106680a4ac92f01778615e81290336586c5c17f2441efc8dd239f
local     volume

vagrant@node01:~/dockerfiles$ ls -l /var/lib/docker/volumes/volume/_data
total 0
vagrant

# volume do tipo mount

vagrant@node01:~/dockerfiles$ docker container run -dit --name servidor2 --mount source=volume2,target=/volume2 debian 
620912781c55fdd3beb9df027da35f8fc6c2003a95b72011190d366f6e772de0

vagrant@node01:~/dockerfiles$ docker volume ls
DRIVER    VOLUME NAME
local     24c0f9fd833cef92d1d0ef79cfce7708e43600bb24c72b4fe6b0bfe737c39e41
local     25b0d8ad206db7c80659eb847ee482c639d1c048702511797b63f8d4547cbf00
local     fad270c09c4106680a4ac92f01778615e81290336586c5c17f2441efc8dd239f
local     volume
local     volume2

vagrant@node01:~/dockerfiles$ docker container inspect servidor --format '{{json .Mounts}}'
[{"Type":"volume","Name":"volume","Source":"/var/lib/docker/volumes/volume/_data","Destination":"/volume","Driver":"local","Mode":"z","RW":true,"Propagation":""}]

sudo apt-get install jq

vagrant@node01:~/dockerfiles$ docker container inspect servidor --format '{{json .Mounts}}' | jq
[
  {
    "Type": "volume",
    "Name": "volume",
    "Source": "/var/lib/docker/volumes/volume/_data",
    "Destination": "/volume",
    "Driver": "local",
    "Mode": "z",
    "RW": true,
    "Propagation": ""
  }
]

vagrant@node01:~/dockerfiles$ docker container inspect servidor2 --format '{{json .Mounts}}' | jq
[
  {
    "Type": "volume",
    "Name": "volume2",
    "Source": "/var/lib/docker/volumes/volume2/_data",
    "Destination": "/volume2",
    "Driver": "local",
    "Mode": "z",
    "RW": true,
    "Propagation": ""
  }
]

SELINUX -> RHEL -> SECURITY 
:z --> bind mount COMPARTILHA entre multiplos containers # "Mode": "z",
:Z --> binjd mount é PRIVADO, NÂO COMPARTILHA
appamor --> DEBIAN --> SECURITY

vagrant@node01:~/dockerfiles$ docker volume ls
DRIVER    VOLUME NAME
local     24c0f9fd833cef92d1d0ef79cfce7708e43600bb24c72b4fe6b0bfe737c39e41
local     25b0d8ad206db7c80659eb847ee482c639d1c048702511797b63f8d4547cbf00
local     fad270c09c4106680a4ac92f01778615e81290336586c5c17f2441efc8dd239f
local     volume
local     volume2
vagrant@node01:~/dockerfiles$ docker volume ls -q
24c0f9fd833cef92d1d0ef79cfce7708e43600bb24c72b4fe6b0bfe737c39e41
25b0d8ad206db7c80659eb847ee482c639d1c048702511797b63f8d4547cbf00
fad270c09c4106680a4ac92f01778615e81290336586c5c17f2441efc8dd239f
volume
volume2

vagrant@node01:~/dockerfiles$ docker volume ls
DRIVER    VOLUME NAME
local     volume
local     volume2

vagrant@node01:~/dockerfiles$ docker volume rm $(docker volume ls -q)
24c0f9fd833cef92d1d0ef79cfce7708e43600bb24c72b4fe6b0bfe737c39e41
25b0d8ad206db7c80659eb847ee482c639d1c048702511797b63f8d4547cbf00
fad270c09c4106680a4ac92f01778615e81290336586c5c17f2441efc8dd239f
Error response from daemon: remove volume: volume is in use - [2ebbd0b88fadcec8169dadf4e0d19e9804a1eb5afdccf85b408be2f37848ba59]
Error response from daemon: remove volume2: volume is in use - [620912781c55fdd3beb9df027da35f8fc6c2003a95b72011190d366f6e772de0]

TMPFS --> Temporaries File Storage

vagrant@node01:~/dockerfiles$ docker container run -dit --name tmpfstest1 --mount type=tmpfs,destination=/app debian
d9aef4909fea0b41314b9b771d22f7a97337272d6fd340f6e4c8e714b4da71a9

vagrant@node01:~/dockerfiles$ docker container run -dit --name tmpfstest2 --tmpfs /app debian
7d128e75afda4e7056495d06a2ea09d9a2065229002ac54ac4485c28ea6c22a9

vagrant@node01:~/dockerfiles$ docker container inspect tmpfstest1 --format '{{json .Mounts }}' | jq
[
  {
    "Type": "tmpfs",
    "Source": "",
    "Destination": "/app",
    "Mode": "",
    "RW": true,
    "Propagation": ""
  }
]

vagrant@node01:~/dockerfiles$ docker container inspect tmpfstest2 -f '{{json .HostConfig.Tmpfs }}' | jq
{
  "/app": ""
}

# volumes que são montados dentro da memoria ram, por isso não conseguimos ver o volume! 
vagrant@node01:~/dockerfiles$ docker volume ls
DRIVER    VOLUME NAM

vagrant@node01:~/dockerfiles$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED         STATUS         PORTS     NAMES
7d128e75afda   debian    "bash"    7 minutes ago   Up 7 minutes             tmpfstest2
d9aef4909fea   debian    "bash"    8 minutes ago   Up 8 minutes             tmpfstest1

vagrant@node01:~/dockerfiles$ docker container exec tmpfstest1 df -h
Filesystem      Size  Used Avail Use% Mounted on
overlay          39G  6.6G   33G  17% /
tmpfs            64M     0   64M   0% /dev
tmpfs           493M     0  493M   0% /sys/fs/cgroup
shm              64M     0   64M   0% /dev/shm
tmpfs           493M     0  493M   0% /app
/dev/sda1        39G  6.6G   33G  17% /etc/hosts
tmpfs           493M     0  493M   0% /proc/acpi
tmpfs           493M     0  493M   0% /proc/scsi
tmpfs           493M     0  493M   0% /sys/firmware

vagrant@node01:~/dockerfiles$ docker container exec tmpfstest2 df -h
Filesystem      Size  Used Avail Use% Mounted on
overlay          39G  6.6G   33G  17% /
tmpfs            64M     0   64M   0% /dev
tmpfs           493M     0  493M   0% /sys/fs/cgroup
shm              64M     0   64M   0% /dev/shm
tmpfs           493M     0  493M   0% /app
/dev/sda1        39G  6.6G   33G  17% /etc/hosts
tmpfs           493M     0  493M   0% /proc/acpi
tmpfs           493M     0  493M   0% /proc/scsi
tmpfs           493M     0  493M   0% /sys/firmware

tmpfs-size --> TAMANHO EM BYTES
tmpfs-mode --> PERMISSIOANAMENTO DO TMPFS em OCTAL 700 775

vagrant@node01:~/dockerfiles$ docker container run -dit --name tmpfstest --mount type=tmpfs,destination=/app,tmpfs-size=100M debian
1086e1a621b5fd58bbb5a845a65dfbddcfdadb4aae9e4f7a1d283824b9f27c1f

vagrant@node01:~/dockerfiles$ docker container inspect tmpfstest --format '{{json .HostConfig.Mounts }}' | jq
[
  {
    "Type": "tmpfs",
    "Target": "/app",
    "TmpfsOptions": {
      "SizeBytes": 104857600
    }
  }
]

vagrant@node01:~/dockerfiles$ docker container exec tmpfstest df -Th
Filesystem     Type     Size  Used Avail Use% Mounted on
overlay        overlay   39G  6.6G   33G  17% /
tmpfs          tmpfs     64M     0   64M   0% /dev
tmpfs          tmpfs    493M     0  493M   0% /sys/fs/cgroup
shm            tmpfs     64M     0   64M   0% /dev/shm
tmpfs          tmpfs    100M     0  100M   0% /app
/dev/sda1      ext4      39G  6.6G   33G  17% /etc/hosts
tmpfs          tmpfs    493M     0  493M   0% /proc/acpi
tmpfs          tmpfs    493M     0  493M   0% /proc/scsi
tmpfs          tmpfs    493M     0  493M   0% /sys/firmware

vagrant@node01:~/dockerfiles$ docker container rm -f $(docker container ls -aq)
1086e1a621b5
7d128e75afda
d9aef4909fea

# Backups

vagrant@node01:~/dockerfiles$ docker container run -dit -v /webdata --name webserver debian
8880fcd00a20c004b74dcfa52335d2f9ed754bab37e7d2698506b98da2cf09b8

vagrant@node01:~/dockerfiles$ docker volume ls
DRIVER    VOLUME NAME

# 1 Container com 1 Volume Anonimo
# Colocamos conteudo no volume Anonimo
# Quero fazer o backup deste volume

# --volumes-from --> Copia o volume de um outro container (LINK) 

vagrant@node01:~$ docker container run -dit --volumes-from webserver --name volumetest debian
fb9fe9f1e453ebd53aa0830e82d35a128976826bcc9ec7e25a102757a130108c

vagrant@node01:~$ docker container exec volumetest df -Th
Filesystem     Type     Size  Used Avail Use% Mounted on
overlay        overlay   39G  6.6G   33G  17% /
tmpfs          tmpfs     64M     0   64M   0% /dev
tmpfs          tmpfs    493M     0  493M   0% /sys/fs/cgroup
shm            tmpfs     64M     0   64M   0% /dev/shm
/dev/sda1      ext4      39G  6.6G   33G  17% /webdata
tmpfs          tmpfs    493M     0  493M   0% /proc/acpi
tmpfs          tmpfs    493M     0  493M   0% /proc/scsi
tmpfs          tmpfs    493M     0  493M   0% /sys/firmware

/dev/sda1      ext4      39G  6.6G   33G  17% /webdata

vagrant@node01:~$ docker container exec volumetest ls /webdata
dockerfiles

vagrant@node01:~$ docker container inspect webserver --format '{{json .Mounts }}' | jq
[
  {
    "Type": "volume",
    "Name": "6f109d6a526d452df8f538a2b49e55add9470db865bdfd3d09c40505a2449da9",
    "Source": "/var/lib/docker/volumes/6f109d6a526d452df8f538a2b49e55add9470db865bdfd3d09c40505a2449da9/_data",
    "Destination": "/webdata",
    "Driver": "local",
    "Mode": "",
    "RW": true,
    "Propagation": ""
  }
]


vagrant@node01:~$ docker container inspect volumetest --format '{{json .Mounts }}' | jq
[
  {
    "Type": "volume",
    "Name": "6f109d6a526d452df8f538a2b49e55add9470db865bdfd3d09c40505a2449da9",
    "Source": "/var/lib/docker/volumes/6f109d6a526d452df8f538a2b49e55add9470db865bdfd3d09c40505a2449da9/_data",
    "Destination": "/webdata",
    "Driver": "local",
    "Mode": "",
    "RW": true,
    "Propagation": ""
  }
]

vagrant@node01:~$ docker container ls
CONTAINER ID   IMAGE     COMMAND   CREATED          STATUS          PORTS     NAMES
8880fcd00a20   debian    "bash"    23 minutes ago   Up 23 minutes             webserver

vagrant@node01:~$ docker container rm -f volumetest
volumetest

vagrant@node01:~$ mkdir ~/backup

vagrant@node01:~$ ls
backup  dockerfiles

vagrant@node01:~$ cd backup/

vagrant@node01:~/backup$ 

pwd --> PRINT WORKING DIRECTORY