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