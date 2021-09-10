# Aula 0 : Docker DCA 00 - Preparação da Máquina (Windows / Linux):  https://www.youtube.com/watch?v=U-GGoWq26C4

# https://github.com/caiodelgadonew/docker/blob/main/manuscript/00-intro.md

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

# https://github.com/caiodelgadonew/docker/blob/main/manuscript/01-fundamentos.md

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

sudo apt-get update -y

sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

ls /etc/apt/sources.list.d/  

cat /etc/apt/sources.list.d/docker.list

sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo apt-get update -y

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

sudo groupadd docker

sudo usermod -aG docker $USER

newgrp docker

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

# Aula 2 : Docker DCA 02 - Comandos Docker e Imagens : https://www.youtube.com/watch?v=nChxlWTDAak&t=10s

# https://github.com/caiodelgadonew/docker/blob/main/manuscript/02-imagens.md

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

# Aula 03 : Docker DCA 03 - Docker Images - Melhores Práticas e Multistage Build : https://www.youtube.com/watch?v=e9bEdFo_ZLc&t=6s

# https://github.com/caiodelgadonew/docker/blob/main/manuscript/03-volumes.md

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

# Aula 4 : Docker DCA 04 - Volumes : https://www.youtube.com/watch?v=6_85T7GObJs&t=8s

# https://github.com/caiodelgadonew/docker/blob/main/manuscript/04-network.md

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

# passar sempre -dit se nao ele morre

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

vagrant@node01:~$ docker container exec volumetest ls /webdata
dockerfiles

vagrant@node01:~/backup$ docker container run --rm --volumes-from webserver -v $(pwd):/backup alpine tar cvf backup.tar /webdata
tar: removing leading '/' from member names
webdata/

vagrant@node01:~/backup$ docker container run --rm --volumes-from webserver -v $(pwd):/backup alpine tar cvf /backup/backup.tar /webdata

vagrant@node01:~/backup$ ls -lha
total 18M
drwxrwxr-x 2 vagrant vagrant 4.0K Aug 17 18:22 .
drwxr-xr-x 8 vagrant vagrant 4.0K Aug 17 15:57 ..
-rw-r--r-- 1 root    root     18M Aug 17 18:22 backup.tar

vagrant@node01:~/backup$ tar -tvf backup.tar

vagrant@node01:~/backup$ tar -tvf backup.tar
drwxr-xr-x root/root         0 2021-08-17 15:35 webdata/
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/
drwxrwxr-x 1000/1000         0 2021-08-10 16:49 webdata/dockerfiles/multistage/
-rw-rw-r-- 1000/1000       719 2021-08-10 15:26 webdata/dockerfiles/multistage/Gopkg.toml
-rw-rw-r-- 1000/1000      1067 2021-08-10 15:26 webdata/dockerfiles/multistage/LICENSE
-rw-rw-r-- 1000/1000      1709 2021-08-10 15:26 webdata/dockerfiles/multistage/app.go
-rw-rw-r-- 1000/1000       106 2021-08-10 16:49 webdata/dockerfiles/multistage/Dockerfile
-rw-rw-r-- 1000/1000       234 2021-08-10 15:39 webdata/dockerfiles/multistage/Dockerfile1
-rw-rw-r-- 1000/1000       510 2021-08-10 15:26 webdata/dockerfiles/multistage/Gopkg.lock
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/
-rw-rw-r-- 1000/1000      1479 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/LICENSE
-rw-rw-r-- 1000/1000       173 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/AUTHORS
-rw-rw-r-- 1000/1000      1303 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/PATENTS
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/
-rw-rw-r-- 1000/1000      3415 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/doc.go
-rw-rw-r-- 1000/1000      6913 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/foreign.go
-rw-rw-r-- 1000/1000    114594 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/entity.go
-rw-rw-r-- 1000/1000     30558 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/token.go
-rw-rw-r-- 1000/1000     57896 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/parse.go
-rw-rw-r-- 1000/1000      6053 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/escape.go
-rw-rw-r-- 1000/1000      7062 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/render.go
-rw-rw-r-- 1000/1000      2618 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/const.go
-rw-rw-r-- 1000/1000      4925 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/doctype.go
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/atom/
-rw-rw-r-- 1000/1000     11995 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/atom/gen.go
-rw-rw-r-- 1000/1000      2321 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/atom/atom.go
-rw-rw-r-- 1000/1000     27822 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/atom/table.go
-rw-rw-r-- 1000/1000      5355 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/node.go
-rw-rw-r-- 1000/1000       170 2021-08-10 15:26 webdata/dockerfiles/multistage/vendor/golang.org/x/net/CONTRIBUTORS
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/branches/
-rw-rw-r-- 1000/1000        23 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/HEAD
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/refs/
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/refs/remotes/
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/refs/remotes/origin/
-rw-rw-r-- 1000/1000        32 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/refs/remotes/origin/HEAD
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/refs/tags/
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/refs/heads/
-rw-rw-r-- 1000/1000        41 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/refs/heads/master
-rw-rw-r-- 1000/1000       114 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/packed-refs
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/c0/
-r--r--r-- 1000/1000       163 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/c0/a2f2b1f37cce4a19012243802e3768dcb0dd38
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/19/
-r--r--r-- 1000/1000       110 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/19/a30cce68f5824f49b6037404c6422be1831767
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/e7/
-r--r--r-- 1000/1000       190 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/e7/e168db78bb35e64bcd933f4592174e25a45999
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/93/
-r--r--r-- 1000/1000       345 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/93/ce04d50131dbbf7fd86da6c6ad7447ca39b9be
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/6b/
-r--r--r-- 1000/1000        34 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/6b/f4d21621593804e225541bcedec694c1dfae42
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/01/
-r--r--r-- 1000/1000      2373 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/01/477a96397c971333726e0f248d54ae05206cdb
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/0a/
-r--r--r-- 1000/1000       246 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/0a/24abe460f5b52dedcbcaff6d3d40573e056965
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/35/
-r--r--r-- 1000/1000       189 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/35/79b9ef8e54e57112e0be54f1ad19afab4b9cdd
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/d8/
-r--r--r-- 1000/1000      2502 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/d8/561396200ea6412a5717e0a3bfbdd85ac79ed0
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/pack/
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/be/
-r--r--r-- 1000/1000       246 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/be/0d97374ca3dd0043bb20cc081817eba1d41443
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/73/
-r--r--r-- 1000/1000       674 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/73/3099041f84fa1e58611ab2e11af51c1f26d1d2
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/a1/
-r--r--r-- 1000/1000       189 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/a1/0e89c5502c3ded53098fb809d6065ec0f17e10
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/cd/
-r--r--r-- 1000/1000      1150 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/cd/0a8ac15451b5d585d965bc178d0b80effb682d
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/84/
-r--r--r-- 1000/1000       179 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/84/624ac0e887294a56d877fc6dfcdf4c37ef31f4
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/5d/
-r--r--r-- 1000/1000      4920 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/5d/052781bceaf8504923cff6da7d4a5f22044169
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/a0/
-r--r--r-- 1000/1000       212 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/a0/fb183ea284a2a89c41b2e32ee1588c41baaf0a
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/6a/
-r--r--r-- 1000/1000       811 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/6a/66aea5eafe0ca6a688840c47219556c552488e
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/00/
-r--r--r-- 1000/1000        45 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/00/f076fd995ff6ac201603ec2566d2d3660a2b70
-r--r--r-- 1000/1000        30 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/00/5fdfc32095b5010256b0a55dbef56319144130
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/bf/
-r--r--r-- 1000/1000       114 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/bf/b0846e4faf5c1d85ba5312b66f5164c8a61cb0
-r--r--r-- 1000/1000       123 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/bf/fc2e7adc8f8fd0544cc054b4d83686a0aa0678
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/1c/
-r--r--r-- 1000/1000       147 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/1c/4577e9680611383f46044d17fa343a96997c3c
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/b0/
-r--r--r-- 1000/1000       189 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/b0/c6da3506c02da17f3faee4aa179a4bda578a88
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/af/
-r--r--r-- 1000/1000       179 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/af/22ff0709ad869b4733f0465a2397e6afbf5d88
-r--r--r-- 1000/1000       246 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/af/f03ad8b8b1a5c0d0fc3396ded2026216091a90
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/07/
-r--r--r-- 1000/1000       360 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/07/daa1c26e2d891a82dc75caf5bc5d21a1733790
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/e5/
-r--r--r-- 1000/1000       246 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/e5/ad6c7947c58991f7e7eb927388d7caf78c2f97
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/43/
-r--r--r-- 1000/1000       189 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/43/4f7780ecea83a0290f52fb0c15899b48446989
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/15/
-r--r--r-- 1000/1000       150 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/15/167cd746c560e5b3d3b233a169aa64d3e9101e
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/b6/
-r--r--r-- 1000/1000     20513 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/b6/28880a014d865f22c5b2c15a2aaf63aa340ed7
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/99/
-r--r--r-- 1000/1000     15440 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/99/2cff2a33a5252af208ad046cd137088eccfdc0
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/8c/
-r--r--r-- 1000/1000        31 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/8c/cfff23cbf5c0b0ec740c53d8dd0d86bcd92530
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/7a/
-r--r--r-- 1000/1000       167 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/7a/6ab85bfdd2b3f4d2c4d33ae4efa20d217be7a4
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/f6/
-r--r--r-- 1000/1000        54 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/f6/2ec9f873684cad6f060d762faf7377fea62c9f
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/d3/
-r--r--r-- 1000/1000      2570 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/d3/4564f49dd1e65a0a38f0bc3718c586e6ec6c9b
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/45/
-r--r--r-- 1000/1000       571 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/45/a974800c7b92a60a5892252a2148aabee4a2d0
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/03/
-r--r--r-- 1000/1000       793 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/03/2948f050758b0c69faa29d9bde90a1f4ed08ce
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/60/
-r--r--r-- 1000/1000       253 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/60/fe828ecc99db2ef55f97445541ad0ca3862d0c
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/ae/
-r--r--r-- 1000/1000     10009 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/ae/0d1b05cd38af37415f14c557819251528f6f4e
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/2a/
-r--r--r-- 1000/1000      9236 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/2a/938864cb9d3e88b3259c4856412517a39dce5f
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/c6/
-r--r--r-- 1000/1000       547 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/c6/77f182431125b837a84666ac5b27f630557ec4
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/9a/
-r--r--r-- 1000/1000       277 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/9a/54bdd36a1212a6f0eecc64696ea0d356377f4c
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/91/
-r--r--r-- 1000/1000       240 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/91/88c2380a6b212a802da13829f2993346195573
-r--r--r-- 1000/1000       158 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/91/e52dae77bf18dba10c73e94f2d601b2006bcf2
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/db/
-r--r--r-- 1000/1000       118 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/db/39781f14cdff3d94375995074cf8106f6fbf1d
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/info/
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/bc/
-r--r--r-- 1000/1000       405 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/bc/550069bd9ba7fe6a1ab4edb5976ae43ecea44f
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/08/
-r--r--r-- 1000/1000       451 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/08/35236dc6ecf997deee5cc81c0370713226a9a5
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/95/
-r--r--r-- 1000/1000       178 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/95/c4cf5914e2e55b90bbba3303ff9bf2742db8ad
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/fc/
-r--r--r-- 1000/1000        43 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/fc/732a7acdd1be8fce7252996ceecc8c5a06712b
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/20/
-r--r--r-- 1000/1000       709 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/20/e3067c97ebb9f113bd248c0772b655f50b40a5
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/88/
-r--r--r-- 1000/1000       124 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/88/d4e62667f9125ff0e3c90bd1752f1c903c071f
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/b4/
-r--r--r-- 1000/1000       217 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/b4/73fdd13216a46feb97c92659164381d963722e
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/64/
-r--r--r-- 1000/1000       144 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/64/20cce7bf2341d8d8837fe8b36a4d1300539d1d
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/36/
-r--r--r-- 1000/1000        52 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/36/0d6787c6c081c445dcb40b71add3300d922c7e
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/a3/
-r--r--r-- 1000/1000      1006 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/a3/a918f0b381d2663037373b487e1d7f776c5c35
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/8d/
-r--r--r-- 1000/1000       654 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/8d/01a431501a7cea65b6fb632c0bd257f9509e65
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/63/
-r--r--r-- 1000/1000      2131 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/63/3ee15dc55b53ebbabfc73870c8e66a1c1b0e29
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/5a/
-r--r--r-- 1000/1000       794 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/5a/4d75f8a43c169f2e4eaf5cb82c7a9f0adb163f
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/82/
-r--r--r-- 1000/1000      1739 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/82/2ed42a04c1c52fe0d8855c0ae50708be80b1f6
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/ec/
-r--r--r-- 1000/1000       120 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/ec/76ee0f4da2f1e0ac67969a067a42c1fe2c7f00
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/3b/
-r--r--r-- 1000/1000       350 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/3b/125600c757b016c6458ec09cbdd32b2778253e
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/c4/
-r--r--r-- 1000/1000      1802 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/c4/84e5a94fbf0a38b9c1789356f9f152ccaec4d2
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/68/
-r--r--r-- 1000/1000       340 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/objects/68/af7c2dace75818468e29302642ecd9a942370a
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/hooks/
-rwxrwxr-x 1000/1000      3610 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/hooks/update.sample
-rwxrwxr-x 1000/1000       544 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/hooks/pre-receive.sample
-rwxrwxr-x 1000/1000       424 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/hooks/pre-applypatch.sample
-rwxrwxr-x 1000/1000      1348 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/hooks/pre-push.sample
-rwxrwxr-x 1000/1000      3327 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/hooks/fsmonitor-watchman.sample
-rwxrwxr-x 1000/1000       896 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/hooks/commit-msg.sample
-rwxrwxr-x 1000/1000       189 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/hooks/post-update.sample
-rwxrwxr-x 1000/1000      1492 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/hooks/prepare-commit-msg.sample
-rwxrwxr-x 1000/1000      4898 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/hooks/pre-rebase.sample
-rwxrwxr-x 1000/1000       478 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/hooks/applypatch-msg.sample
-rwxrwxr-x 1000/1000      1642 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/hooks/pre-commit.sample
-rw-rw-r-- 1000/1000      2865 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/index
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/logs/
-rw-rw-r-- 1000/1000       201 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/logs/HEAD
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/logs/refs/
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/logs/refs/remotes/
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/logs/refs/remotes/origin/
-rw-rw-r-- 1000/1000       201 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/logs/refs/remotes/origin/HEAD
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/logs/refs/heads/
-rw-rw-r-- 1000/1000       201 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/logs/refs/heads/master
-rw-rw-r-- 1000/1000        73 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/description
-rw-rw-r-- 1000/1000       270 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/config
drwxrwxr-x 1000/1000         0 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/info/
-rw-rw-r-- 1000/1000       240 2021-08-10 15:26 webdata/dockerfiles/multistage/.git/info/exclude
-rwxrwxr-x 1000/1000       382 2021-08-10 15:26 webdata/dockerfiles/multistage/build-multi-dockerfiles.sh
-rw-rw-r-- 1000/1000        18 2021-08-10 15:26 webdata/dockerfiles/multistage/.gitignore
-rw-rw-r-- 1000/1000      1167 2021-08-10 15:26 webdata/dockerfiles/multistage/README.md
-rw-rw-r-- 1000/1000       399 2021-08-10 16:18 webdata/dockerfiles/multistage/Dockerfile2
-rwxrwxr-x 1000/1000       128 2021-08-10 15:26 webdata/dockerfiles/multistage/build.sh
drwxrwxr-x 1000/1000         0 2021-08-10 15:14 webdata/dockerfiles/dicas/
-rw-rw-r-- 1000/1000       347 2021-08-10 14:46 webdata/dockerfiles/dicas/Dockerfile5
-rw-rw-r-- 1000/1000       155 2021-08-10 15:14 webdata/dockerfiles/dicas/Dockerfile
-rw-rw-r-- 1000/1000       179 2021-08-09 18:56 webdata/dockerfiles/dicas/Dockerfile1
-rw-rw-r-- 1000/1000       142 2021-08-10 14:54 webdata/dockerfiles/dicas/Dockerfile6
-rw-rw-r-- 1000/1000       292 2021-08-09 21:06 webdata/dockerfiles/dicas/Dockerfile3
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/samples/
-rw-rw-r-- 1000/1000       446 2021-08-09 19:07 webdata/dockerfiles/dicas/app/samples/1.txt
-rw-rw-r-- 1000/1000       702 2021-08-09 19:07 webdata/dockerfiles/dicas/app/samples/2.txt
-rw-rw-r-- 1000/1000      2090 2021-08-09 19:07 webdata/dockerfiles/dicas/app/Count.java
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/target/
-rw-rw-r-- 1000/1000       446 2021-08-09 19:07 webdata/dockerfiles/dicas/app/target/sample.txt
-rw-rw-r-- 1000/1000      1088 2021-08-09 19:07 webdata/dockerfiles/dicas/app/target/app.jar
-rw-rw-r-- 1000/1000       702 2021-08-09 19:07 webdata/dockerfiles/dicas/app/target/sample2.txt
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/branches/
-rw-rw-r-- 1000/1000        21 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/HEAD
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/refs/
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/refs/remotes/
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/refs/remotes/origin/
-rw-rw-r-- 1000/1000        30 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/refs/remotes/origin/HEAD
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/refs/tags/
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/refs/heads/
-rw-rw-r-- 1000/1000        41 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/refs/heads/main
-rw-rw-r-- 1000/1000       112 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/packed-refs
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/pack/
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/a0/
-r--r--r-- 1000/1000       113 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/a0/696d9ef12e2eac38f5d0d378cfce91a968bfe6
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/e2/
-r--r--r-- 1000/1000       418 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/e2/d980b276bc57e84ea06dbdb1a71c24f0a1dd83
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/7f/
-r--r--r-- 1000/1000       135 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/7f/757544884db673274bb140a365e93fa37f6cca
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/b1/
-r--r--r-- 1000/1000       133 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/b1/c93d594871d7b7adbb9d621b983d738c00b433
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/ff/
-r--r--r-- 1000/1000       930 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/ff/d4feecac54b40d4161e7715a0e53ebe92deb40
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/4b/
-r--r--r-- 1000/1000        76 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/4b/a1d371d786452651aa42322a4518f314c6e49d
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/info/
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/75/
-r--r--r-- 1000/1000       215 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/75/dab00125760c2d586bf3ae6059d241c429e0e1
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/1b/
-r--r--r-- 1000/1000       284 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/1b/376877f435b1848c818e97e52298f51b8f1beb
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/e6/
-r--r--r-- 1000/1000       642 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/e6/d1f7bae7a9a0e7ac7c73866d445c2144e3f294
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/8d/
-r--r--r-- 1000/1000      1097 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/8d/e69d9336b8ecf0ecd199153b85b607d416cb15
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/80/
-r--r--r-- 1000/1000        34 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/objects/80/621ee625ece3f0e8fc1a1cdf389f50e2072165
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/hooks/
-rwxrwxr-x 1000/1000      3610 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/hooks/update.sample
-rwxrwxr-x 1000/1000       544 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/hooks/pre-receive.sample
-rwxrwxr-x 1000/1000       424 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/hooks/pre-applypatch.sample
-rwxrwxr-x 1000/1000      1348 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/hooks/pre-push.sample
-rwxrwxr-x 1000/1000      3327 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/hooks/fsmonitor-watchman.sample
-rwxrwxr-x 1000/1000       896 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/hooks/commit-msg.sample
-rwxrwxr-x 1000/1000       189 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/hooks/post-update.sample
-rwxrwxr-x 1000/1000      1492 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/hooks/prepare-commit-msg.sample
-rwxrwxr-x 1000/1000      4898 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/hooks/pre-rebase.sample
-rwxrwxr-x 1000/1000       478 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/hooks/applypatch-msg.sample
-rwxrwxr-x 1000/1000      1642 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/hooks/pre-commit.sample
-rw-rw-r-- 1000/1000       840 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/index
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/logs/
-rw-rw-r-- 1000/1000       205 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/logs/HEAD
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/logs/refs/
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/logs/refs/remotes/
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/logs/refs/remotes/origin/
-rw-rw-r-- 1000/1000       205 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/logs/refs/remotes/origin/HEAD
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/logs/refs/heads/
-rw-rw-r-- 1000/1000       205 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/logs/refs/heads/main
-rw-rw-r-- 1000/1000        73 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/description
-rw-rw-r-- 1000/1000       270 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/config
drwxrwxr-x 1000/1000         0 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/info/
-rw-rw-r-- 1000/1000       240 2021-08-09 19:07 webdata/dockerfiles/dicas/app/.git/info/exclude
-rw-rw-r-- 1000/1000       145 2021-08-09 19:07 webdata/dockerfiles/dicas/app/README.md
-rw-rw-r-- 1000/1000      1044 2021-08-09 19:07 webdata/dockerfiles/dicas/app/Count.class
-rw-rw-r-- 1000/1000        18 2021-08-09 19:07 webdata/dockerfiles/dicas/app/manifest
-rw-rw-r-- 1000/1000       228 2021-08-09 19:25 webdata/dockerfiles/dicas/Dockerfile2
-rw-rw-r-- 1000/1000       144 2021-08-10 15:05 webdata/dockerfiles/dicas/Dockerfile7
-rw-rw-r-- 1000/1000       287 2021-08-10 13:48 webdata/dockerfiles/dicas/Dockerfile4
drwxrwxr-x 1000/1000         0 2021-08-09 15:32 webdata/dockerfiles/echo-container/
-rw-rw-r-- 1000/1000        56 2021-08-09 15:32 webdata/dockerfiles/echo-container/Dockerfile
drwxrwxr-x 1000/1000         0 2021-08-06 17:33 webdata/dockerfiles/webserver/
-rw-rw-r-- 1000/1000       149 2021-08-06 17:33 webdata/dockerfiles/webserver/Dockerfile
drwxrwxr-x 1000/1000         0 2021-08-09 15:55 webdata/dockerfiles/dockerfiles/
drwxrwxr-x 1000/1000         0 2021-08-09 16:04 webdata/dockerfiles/dockerfiles/exemplo1/
drwxrwxr-x 1000/1000         0 2021-08-09 16:04 webdata/dockerfiles/dockerfiles/exemplo1/image/
-rw-rw-r-- 1000/1000        60 2021-08-09 16:00 webdata/dockerfiles/dockerfiles/exemplo1/image/Dockerfile
drwxrwxr-x 1000/1000         0 2021-08-09 18:59 webdata/dockerfiles/dockerfiles/exemplo1/context/
drwxr-xr-x 1000/1000         0 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/
drwxr-xr-x 1000/1000         0 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/apt/
-rw-r--r-- 1000/1000      3171 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/apt/history.log
-rw-r----- 1000/1000     15372 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/apt/term.log
-rw-r--r-- 1000/1000     20208 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/apt/eipp.log.xz
-rw-r----- 1000/1000      8199 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/cloud-init-output.log
-rw-r----- 1000/1000    216950 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/syslog
-rw-r--r-- 1000/1000    292584 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/lastlog
-rw-r----- 1000/1000     19739 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/auth.log
-rw-r--r-- 1000/1000      6912 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/wtmp
-rw-r----- 1000/1000    101905 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/kern.log
-rw-r--r-- 1000/1000     28703 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/dpkg.log
drwxr-x--- 1000/1000         0 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/unattended-upgrades/
-rw-r--r-- 1000/1000       112 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/unattended-upgrades/unattended-upgrades-shutdown.log
-rw-r--r-- 1000/1000      1107 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/unattended-upgrades/unattended-upgrades.log
-rw-r--r-- 1000/1000      8897 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/unattended-upgrades/unattended-upgrades-dpkg.log
-rw------- 1000/1000     64128 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/tallylog
drwxr-xr-x 1000/1000         0 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/journal/
drwxr-xr-x 1000/1000         0 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/journal/d217dd6f2d004f42bb5d31510a886176/
-rw-r----- 1000/1000   8388608 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/journal/d217dd6f2d004f42bb5d31510a886176/user-1000.journal
-rw-r----- 1000/1000   8388608 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/journal/d217dd6f2d004f42bb5d31510a886176/system.journal
drwxr-xr-x 1000/1000         0 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/lxd/
-rw------- 1000/1000       664 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/ubuntu-advantage.log
-rw-r----- 1000/1000         0 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/btmp
drwxr-xr-x 1000/1000         0 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/dist-upgrade/
drwxr-xr-x 1000/1000         0 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/landscape/
-rw-r--r-- 1000/1000         0 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/landscape/sysinfo.log
-rw-r--r-- 1000/1000    182190 2021-08-09 16:29 webdata/dockerfiles/dockerfiles/exemplo1/context/log/cloud-init.log
-rw-rw-r-- 1000/1000        29 2021-08-09 15:57 webdata/dockerfiles/dockerfiles/exemplo1/context/conteudo.txt

vagrant@node01:~/backup$ docker container rm -f $(docker container ls -aq)
8880fcd00a20

vagrant@node01:~/backup$ docker volume rm -f $(docker volume ls -q)
6f109d6a526d452df8f538a2b49e55add9470db865bdfd3d09c40505a2449da9

# Restore

vagrant@node01:~/backup$ docker container run -dit -v /webdata --name webserver2 debian
6a848783a2f4e89c5b98613932d61d5a8f8ea8699724a0d63368d763be7faeee

vagrant@node01:~/backup$ docker container exec webserver2 ls -Lr /webdata

vagrant@node01:~/backup$ docker container run --rm --volumes-from webserver2 -v $(pwd):/backup alpine ash -c "cd /webdata && tar xvf /backup/backup.tar --strip 1"
webdata/
webdata/dockerfiles/

vagrant@node01:~/backup$ docker container exec webserver2 ls -lR /webdata
/webdata:
total 4
drwxrwxr-x 7 1000 1000 4096 Aug 17 18:31 dockerfiles

/webdata/dockerfiles:
total 20
drwxrwxr-x 3 1000 1000 4096 Aug 17 18:31 dicas
drwxrwxr-x 3 1000 1000 4096 Aug 17 18:31 dockerfiles
drwxrwxr-x 2 1000 1000 4096 Aug 17 18:31 echo-container
drwxrwxr-x 4 1000 1000 4096 Aug 17 18:31 multistage
drwxrwxr-x 2 1000 1000 4096 Aug 17 18:31 webserver

/webdata/dockerfiles/dicas:
total 36
-rw-rw-r-- 1 1000 1000  155 Aug 10 15:14 Dockerfile
-rw-rw-r-- 1 1000 1000  179 Aug  9 18:56 Dockerfile1
-rw-rw-r-- 1 1000 1000  228 Aug  9 19:25 Dockerfile2
-rw-rw-r-- 1 1000 1000  292 Aug  9 21:06 Dockerfile3
-rw-rw-r-- 1 1000 1000  287 Aug 10 13:48 Dockerfile4
-rw-rw-r-- 1 1000 1000  347 Aug 10 14:46 Dockerfile5
-rw-rw-r-- 1 1000 1000  142 Aug 10 14:54 Dockerfile6
-rw-rw-r-- 1 1000 1000  144 Aug 10 15:05 Dockerfile7
drwxrwxr-x 5 1000 1000 4096 Aug 17 18:31 app

/webdata/dockerfiles/dicas/app:
total 24
-rw-rw-r-- 1 1000 1000 1044 Aug  9 19:07 Count.class
-rw-rw-r-- 1 1000 1000 2090 Aug  9 19:07 Count.java
-rw-rw-r-- 1 1000 1000  145 Aug  9 19:07 README.md
-rw-rw-r-- 1 1000 1000   18 Aug  9 19:07 manifest
drwxrwxr-x 2 1000 1000 4096 Aug 17 18:31 samples
drwxrwxr-x 2 1000 1000 4096 Aug 17 18:31 target

/webdata/dockerfiles/dicas/app/samples:
total 8
-rw-rw-r-- 1 1000 1000 446 Aug  9 19:07 1.txt
-rw-rw-r-- 1 1000 1000 702 Aug  9 19:07 2.txt

/webdata/dockerfiles/dicas/app/target:
total 12
-rw-rw-r-- 1 1000 1000 1088 Aug  9 19:07 app.jar
-rw-rw-r-- 1 1000 1000  446 Aug  9 19:07 sample.txt
-rw-rw-r-- 1 1000 1000  702 Aug  9 19:07 sample2.txt

/webdata/dockerfiles/dockerfiles:
total 4
drwxrwxr-x 4 1000 1000 4096 Aug 17 18:31 exemplo1

/webdata/dockerfiles/dockerfiles/exemplo1:
total 8
drwxrwxr-x 3 1000 1000 4096 Aug 17 18:31 context
drwxrwxr-x 2 1000 1000 4096 Aug 17 18:31 image

/webdata/dockerfiles/dockerfiles/exemplo1/context:
total 8
-rw-rw-r-- 1 1000 1000   29 Aug  9 15:57 conteudo.txt
drwxr-xr-x 8 1000 1000 4096 Aug 17 18:31 log

/webdata/dockerfiles/dockerfiles/exemplo1/context/log:
total 944
drwxr-xr-x 2 1000 1000   4096 Aug 17 18:31 apt
-rw-r----- 1 1000 1000  19739 Aug  9 16:29 auth.log
-rw-r----- 1 1000 1000      0 Aug  9 16:29 btmp
-rw-r----- 1 1000 1000   8199 Aug  9 16:29 cloud-init-output.log
-rw-r--r-- 1 1000 1000 182190 Aug  9 16:29 cloud-init.log
drwxr-xr-x 2 1000 1000   4096 Aug  9 16:29 dist-upgrade
-rw-r--r-- 1 1000 1000  28703 Aug  9 16:29 dpkg.log
drwxr-xr-x 3 1000 1000   4096 Aug 17 18:31 journal
-rw-r----- 1 1000 1000 101905 Aug  9 16:29 kern.log
drwxr-xr-x 2 1000 1000   4096 Aug 17 18:31 landscape
-rw-r--r-- 1 1000 1000 292584 Aug  9 16:29 lastlog
drwxr-xr-x 2 1000 1000   4096 Aug  9 16:29 lxd
-rw-r----- 1 1000 1000 216950 Aug  9 16:29 syslog
-rw------- 1 1000 1000  64128 Aug  9 16:29 tallylog
-rw------- 1 1000 1000    664 Aug  9 16:29 ubuntu-advantage.log
drwxr-x--- 2 1000 1000   4096 Aug 17 18:31 unattended-upgrades
-rw-r--r-- 1 1000 1000   6912 Aug  9 16:29 wtmp

/webdata/dockerfiles/dockerfiles/exemplo1/context/log/apt:
total 40
-rw-r--r-- 1 1000 1000 20208 Aug  9 16:29 eipp.log.xz
-rw-r--r-- 1 1000 1000  3171 Aug  9 16:29 history.log
-rw-r----- 1 1000 1000 15372 Aug  9 16:29 term.log

/webdata/dockerfiles/dockerfiles/exemplo1/context/log/dist-upgrade:
total 0

/webdata/dockerfiles/dockerfiles/exemplo1/context/log/journal:
total 4
drwxr-xr-x 2 1000 1000 4096 Aug 17 18:31 d217dd6f2d004f42bb5d31510a886176

/webdata/dockerfiles/dockerfiles/exemplo1/context/log/journal/d217dd6f2d004f42bb5d31510a886176:
total 16384
-rw-r----- 1 1000 1000 8388608 Aug  9 16:29 system.journal
-rw-r----- 1 1000 1000 8388608 Aug  9 16:29 user-1000.journal

/webdata/dockerfiles/dockerfiles/exemplo1/context/log/landscape:
total 0
-rw-r--r-- 1 1000 1000 0 Aug  9 16:29 sysinfo.log

/webdata/dockerfiles/dockerfiles/exemplo1/context/log/lxd:
total 0

/webdata/dockerfiles/dockerfiles/exemplo1/context/log/unattended-upgrades:
total 20
-rw-r--r-- 1 1000 1000 8897 Aug  9 16:29 unattended-upgrades-dpkg.log
-rw-r--r-- 1 1000 1000  112 Aug  9 16:29 unattended-upgrades-shutdown.log
-rw-r--r-- 1 1000 1000 1107 Aug  9 16:29 unattended-upgrades.log

/webdata/dockerfiles/dockerfiles/exemplo1/image:
total 4
-rw-rw-r-- 1 1000 1000 60 Aug  9 16:00 Dockerfile

/webdata/dockerfiles/echo-container:
total 4
-rw-rw-r-- 1 1000 1000 56 Aug  9 15:32 Dockerfile

/webdata/dockerfiles/multistage:
total 44
-rw-rw-r-- 1 1000 1000  106 Aug 10 16:49 Dockerfile
-rw-rw-r-- 1 1000 1000  234 Aug 10 15:39 Dockerfile1
-rw-rw-r-- 1 1000 1000  399 Aug 10 16:18 Dockerfile2
-rw-rw-r-- 1 1000 1000  510 Aug 10 15:26 Gopkg.lock
-rw-rw-r-- 1 1000 1000  719 Aug 10 15:26 Gopkg.toml
-rw-rw-r-- 1 1000 1000 1067 Aug 10 15:26 LICENSE
-rw-rw-r-- 1 1000 1000 1167 Aug 10 15:26 README.md
-rw-rw-r-- 1 1000 1000 1709 Aug 10 15:26 app.go
-rwxrwxr-x 1 1000 1000  382 Aug 10 15:26 build-multi-dockerfiles.sh
-rwxrwxr-x 1 1000 1000  128 Aug 10 15:26 build.sh
drwxrwxr-x 3 1000 1000 4096 Aug 17 18:31 vendor

/webdata/dockerfiles/multistage/vendor:
total 4
drwxrwxr-x 3 1000 1000 4096 Aug 17 18:31 golang.org

/webdata/dockerfiles/multistage/vendor/golang.org:
total 4
drwxrwxr-x 3 1000 1000 4096 Aug 17 18:31 x

/webdata/dockerfiles/multistage/vendor/golang.org/x:
total 4
drwxrwxr-x 3 1000 1000 4096 Aug 17 18:31 net

/webdata/dockerfiles/multistage/vendor/golang.org/x/net:
total 20
-rw-rw-r-- 1 1000 1000  173 Aug 10 15:26 AUTHORS
-rw-rw-r-- 1 1000 1000  170 Aug 10 15:26 CONTRIBUTORS
-rw-rw-r-- 1 1000 1000 1479 Aug 10 15:26 LICENSE
-rw-rw-r-- 1 1000 1000 1303 Aug 10 15:26 PATENTS
drwxrwxr-x 3 1000 1000 4096 Aug 17 18:31 html

/webdata/dockerfiles/multistage/vendor/golang.org/x/net/html:
total 256
drwxrwxr-x 2 1000 1000   4096 Aug 17 18:31 atom
-rw-rw-r-- 1 1000 1000   2618 Aug 10 15:26 const.go
-rw-rw-r-- 1 1000 1000   3415 Aug 10 15:26 doc.go
-rw-rw-r-- 1 1000 1000   4925 Aug 10 15:26 doctype.go
-rw-rw-r-- 1 1000 1000 114594 Aug 10 15:26 entity.go
-rw-rw-r-- 1 1000 1000   6053 Aug 10 15:26 escape.go
-rw-rw-r-- 1 1000 1000   6913 Aug 10 15:26 foreign.go
-rw-rw-r-- 1 1000 1000   5355 Aug 10 15:26 node.go
-rw-rw-r-- 1 1000 1000  57896 Aug 10 15:26 parse.go
-rw-rw-r-- 1 1000 1000   7062 Aug 10 15:26 render.go
-rw-rw-r-- 1 1000 1000  30558 Aug 10 15:26 token.go

/webdata/dockerfiles/multistage/vendor/golang.org/x/net/html/atom:
total 44
-rw-rw-r-- 1 1000 1000  2321 Aug 10 15:26 atom.go
-rw-rw-r-- 1 1000 1000 11995 Aug 10 15:26 gen.go
-rw-rw-r-- 1 1000 1000 27822 Aug 10 15:26 table.go

/webdata/dockerfiles/webserver:
total 4
-rw-rw-r-- 1 1000 1000 149 Aug  6 17:33 Dockerfile

vagrant@node01:~/backup$ docker container exec webserver2 ls -l /webdata
total 4
drwxrwxr-x 7 1000 1000 4096 Aug 17 18:31 dockerfiles

==============================================================================

# Aula 5: Docker DCA 05 - Volume Plugins : https://www.youtube.com/watch?v=GUtIVR0OOv4&t=19s

# https://github.com/caiodelgadonew/docker/blob/main/manuscript/05-docker-compose.md

vagrant up node01 node02

vagrant ssh node01

# RESUMO

# Nomeado
# Anonimo
# Host

# Nomeado --> -v volumenomeado:/app
# Anonimo --> -v /app
# Host    --> -v /home/vagrant/volumehost:/app

# -v --volume
# --mount
# --mount --> Aceita customizações
# --mount source=/home/vagrant/volume,target=/app
# tmpfs --> volume que fica na memoria ram <--

=====================================================

vagrant@node01:~$ docker plugin install vieux/sshfs

vagrant@node01:~$ docker plugin install vieux/sshfs
Plugin "vieux/sshfs" is requesting the following privileges:
 - network: [host]
 - mount: [/var/lib/docker/plugins/]
 - mount: []
 - device: [/dev/fuse]
 - capabilities: [CAP_SYS_ADMIN]
Do you grant the above permissions? [y/N] y
latest: Pulling from vieux/sshfs
Digest: sha256:1d3c3e42c12138da5ef7873b97f7f32cf99fb6edde75fa4f0bcf9ed277855811
52d435ada6a4: Complete 
Installed plugin vieux/sshfs

vagrant@node01:~$ docker plugin ls
ID             NAME                 DESCRIPTION               ENABLED
2aae946f185f   vieux/sshfs:latest   sshFS plugin for Docker   true


vagrant ssh node02

[vagrant@node02 ~]$ sudo yum install vim -y

sudo vim /etc/ssh/sshd_config

set number

65

65 PasswordAuthentication no

ou sudo vim /etc/ssh/sshd_config +65

# alterar
65 PasswordAuthentication yes

[vagrant@node02 ~]$ sudo systemctl restart sshd

vagrant@node01:~$ docker volume create batatinha
batatinha
vagrant@node01:~$ docker volume ls
DRIVER    VOLUME NAME
local     batatinha

[vagrant@node02 ~]$ ip -c -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128 
eth0             UP             10.0.2.15/24 fe80::5054:ff:fe4d:77d3/64 
eth1             UP             10.20.20.120/24 fe80::a00:27ff:fe13:7018/64 

vagrant@node01:~$ ping -c4 10.20.20.120
PING 10.20.20.120 (10.20.20.120) 56(84) bytes of data.
64 bytes from 10.20.20.120: icmp_seq=1 ttl=64 time=1.15 ms
64 bytes from 10.20.20.120: icmp_seq=2 ttl=64 time=0.780 ms
64 bytes from 10.20.20.120: icmp_seq=3 ttl=64 time=0.926 ms
64 bytes from 10.20.20.120: icmp_seq=4 ttl=64 time=1.06 ms

--- 10.20.20.120 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3088ms
rtt min/avg/max/mdev = 0.780/0.979/1.151/0.143 ms

# parei 37,04

vagrant@node01:~$ docker volume create -d vieux/sshfs --name sshvolume -o sshcmd=vagrant@10.20.20.120:/vagrant -o password=vagrant

[vagrant@node02 ~]$ ls /vagrant
LICENSE  README.md  Vagrantfile  comandos  comands.sh  files  provision.sh  ubuntu-bionic-18.04-cloudimg-console.log

[vagrant@node02 ~]$ ls -l /vagrant
total 224
-rw-rw-r--. 1 vagrant vagrant  35149 Aug 17 18:45 LICENSE
-rw-rw-r--. 1 vagrant vagrant   1456 Aug 17 18:45 README.md
-rw-rw-r--. 1 vagrant vagrant   1014 Aug 17 18:45 Vagrantfile
drwxrwxr-x. 8 vagrant vagrant     96 Aug 17 18:45 comandos
-rw-rw-r--. 1 vagrant vagrant 137498 Aug 31 21:30 comands.sh
drwxrwxr-x. 2 vagrant vagrant     32 Aug 17 18:45 files
-rw-rw-r--. 1 vagrant vagrant    649 Aug 17 18:45 provision.sh
-rw-------. 1 vagrant vagrant  40582 Sep  1 13:28 ubuntu-bionic-18.04-cloudimg-console.log

vagrant@node01:~$ docker volume create -d vieux/sshfs --name sshvolume -o sshcmd=vagrant@10.20.20.120:/vagrant -o password=vagrant
sshvolume

vagrant@node01:~$ docker volume ls
DRIVER               VOLUME NAME
local                batatinha
vieux/sshfs:latest   sshvolume

vagrant@node01:~$ docker volume inspect sshvolume
[
    {
        "CreatedAt": "0001-01-01T00:00:00Z",
        "Driver": "vieux/sshfs:latest",
        "Labels": {},
        "Mountpoint": "/mnt/volumes/dbad60be1c708306baab84ee3f2b4d28",
        "Name": "sshvolume",
        "Options": {
            "password": "vagrant",
            "sshcmd": "vagrant@10.20.20.120:/vagrant"
        },
        "Scope": "local"
    }
]

vagrant@node01:~$ docker volume inspect sshvolume | jq
[
  {
    "CreatedAt": "0001-01-01T00:00:00Z",
    "Driver": "vieux/sshfs:latest",
    "Labels": {},
    "Mountpoint": "/mnt/volumes/dbad60be1c708306baab84ee3f2b4d28",
    "Name": "sshvolume",
    "Options": {
      "password": "vagrant",
      "sshcmd": "vagrant@10.20.20.120:/vagrant"
    },
    "Scope": "local"
  }
]

vagrant@node01:~$ docker container run --rm -v sshvolume:/data alpine ls /data

vagrant@node01:~$ docker container run --rm -v sshvolume:/data alpine ls /data
Unable to find image 'alpine:latest' locally
latest: Pulling from library/alpine
a0d0a0d46f8b: Pull complete 
Digest: sha256:e1c082e3d3c45cccac829840a25941e679c25d438cc8412c2fa221cf1a824e6a
Status: Downloaded newer image for alpine:latest
LICENSE
README.md
Vagrantfile
comandos
comands.sh
files
provision.sh
ubuntu-bionic-18.04-cloudimg-console.log

[vagrant@node02 vagrant]$ echo "<h1>SSHFS NAO USAR EM PRODUCAO VACILAO</h1>" > index.html
[vagrant@node02 vagrant]$ cat index.html
<h1>SSHFS NAO USAR EM PRODUCAO VACILAO</h1>


vagrant@node01:~$ docker container run --rm -v sshvolume:/data alpine cat /data/index.html
<h1>SSHFS NAO USAR EM PRODUCAO VACILAO</h1>

┌─[orbite]@[Navita]:~/docker-dca
└──> $ vagrant up master

vagrant ssh master

# NFS --> Network File System

vagrant@master:~$ sudo apt-get update && sudo apt-get install nfs-server -y

vagrant@master:~$ mkdir -p /home/vagrant/storage

vagrant@master:~$ sudo vim /etc/exports

# limpar todo arquivo dentro dele -->

# /etc/exports: the access control list for filesystems which may be exported
#               to NFS clients.  See exports(5).
#
# Example for NFSv2 and NFSv3:
# /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)
#
# Example for NFSv4:
# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)
# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)

/home/vagrant/storage 10.20.20.0/24(rw)

vagrant@master:~$ echo "/home/vagrant/storage 10.20.20.0/24(rw)"| sudo tee -a /etc/exports 
/home/vagrant/storage 10.20.20.0/24(rw)


vagrant@master:~$ cat /etc/exports 
/home/vagrant/storage 10.20.20.0/24(rw)

vagrant@master:~$ echo "<h1> Volume NFS master.docker-dca.example</h1>" | tee /home/vagrant/storage/index.html
<h1> Volume NFS master.docker-dca.example</h1>

vagrant@master:~$ sudo systemctl restart nfs-server

# mostra a lista de exports criados para essa máquina

vagrant@master:~$ showmount -e
Export list for master:
/home/vagrant/storage 10.20.20.0/24

vagrant@node01:~$ sudo apt-get install nfs-common -y

vagrant@node01:~$ showmount -e
clnt_create: RPC: Program not registered

vagrant@node02 vagrant]$ sudo yum install nfs-utils -y

[vagrant@node02 vagrant]$ showmount -e
clnt_create: RPC: Program not registered

vagrant@node01:~$ showmount -e master.docker-dca.example
Export list for master.docker-dca.example:
/home/vagrant/storage 10.20.20.0/24

[vagrant@node02 vagrant]$ showmount -e master.docker-dca.example
Export list for master.docker-dca.example:
/home/vagrant/storage 10.20.20.0/24

# não faça em produção

vagrant@node01:~$ docker plugin install trajano/nfs-volume-plugin --grant-all-permissions

vagrant@node02 vagrant]$ docker plugin install trajano/nfs-volume-plugin

[vagrant@node02 vagrant]$ cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
127.0.1.1 node02.docker-dca.example node02
10.20.20.100 master.docker-dca.example
10.20.20.110 node01.docker-dca.example
10.20.20.120 node02.docker-dca.example
10.20.20.200 registry.docker-dca.example

vagrant@node01:~$ cat /etc/hosts
127.0.0.1       localhost

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost   ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
10.20.20.100    master.docker-dca.example
10.20.20.110    node01.docker-dca.example
10.20.20.120    node02.docker-dca.example
10.20.20.200    registry.docker-dca.example
127.0.1.1       ubuntu-bionic   ubuntu-bionic

vagrant@master:~$ cat /etc/hosts
127.0.0.1       localhost

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost   ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
10.20.20.100 master.docker-dca.example
10.20.20.110 node01.docker-dca.example
10.20.20.120 node02.docker-dca.example
10.20.20.200 registry.docker-dca.example

# erro reboot
vagrant@node01:~$ docker volume create -d trajano/nfs-volume-plugin --opt device=master.docker-dca.exemple:/home/vagrant/storage --opt nfsopts=hard,proto=tcp,nfsvers=3,intr,nolock volume_nfs

# ok
[vagrant@node02 vagrant]$ docker volume inspect volume_nfs
[
    {
        "CreatedAt": "0001-01-01T00:00:00Z",
        "Driver": "trajano/nfs-volume-plugin:latest",
        "Labels": {},
        "Mountpoint": "",
        "Name": "volume_nfs",
        "Options": {
            "device": "master.docker-dca.example:/home/vagrant/storage",
            "nfsopts": "hard,proto=tcp,nfsvers=3,intr,nolock"
        },
        "Scope": "global",
        "Status": {
            "args": [
                "-t",
                "nfs",
                "-o",
                "hard,proto=tcp,nfsvers=3,intr,nolock",
                "master.docker-dca.example:/home/vagrant/storage"
            ],
            "mounted": false
        }
    }
]
[vagrant@node02 vagrant]$ docker volume ls
DRIVER                             VOLUME NAME
trajano/nfs-volume-plugin:latest   volume_nfs

==========================================================================

# AULA 06 : Docker DCA 06 - Networking : https://www.youtube.com/watch?v=U_qG96yNjiI&t=7s

# https://github.com/caiodelgadonew/docker/blob/main/manuscript/06-swarm.md

# RECURSOS:
- veTH 
- bridge
- ipTables 

# veth --> Virtual Ethernet (placa de rede virtual)
# bridge --> Ponte (roteamento do host para o container)
# iptables --> Firewall de sitema linux

# -p --> publish --> PUBLICAR
# --publish

vagrant@node01:~$ docker container run -dit --name webserver -p 80:80 nginx

# -p / --publish  ORIGIM:DESTINO   HOST: CONTAINER
# -p 80:80  --> PEGUE TODA CONEXAO NA PORTA 80 DO HOST, DIRECIONE PARA A PORTA 80 DO CONTAINER

# Teste para validar

vagrant@node01:~$ curl localhost
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>

http://10.20.20.110/

ou http://docker-dca.example

vagrant@node01:~$ docker container rm -f webserver
webserver

# NETWORK DRIVERS

#   - bridge
#   - host
#   - overlay
#   - mcvlan
#   - none
#   - plugins de drivers

vagrant@node01:~$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
d812223dc08e   bridge    bridge    local
e087559f25d1   host      host      local
606862980ab8   none      null      local

# BRIDGE --> RESOLUÇÃO DNS + CONECTE E DESCONECTE CONTAINERS

vagrant@node01:~$ docker container run -dit --name webserver --network bridge -p 80:80 nginx
1a2f6a55b3d3cbe7957b64b8cefdd273885c466d052632ebf2978294489ac414

vagrant@node01:~$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
d812223dc08e   bridge    bridge    local
e087559f25d1   host      host      local
606862980ab8   none      null      localdomain

vagrant@node01:~$ ip -c -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp0s3           UP             10.0.2.15/24 fe80::bb:9ff:fe5e:a926/64 
enp0s8           UP             10.20.20.110/24 fe80::a00:27ff:fe26:75b0/64 
docker0          UP             172.17.0.1/16 fe80::42:87ff:feef:d665/64 
veth0fb3cd8@if7  UP             fe80::e068:70ff:feb1:c4fd/64

vagrant@node01:~$ docker network inspect bridge
[
    {
        "Name": "bridge",
        "Id": "d812223dc08efe7df2d1320aca3f4fb1c3f1d9fe6b332b2d29313113938d82d1",
        "Created": "2021-09-02T12:48:15.816892794Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "1a2f6a55b3d3cbe7957b64b8cefdd273885c466d052632ebf2978294489ac414": {
                "Name": "webserver",
                "EndpointID": "3a3e932139a916d3934b041904df9c6a70852d0e7ac3f275c469d1ec6d2e98d5",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]

vagrant@node01:~$ docker network inspect bridge | jq
[
  {
    "Name": "bridge",
    "Id": "d812223dc08efe7df2d1320aca3f4fb1c3f1d9fe6b332b2d29313113938d82d1",
    "Created": "2021-09-02T12:48:15.816892794Z",
    "Scope": "local",
    "Driver": "bridge",
    "EnableIPv6": false,
    "IPAM": {
      "Driver": "default",
      "Options": null,
      "Config": [
        {
          "Subnet": "172.17.0.0/16",
          "Gateway": "172.17.0.1"
        }
      ]
    },
    "Internal": false,
    "Attachable": false,
    "Ingress": false,
    "ConfigFrom": {
      "Network": ""
    },
    "ConfigOnly": false,
    "Containers": {
      "1a2f6a55b3d3cbe7957b64b8cefdd273885c466d052632ebf2978294489ac414": {
        "Name": "webserver",
        "EndpointID": "3a3e932139a916d3934b041904df9c6a70852d0e7ac3f275c469d1ec6d2e98d5",
        "MacAddress": "02:42:ac:11:00:02",
        "IPv4Address": "172.17.0.2/16",
        "IPv6Address": ""
      }
    },
    "Options": {
      "com.docker.network.bridge.default_bridge": "true",
      "com.docker.network.bridge.enable_icc": "true",
      "com.docker.network.bridge.enable_ip_masquerade": "true",
      "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
      "com.docker.network.bridge.name": "docker0",
      "com.docker.network.driver.mtu": "1500"
    },
    "Labels": {}
  }
]

vagrant@node01:~$ docker container rm -f webserver
webserver

vagrant@node01:~$ ip -c -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp0s3           UP             10.0.2.15/24 fe80::bb:9ff:fe5e:a926/64 
enp0s8           UP             10.20.20.110/24 fe80::a00:27ff:fe26:75b0/64 
docker0          DOWN           172.17.0.1/16 fe80::42:87ff:feef:d665/64 

vagrant@node01:~$ docker container run -dit --name webserver --network bridge -p 80:80 nginx
6eb8b185a636a5215366d8848627b63e6fe4a1fa6e3f983b904ebe27d434c73b

vagrant@node01:~$ ip -c -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp0s3           UP             10.0.2.15/24 fe80::bb:9ff:fe5e:a926/64 
enp0s8           UP             10.20.20.110/24 fe80::a00:27ff:fe26:75b0/64 
docker0          UP             172.17.0.1/16 fe80::42:87ff:feef:d665/64 
veth1435316@if9  UP             fe80::f0b6:38ff:fe91:a46b/64

# comando para listar as portas que estão em uso
# https://explainshell.com/ site pra te ajudar

vagrant@node01:~$ sudo ss -ntpl | grep 80
LISTEN   0         128                 0.0.0.0:80               0.0.0.0:*        users:(("docker-proxy",pid=14639,fd=4))                                        
LISTEN   0         128                    [::]:80                  [::]:*        users:(("docker-proxy",pid=14645,fd=4)) 

vagrant@node01:~$ sudo iptables -nL
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy DROP)
target     prot opt source               destination         
DOCKER-USER  all  --  0.0.0.0/0            0.0.0.0/0           
DOCKER-ISOLATION-STAGE-1  all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
DOCKER     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain DOCKER (1 references)
target     prot opt source               destination         
ACCEPT     tcp  --  0.0.0.0/0            172.17.0.2           tcp dpt:80

Chain DOCKER-ISOLATION-STAGE-1 (1 references)
target     prot opt source               destination         
DOCKER-ISOLATION-STAGE-2  all  --  0.0.0.0/0            0.0.0.0/0           
RETURN     all  --  0.0.0.0/0            0.0.0.0/0           

Chain DOCKER-ISOLATION-STAGE-2 (1 references)
target     prot opt source               destination         
DROP       all  --  0.0.0.0/0            0.0.0.0/0           
RETURN     all  --  0.0.0.0/0            0.0.0.0/0           

Chain DOCKER-USER (1 references)
target     prot opt source               destination         
RETURN     all  --  0.0.0.0/0            0.0.0.0/0

# Diferenças entre comandos

# HOST --> CONTAINER-IP = HOST-IP

docker container run -dit --name web --network host nginx

# Bridge

docker container run -dit --name web --network bridge -p 80:80 nginx


vagrant@node01:~$ docker container run -dit --name web --network host nginx
30bc251e72462f302fc6bce4146022adbf97ffb3c0bcfca88bf36639195d7fce

vagrant@node01:~$ docker container ls
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS     NAMES
30bc251e7246   nginx     "/docker-entrypoint.…"   19 seconds ago   Up 18 seconds             web

vagrant@node01:~$ curl localhost:80 

<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>

vagrant@node01:~$ sudo ss -ntpl | grep 80
LISTEN   0         128                 0.0.0.0:80               0.0.0.0:*        users:(("nginx",pid=15164,fd=7),("nginx",pid=15163,fd=7),("nginx",pid=15108,fd=7))
LISTEN   0         128                    [::]:80                  [::]:*        users:(("nginx",pid=15164,fd=8),("nginx",pid=15163,fd=8),("nginx",pid=15108,fd=8))

vagrant@node01:~$ docker network inspect bridge | jq
[
  {
    "Name": "bridge",
    "Id": "d812223dc08efe7df2d1320aca3f4fb1c3f1d9fe6b332b2d29313113938d82d1",
    "Created": "2021-09-02T12:48:15.816892794Z",
    "Scope": "local",
    "Driver": "bridge",
    "EnableIPv6": false,
    "IPAM": {
      "Driver": "default",
      "Options": null,
      "Config": [
        {
          "Subnet": "172.17.0.0/16",
          "Gateway": "172.17.0.1"
        }
      ]
    },
    "Internal": false,
    "Attachable": false,
    "Ingress": false,
    "ConfigFrom": {
      "Network": ""
vagrant@node01:~$ sudo iptables -nL
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy DROP)
target     prot opt source               destination         
DOCKER-USER  all  --  0.0.0.0/0            0.0.0.0/0           
DOCKER-ISOLATION-STAGE-1  all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
DOCKER     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
vagrant@node01:~$ docker container ls
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS     NAMES
30bc251e7246   nginx     "/docker-entrypoint.…"   19 seconds ago   Up 18 seconds             web
vagrant@node01:~$ curl localhost:80 
<!DOCTYPE html>
<html>
<head>
vagrant@node01:~$ docker container inspect | jq
"docker container inspect" requires at least 1 argument.
See 'docker container inspect --help'.

Usage:  docker container inspect [OPTIONS] CONTAINER [CONTAINER...]

Display detailed information on one or more containers
vagrant@node01:~$ docker container inspect web | jq
[
  {
    "Id": "30bc251e72462f302fc6bce4146022adbf97ffb3c0bcfca88bf36639195d7fce",
    "Created": "2021-09-02T16:54:18.78803397Z",
    "Path": "/docker-entrypoint.sh",
    "Args": [
      "nginx",
      "-g",
      "daemon off;"
    ],
    "State": {
      "Status": "running",
      "Running": true,
      "Paused": false,
      "Restarting": false,
      "OOMKilled": false,
      "Dead": false,
      "Pid": 15108,
      "ExitCode": 0,
      "Error": "",
      "StartedAt": "2021-09-02T16:54:19.515561375Z",
      "FinishedAt": "0001-01-01T00:00:00Z"
    },
    "Image": "sha256:dd34e67e3371dc2d1328790c3157ee42dfcae74afffd86b297459ed87a98c0fb",
    "ResolvConfPath": "/var/lib/docker/containers/30bc251e72462f302fc6bce4146022adbf97ffb3c0bcfca88bf36639195d7fce/resolv.conf",
    "HostnamePath": "/var/lib/docker/containers/30bc251e72462f302fc6bce4146022adbf97ffb3c0bcfca88bf36639195d7fce/hostname",
    "HostsPath": "/var/lib/docker/containers/30bc251e72462f302fc6bce4146022adbf97ffb3c0bcfca88bf36639195d7fce/hosts",
    "LogPath": "/var/lib/docker/containers/30bc251e72462f302fc6bce4146022adbf97ffb3c0bcfca88bf36639195d7fce/30bc251e72462f302fc6bce4146022adbf97ffb3c0bcfca88bf36639195d7fce-json.log",
    "Name": "/web",
    "RestartCount": 0,
    "Driver": "overlay2",
    "Platform": "linux",
    "MountLabel": "",
    "ProcessLabel": "",
    "AppArmorProfile": "docker-default",
    "ExecIDs": null,
    "HostConfig": {
      "Binds": null,
      "ContainerIDFile": "",
      "LogConfig": {
        "Type": "json-file",
        "Config": {}
      },
      "NetworkMode": "host",
      "PortBindings": {},
      "RestartPolicy": {
        "Name": "no",
        "MaximumRetryCount": 0
      },
      "AutoRemove": false,
      "VolumeDriver": "",
      "VolumesFrom": null,
      "CapAdd": null,
      "CapDrop": null,
      "CgroupnsMode": "host",
      "Dns": [],
      "DnsOptions": [],
      "DnsSearch": [],
      "ExtraHosts": null,
      "GroupAdd": null,
      "IpcMode": "private",
      "Cgroup": "",
      "Links": null,
      "OomScoreAdj": 0,
      "PidMode": "",
      "Privileged": false,
      "PublishAllPorts": false,
      "ReadonlyRootfs": false,
      "SecurityOpt": null,
      "UTSMode": "",
      "UsernsMode": "",
      "ShmSize": 67108864,
      "Runtime": "runc",
      "ConsoleSize": [
        0,
        0
      ],
      "Isolation": "",
      "CpuShares": 0,
      "Memory": 0,
      "NanoCpus": 0,
      "CgroupParent": "",
      "BlkioWeight": 0,
      "BlkioWeightDevice": [],
      "BlkioDeviceReadBps": null,
      "BlkioDeviceWriteBps": null,
      "BlkioDeviceReadIOps": null,
      "BlkioDeviceWriteIOps": null,
      "CpuPeriod": 0,
      "CpuQuota": 0,
      "CpuRealtimePeriod": 0,
      "CpuRealtimeRuntime": 0,
      "CpusetCpus": "",
      "CpusetMems": "",
      "Devices": [],
      "DeviceCgroupRules": null,
      "DeviceRequests": null,
      "KernelMemory": 0,
      "KernelMemoryTCP": 0,
      "MemoryReservation": 0,
      "MemorySwap": 0,
      "MemorySwappiness": null,
      "OomKillDisable": false,
      "PidsLimit": null,
      "Ulimits": null,
      "CpuCount": 0,
      "CpuPercent": 0,
      "IOMaximumIOps": 0,
      "IOMaximumBandwidth": 0,
      "MaskedPaths": [
        "/proc/asound",
        "/proc/acpi",
        "/proc/kcore",
        "/proc/keys",
        "/proc/latency_stats",
        "/proc/timer_list",
        "/proc/timer_stats",
        "/proc/sched_debug",
        "/proc/scsi",
        "/sys/firmware"
      ],
      "ReadonlyPaths": [
        "/proc/bus",
        "/proc/fs",
        "/proc/irq",
        "/proc/sys",
        "/proc/sysrq-trigger"
      ]
    },
    "GraphDriver": {
      "Data": {
        "LowerDir": "/var/lib/docker/overlay2/3588aa423f76b8c96918b6e86572d47fd78de61b02b15d9ded57807bdfd79289-init/diff:/var/lib/docker/overlay2/f44c2009d7d1244778163de6cfe99e075460d96d84bfb134442417efb885a341/diff:/var/lib/docker/overlay2/9c2ee7f35ee8ad50b57e6f79bd07484ab8502b38f65be62f7da22aa17ad52520/diff:/var/lib/docker/overlay2/0409e37e42b600f640f0dd7f320ad774c53a9a1ea2b69c7b9e5a4d9ecf2ba313/diff:/var/lib/docker/overlay2/ced89883bd1dad20e468525391f821f1c860391096b96928b4efb4b5e01e4aa0/diff:/var/lib/docker/overlay2/88e8e038d0203f219a33ba03e9ff985919e02078d0089c4920535ff7c1b13dab/diff:/var/lib/docker/overlay2/3723db9987353c8ec19a072333cc50de892a7d8563f48b50c1df7328528747d3/diff",
        "MergedDir": "/var/lib/docker/overlay2/3588aa423f76b8c96918b6e86572d47fd78de61b02b15d9ded57807bdfd79289/merged",
        "UpperDir": "/var/lib/docker/overlay2/3588aa423f76b8c96918b6e86572d47fd78de61b02b15d9ded57807bdfd79289/diff",
        "WorkDir": "/var/lib/docker/overlay2/3588aa423f76b8c96918b6e86572d47fd78de61b02b15d9ded57807bdfd79289/work"
      },
      "Name": "overlay2"
    },
    "Mounts": [],
    "Config": {
      "Hostname": "node01",
      "Domainname": "",
      "User": "",
      "AttachStdin": false,
      "AttachStdout": false,
      "AttachStderr": false,
      "ExposedPorts": {
        "80/tcp": {}
      },
      "Tty": true,
      "OpenStdin": true,
      "StdinOnce": false,
      "Env": [
        "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
        "NGINX_VERSION=1.21.1",
        "NJS_VERSION=0.6.1",
        "PKG_RELEASE=1~buster"
      ],
      "Cmd": [
        "nginx",
        "-g",
        "daemon off;"
      ],
      "Image": "nginx",
      "Volumes": null,
      "WorkingDir": "",
      "Entrypoint": [
        "/docker-entrypoint.sh"
      ],
      "OnBuild": null,
      "Labels": {
        "maintainer": "NGINX Docker Maintainers <docker-maint@nginx.com>"
      },
      "StopSignal": "SIGQUIT"
    },
    "NetworkSettings": {
      "Bridge": "",
      "SandboxID": "6838924e61291f4ae1bf4bd36e8f37dbe37586ecf24f7c85d1672281002c55e7",
      "HairpinMode": false,
      "LinkLocalIPv6Address": "",
      "LinkLocalIPv6PrefixLen": 0,
      "Ports": {},
      "SandboxKey": "/var/run/docker/netns/default",
      "SecondaryIPAddresses": null,
      "SecondaryIPv6Addresses": null,
      "EndpointID": "",
      "Gateway": "",
      "GlobalIPv6Address": "",
      "GlobalIPv6PrefixLen": 0,
      "IPAddress": "",
      "IPPrefixLen": 0,
      "IPv6Gateway": "",
      "MacAddress": "",
      "Networks": {
        "host": {
          "IPAMConfig": null,
          "Links": null,
          "Aliases": null,
          "NetworkID": "e087559f25d13d9b2b0173ba1215cf8b64ce8c5d5e683f9393109216f4b76ad1",
          "EndpointID": "fe15be2f894b1ac36a415d5731a5cd137ac8120ee6ef45dfc574a903351a51b1",
          "Gateway": "",
          "IPAddress": "",
          "IPPrefixLen": 0,
          "IPv6Gateway": "",
          "GlobalIPv6Address": "",
          "GlobalIPv6PrefixLen": 0,
          "MacAddress": "",
          "DriverOpts": null
        }
      }
    }
  }
]

vagrant@node01:~$ ip -c -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp0s3           UP             10.0.2.15/24 fe80::bb:9ff:fe5e:a926/64 
enp0s8           UP             10.20.20.110/24 fe80::a00:27ff:fe26:75b0/64 
docker0          DOWN           172.17.0.1/16 fe80::42:87ff:feef:d665/64

vagrant@node01:~$ docker container run -dit --name web2 --network bridge -p 81:80 nginx
b11cfd89bb980842ea5316b321f423dcbd152a4f99fbbec5b4f1dd8579fd87bb

vagrant@node01:~$ sudo ss -ntpl | egrep "80|81"
LISTEN   0         128                 0.0.0.0:80               0.0.0.0:*        users:(("nginx",pid=15164,fd=7),("nginx",pid=15163,fd=7),("nginx",pid=15108,fd=7))
LISTEN   0         128                 0.0.0.0:81               0.0.0.0:*        users:(("docker-proxy",pid=15224,fd=4))                                        
LISTEN   0         128                    [::]:80                  [::]:*        users:(("nginx",pid=15164,fd=8),("nginx",pid=15163,fd=8),("nginx",pid=15108,fd=8))
LISTEN   0         128                    [::]:81                  [::]:*        users:(("docker-proxy",pid=15230,fd=4)

# 80
vagrant@node01:~$ curl localhost:80
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>

# 81
vagrant@node01:~$ curl localhost:81
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>


vagrant@node01:~$ docker container ls
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                               NAMES
b11cfd89bb98   nginx     "/docker-entrypoint.…"   3 minutes ago    Up 3 minutes    0.0.0.0:81->80/tcp, :::81->80/tcp   web2
30bc251e7246   nginx     "/docker-entrypoint.…"   11 minutes ago   Up 11 minutes                                       web

vagrant@node01:~$ docker container rm -f web web2
web
web2

# sem rede
vagrant@node01:~$ docker container run -dit --name sem-rede --network none alpine ash

vagrant@node01:~$ docker container exec sem-rede ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00

vagrant@node01:~$ docker container exec sem-rede ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever   

# revome tudo

vagrant@node01:~$ docker container rm -f $(docker container ls -aq)
750024b59b97

# -h = hostname

vagrant@node01:~$ docker container run -dit --name container1 -h servidor debian

vagrant@node01:~$ docker container run -dit --name container2 -h cliente debian
88af91e7444c099dac96f11aebf13184a3ed1e1ef8c005b1f7f2590481605a40

vagrant@node01:~$ ip -c -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp0s3           UP             10.0.2.15/24 fe80::bb:9ff:fe5e:a926/64 
enp0s8           UP             10.20.20.110/24 fe80::a00:27ff:fe26:75b0/64 
docker0          UP             172.17.0.1/16 fe80::42:87ff:feef:d665/64 
veth0ecd3d6@if13 UP             fe80::c0a0:2fff:fe29:fa03/64 
veth42e8822@if15 UP             fe80::24a0:31ff:fe08:9bed/64 

# falhou ao rodar aqui

vagrant@node01:~$ docker container exec container1 ip -c a show eth0
OCI runtime exec failed: exec failed: container_linux.go:380: starting container process caused: exec: "ip": executable file not found in $PATH: unknown

$ docker container exec container1 ip -c a show eth0
$ docker container exec container2 ip -c a show eth0

vagrant@node01:~$ ip -c -br a show docker0
docker0          UP             172.17.0.1/16 fe80::42:87ff:feef:d665/64

# testar conectividade # não funcinou mesmo erro acima

vagrant@node01:~$ docker container exec container1 ping -c4 172.17.0.3

vagrant@node01:~$ docker container exec container2 ping -c4 172.17.0.3

vagrant@node01:~$ docker container exec container1 ping -c4 cliente

vagrant@node01:~$ docker container exec container1 ping -c4 servidor

# ****bridge não oferece resolução de DNS Interno*****

# CONTAINER  REDE -->
# DEFAULT BRIDGE NETWORK --> NÃO TEM DNS
# USER-DEFINED BRIDGE NETWORK --> TEM DNS

# LINUX

vagrant@node01:~$ cat /etc/nsswitch.conf
# /etc/nsswitch.conf
#
# Example configuration of GNU Name Service Switch functionality.
# If you have the `glibc-doc-reference' and `info' packages installed, try:
# `info libc "Name Service Switch"' for information about this file.

passwd:         compat systemd
group:          compat systemd
shadow:         compat
gshadow:        files

hosts:          files dns
networks:       files

protocols:      db files
services:       db files
ethers:         db files
rpc:            db files

netgroup:       nis

# /etc/hosts <-- OW, CONHECE O CLIENTE??? N CONHEÇO
# DNS --> REDE BRIDGE

vagrant@node01:~$ docker container rm -f container1 container2
container1
container2

vagrant@node01:~$ docker container run -dit --name container1 -h servidor debian
bc879298dc5d57bb3528255644fadd23d36160834f6af7de6ddce071d1607a04

# Criei um container e linquei um container no outro servidor=container1

vagrant@node01:~$ docker run -dit --name container2 --link container1:servidor -h cliente debian
9ef8271f560cdaf6acf576dda3b1da944d824e02511f09cfb4c417ccbdfb1b68

# erro igual acima
vagrant@node01:~$ docker container exec container2 ping -c4 container1
OCI runtime exec failed: exec failed: container_linux.go:380: starting container process caused: exec: "ping": executable file not found in $PATH: unknown

vagrant@node01:~$ docker container rm -f container1 container2
container1
container2

# Criar a rede User Defined Bridge de modo correto
# USER-DEFINED BRIDGE ou REDE BRIDGE DEFINIDA PELO USUÁRIO
 - DNS AUTOMATICO
 - MELHOR ISOLAMENTO
 - CONECTAR E DESCONECTAR ON-THE-FLY 
 - SÃO CONFIGURAVEIS E PERSONALIZAVEIS

vagrant@node01:~$ docker network create --driver bridge --subnet 172.20.0.0/16 dca-lan
28d69a3664c6841662db41016949891444e06dbc61038e4c5004771507205ee3

vagrant@node01:~$ docker network inspect dca-lan | jq
[
  {
    "Name": "dca-lan",
    "Id": "28d69a3664c6841662db41016949891444e06dbc61038e4c5004771507205ee3",
    "Created": "2021-09-02T20:24:19.411059439Z",
    "Scope": "local",
    "Driver": "bridge",
    "EnableIPv6": false,
    "IPAM": {
      "Driver": "default",
      "Options": {},
      "Config": [
        {
          "Subnet": "172.20.0.0/16"
        }
      ]
    },
    "Internal": false,
    "Attachable": false,
    "Ingress": false,
    "ConfigFrom": {
      "Network": ""
    },
    "ConfigOnly": false,
    "Containers": {},
    "Options": {},
    "Labels": {}
  }
]

vagrant@node01:~$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
d812223dc08e   bridge    bridge    local
28d69a3664c6   dca-lan   bridge    local
e087559f25d1   host      host      local
606862980ab8   none      null      local

vagrant@node01:~$ docker container run -dit --name container1 -h servidor --network dca-lan debian
9e04b76445e3e4f3803a255cfe173192d697d24c9f8a5c2504f8e40097e20e81

vagrant@node01:~$ docker container run -dit --name container2 -h cliente --network dca-lan debian
5ac02deb18282ada2dd0131d393284a8e741cfcb35dcdaf82b9fc0de14c6dbf0

vagrant@node01:~$ docker network inspect dca-lan | jq
[
  {
    "Name": "dca-lan",
    "Id": "28d69a3664c6841662db41016949891444e06dbc61038e4c5004771507205ee3",
    "Created": "2021-09-02T20:24:19.411059439Z",
    "Scope": "local",
    "Driver": "bridge",
    "EnableIPv6": false,
    "IPAM": {
      "Driver": "default",
      "Options": {},
      "Config": [
        {
          "Subnet": "172.20.0.0/16"
        }
      ]
    },
    "Internal": false,
    "Attachable": false,
    "Ingress": false,
    "ConfigFrom": {
      "Network": ""
    },
    "ConfigOnly": false,
    "Containers": {
      "0266798de56890483b2545d9f581c5d7108f92079dc6b27c5d00df13756f2a06": {
        "Name": "container1",
        "EndpointID": "2ecd2b3e818a7c82a98270d9720710bf537ea5d776cb2d6179b36728294187c6",
        "MacAddress": "02:42:ac:14:00:02",
        "IPv4Address": "172.20.0.2/16",
        "IPv6Address": ""
      },
      "5ac02deb18282ada2dd0131d393284a8e741cfcb35dcdaf82b9fc0de14c6dbf0": {
        "Name": "container2",
        "EndpointID": "93575be74cfbfaadcb15ca9706986f357983039a5653baaabc441cb7c7beaf4f",
        "MacAddress": "02:42:ac:14:00:03",
        "IPv4Address": "172.20.0.3/16",
        "IPv6Address": ""
      }
    },
    "Options": {},
    "Labels": {}
  }
]

# aquele erro

vagrant@node01:~$ docker container exec container1 ping -c4 cliente
OCI runtime exec failed: exec failed: container_linux.go:380: starting container process caused: exec: "ping": executable file not found in $PATH: unknown

vagrant@node01:~$ docker container exec container1 ping -c4 container2
OCI runtime exec failed: exec failed: container_linux.go:380: starting container process caused: exec: "ping": executable file not found in $PATH: unknown

vagrant@node01:~$ docker container exec container2 ping -c4 servidor
OCI runtime exec failed: exec failed: container_linux.go:380: starting container process caused: exec: "ping": executable file not found in $PATH: unknown

vagrant@node01:~$ docker container exec container2 ping -c4 container1
OCI runtime exec failed: exec failed: container_linux.go:380: starting container process caused: exec: "ping": executable file not found in $PATH: unknown

# remover o cabo de rede do container

vagrant@node01:~$ docker network disconnect dca-lan container2

vagrant@node01:~$ docker network inspect dca-lan | jq
[
  {
    "Name": "dca-lan",
    "Id": "28d69a3664c6841662db41016949891444e06dbc61038e4c5004771507205ee3",
    "Created": "2021-09-02T20:24:19.411059439Z",
    "Scope": "local",
    "Driver": "bridge",
    "EnableIPv6": false,
    "IPAM": {
      "Driver": "default",
      "Options": {},
      "Config": [
        {
          "Subnet": "172.20.0.0/16"
        }
      ]
    },
    "Internal": false,
    "Attachable": false,
    "Ingress": false,
    "ConfigFrom": {
      "Network": ""
    },
    "ConfigOnly": false,
    "Containers": {
      "0266798de56890483b2545d9f581c5d7108f92079dc6b27c5d00df13756f2a06": {
        "Name": "container1",
        "EndpointID": "2ecd2b3e818a7c82a98270d9720710bf537ea5d776cb2d6179b36728294187c6",
        "MacAddress": "02:42:ac:14:00:02",
        "IPv4Address": "172.20.0.2/16",
        "IPv6Address": ""
      }
    },
    "Options": {},
    "Labels": {}
  }
]

# erro mas não pinga

vagrant@node01:~$ docker container exec container1 ping -c4 container2
OCI runtime exec failed: exec failed: container_linux.go:380: starting container process caused: exec: "ping": executable file not found in $PATH: unknown

vagrant@node01:~$ docker container ls
CONTAINER ID   IMAGE     COMMAND   CREATED         STATUS         PORTS     NAMES
5ac02deb1828   debian    "bash"    7 minutes ago   Up 7 minutes             container2
0266798de568   debian    "bash"    8 minutes ago   Up 8 minutes             container1

# conectando o cabo novamente no container para tem acesso a rede com ip modifidado

vagrant@node01:~$ docker network connect --ip 172.20.0.200 dca-lan container2

vagrant@node01:~$ docker network inspect dca-lan | jq
[
  {
    "Name": "dca-lan",
    "Id": "28d69a3664c6841662db41016949891444e06dbc61038e4c5004771507205ee3",
    "Created": "2021-09-02T20:24:19.411059439Z",
    "Scope": "local",
    "Driver": "bridge",
    "EnableIPv6": false,
    "IPAM": {
      "Driver": "default",
      "Options": {},
      "Config": [
        {
          "Subnet": "172.20.0.0/16"
        }
      ]
    },
vagrant@node01:~$ docker network inspect dca-lan | jq
[
  {
    "Name": "dca-lan",
    "Id": "28d69a3664c6841662db41016949891444e06dbc61038e4c5004771507205ee3",
    "Created": "2021-09-02T20:24:19.411059439Z",
    "Scope": "local",
    "Driver": "bridge",
    "EnableIPv6": false,
    "IPAM": {
      "Driver": "default",
      "Options": {},
      "Config": [
        {
          "Subnet": "172.20.0.0/16"
        }
      ]
    },
    "Internal": false,
    "Attachable": false,
    "Ingress": false,
    "ConfigFrom": {
      "Network": ""
    },
    "ConfigOnly": false,
    "Containers": {
      "0266798de56890483b2545d9f581c5d7108f92079dc6b27c5d00df13756f2a06": {
        "Name": "container1",
        "EndpointID": "2ecd2b3e818a7c82a98270d9720710bf537ea5d776cb2d6179b36728294187c6",
        "MacAddress": "02:42:ac:14:00:02",
        "IPv4Address": "172.20.0.2/16",
        "IPv6Address": ""
      },
      "5ac02deb18282ada2dd0131d393284a8e741cfcb35dcdaf82b9fc0de14c6dbf0": {
        "Name": "container2",
        "EndpointID": "4668c0065b8070c150f6cdc44e8ca4ed7d32d64e23e9713327f6112a64796c65",
        "MacAddress": "02:42:ac:14:00:c8",
        "IPv4Address": "172.20.0.200/16",
        "IPv6Address": ""
      }
    },
    "Options": {},
    "Labels": {}
  }
]

vagrant@node01:~$ docker container rm -f container1 container2
container1
container2

vagrant@node01:~$ docker container run -dit --name container1 debian
b9d51ba654e58a18692adc01909fe9faa1e2b965b109a16c5889ff47ff8a5046

vagrant@node01:~$ docker container exec -it container1 cat /etc/resolv.conf
# This file is managed by man:systemd-resolved(8). Do not edit.
#
# This is a dynamic resolv.conf file for connecting local clients directly to
# all known uplink DNS servers. This file lists all configured search domains.
#
# Third party programs must not access this file directly, but only through the
# symlink at /etc/resolv.conf. To manage man:resolv.conf(5) in a different way,
# replace this symlink by a static file or a different symlink.
#
# See man:systemd-resolved.service(8) for details about the supported modes of
# operation for /etc/resolv.conf.

nameserver 10.0.2.3
search nvta.corp

# forma correta de alterar, geramente vc não precisa fazer isso
# alterando o dns do container

vagrant@node01:~$ docker container run -dit --name container2 --dns 8.8.8.8 debian
f4d1bf3decbde70261fca8ff4864187085ebc05a1ac0e57987a48821b8bbd9f6

vagrant@node01:~$ docker container exec -it container2 cat /etc/resolv.conf
search nvta.corp
nameserver 8.8.8.8

vagrant@node01:~$ docker container rm -f container1 container2
container1
container2

================================================================

# AULA 07: Docker DCA 07 - Compose (docker-compose) : https://www.youtube.com/watch?v=vEo7T3a6n30

#

┌─[orbite]@[Navita]:~/docker-dca
└──> $ vagrant up node01

# 3 passos (Docker Compose)
#   1- Define o ambiente com um dockerfile, para uma melhor reprodução
#   2- Define os serviços que serão executados no arquivo docker-compose.yml
#   3- Executar o comando docker-compose up

# docker-compose.yml --> Definir a estrutura e como serão executados os containers

Compose and Docker compatibility matrix

# link: https://docs.docker.com/compose/compose-file/ 

Compose file format	Docker Engine release
Compose specification	19.03.0+
3.8	--> 19.03.0+
3.7	--> 18.06.0+
3.6	--> 18.02.0+
3.5	--> 17.12.0+
3.4	--> 17.09.0+
3.3	--> 17.06.0+
3.2	--> 17.04.0+
3.1	--> 1.13.1+
3.0	--> 1.13.0+
2.4	--> 17.12.0+
2.3	--> 17.06.0+
2.2	--> 1.13.0+
2.1	--> 1.12.0+
2.0	--> 1.10.0+

# verificar versão

docker system info

vagrant@node01:~$ docker system info | head -n5
Client:
 Context:    default
 Debug Mode: false
 Plugins:
  app: Docker App (Docker Inc., v0.9.1-beta3)

  vagrant@node01:~$ docker system info | head -n10
Client:
 Context:    default
 Debug Mode: false
 Plugins:
  app: Docker App (Docker Inc., v0.9.1-beta3)
  buildx: Build with BuildKit (Docker Inc., v0.6.1-docker)
  scan: Docker Scan (Docker Inc., v0.8.0)

Server:
 Containers: 0

vagrant@node01:~$ docker --version
Docker version 20.10.8, build 3967b7d 

vagrant@node01:~$ docker system info | grep Version
 Server Version: 20.10.8
 Cgroup Version: 1
WARNING: No swap limit support
 Kernel Version: 4.15.0-154-generic

# Install docker-compose

https://docs.docker.com/compose/install/

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

vagrant@node01:~$ vim docker-compose.yml

vagrant@node01:~$ sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   633  100   633    0     0   7193      0 --:--:-- --:--:-- --:--:--  7193
100 12.1M  100 12.1M    0     0  9495k      0  0:00:01  0:00:01 --:--:-- 10.1M

vagrant@node01:~$ sudo chmod +x /usr/local/bin/docker-compose

vagrant@node01:~$ docker-compose --version
docker-compose version 1.29.2, build 5becea4c

vagrant@node01:~$ docker image ls
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
alpine       latest    14119a10abf4   7 days ago    5.6MB
nginx        latest    dd34e67e3371   2 weeks ago   133MB
debian       latest    fe3c5de03486   2 weeks ago   124MB

vagrant@node01:~$ mkdir -p ~/dockerfiles/webserver
vagrant@node01:~$ cd dockerfiles/webserver/
vagrant@node01:~/dockerfiles/webserver$ ls
vagrant@node01:~/dockerfiles/webserver$ vim Dockerfile

# modo padrão sem compose
# docker container run -dit --name <NOME> -p 80:80 <IMAGEM>

FROM    debian
RUN     apt-get update; \
        apt-get install -yd \
        wget \
        git \
        apache2
EXPOSE  80
CMD     ["apachectl", "-D", "FOREGROUND"]

vagrant@node01:~/dockerfiles/webserver$ vim docker-compose.yml

# COMENTARIOS PARA REFERENCIA
#
# version -->  define a versao do arquivo compose
# services --> define uma seçao para os serviços
# build -->    define o local do dockerfile  =  ( docker image build -t imagem_webserver . )
# hostname --> define o hostname do container
# ports -->    define quais portas serao publicadas
# restart -->  define uma politica de restart do container
#
# docker container run -dit --name <NOME> -p 80:80 <IMAGEM>
# docker container run -dit --name webserver --hostname webserver -p 80:80 imagem_webserver
# ------------------------------------------------------------------ 
#
# DOCKER-COMPOSE: -->

version:  '3.3'

services:
  webserver:
    build: . # passa o path do seu diretorio, no nosso caso e neste local entao fica com .
    hostname: webserver
    ports:
      - 80:80
    restart: always # opçoes: --> unless-stopped, always, on-failure, no = (DEFAULT) 

# subir docker-compose

vagrant@node01:~/dockerfiles/webserver$ docker-compose up -d

FROM    debian
RUN     apt-get update; \
        apt-get install wget git apache2 -yq
EXPOSE  80
CMD     ["apachectl", "-D", "FOREGROUND"]


# precisei recriar a node01 e resintalar e os ajuste acima do Dockerfile

vagrant@node01:~/dockerfiles/webserver$ docker ps
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS         PORTS                               NAMES
70cc7319444c   webserver_webserver   "apachectl -D FOREGR…"   6 seconds ago   Up 4 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp   webserver_webserver_1

# listar no docker-compose
docker-compose ps

vagrant@node01:~/dockerfiles/webserver$ docker-compose ps
        Name                    Command           State                Ports              
------------------------------------------------------------------------------------------
webserver_webserver_1   apachectl -D FOREGROUND   Up      0.0.0.0:80->80/tcp,:::80->80/tcp

vagrant@node01:~/dockerfiles/webserver$ ip -c -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp0s3           UP             10.0.2.15/24 fe80::bb:9ff:fe5e:a926/64 
enp0s8           UP             10.20.20.110/24 fe80::a00:27ff:fea9:740d/64 
docker0          DOWN           172.17.0.1/16 fe80::42:ffff:feb9:fe95/64 
br-24390ea14227  UP             172.18.0.1/16 fe80::42:98ff:fe6e:9d5f/64 
veth1552572@if8  UP             fe80::b85b:86ff:fe76:720/64 

vagrant@node01:~/dockerfiles/webserver$ docker-compose stop
Stopping webserver_webserver_1 ... done

vagrant@node01:~/dockerfiles/webserver$ docker-compose start
Starting webserver ... done

vagrant@node01:~/dockerfiles/webserver$ curl localhost

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Apache2 Debian Default Page: It works</title>
    <style type="text/css" media="screen">
  * {
    margin: 0px 0px 0px 0px;
    padding: 0px 0px 0px 0px;
  }

  body, html {
    padding: 3px 3px 3px 3px;

    background-color: #D8DBE2;

    font-family: Verdana, sans-serif;
    font-size: 11pt;
    text-align: center;
  }


vagrant@node01:~/dockerfiles/webserver$ curl localhost | head -5
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 10701  100 10701    0     0      0      0 --:--:-- --:--:-- --:--:--     0
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   0     0   696k      0 --:--:-- --:--:-- --:--:--  696k
(23) Failed writing body

# Estamos trabalhando uma camada acima dos containers com Compose
# Estamos trabalhando com serviços, ele é composto de um container, services : ele cria uma nova rede, garante uma segurança minima tbm
# Uma camada a mais de segurança
# Compose sempre cria um rede bridge não padrão, resolução dns!

vagrant@node01:~/dockerfiles/webserver$ docker network ls
NETWORK ID     NAME                DRIVER    SCOPE
03b330c9c7b5   bridge              bridge    local
2a31c616df2f   host                host      local
109ced2f11d1   none                null      local
24390ea14227   webserver_default   bridge    local

# docker-compose down --> destroi o container

vagrant@node01:~/dockerfiles/webserver$ docker-compose down
Removing webserver_webserver_1 ... done
Removing network webserver_default

vagrant@node01:~/dockerfiles/webserver$ mkdir html
vagrant@node01:~/dockerfiles/webserver$ echo "<h1> Curso Docker DCA 100% Gratuito - youtube.com/caiodelgadonew</h1>" > html/index.html

vagrant@node01:~/dockerfiles/webserver$ tree
.
├── Dockerfile
├── docker-compose.yml
└── html
    └── index.html

1 directory, 3 files

# add um volume

vagrant@node01:~/dockerfiles/webserver$ vim docker-compose.yml

# COMENTARIOS PARA REFERENCIA
#
# version -->  define a versao do arquivo compose
# services --> define uma seçao para os serviços
# build -->    define o local do dockerfile  =  ( docker image build -t imagem_webserver . )
# hostname --> define o hostname do container
# ports -->    define quais portas serao publicadas
# restart -->  define uma politica de restart do container
#
# docker container run -dit --name <NOME> -p 80:80 <IMAGEM>
# docker container run -dit --name webserver --hostname webserver -p 80:80 imagem_webserver
# ------------------------------------------------------------------ 
#
# DOCKER-COMPOSE: -->

version:  '3.3'

services:
  webserver:
    build: . # passa o path do seu diretorio, no nosso caso e neste local entao fica com .
    hostname: webserver
    ports:
      - 80:80
    restart: always # opçoes: --> unless-stopped, always, on-failure, no = (DEFAULT)
    volumes:
      - $PWD/html:/var/www/html
        # PWD = Print Working Directory    


vagrant@node01:~/dockerfiles/webserver$ pwd
/home/vagrant/dockerfiles/webserver            
~                                          

# variavel de ambiente do linux $PWD

vagrant@node01:~/dockerfiles/webserver$ echo $PWD
/home/vagrant/dockerfiles/webserver

vagrant@node01:~/dockerfiles/webserver$ docker-compose up -d
Creating network "webserver_default" with the default driver
Creating webserver_webserver_1 ... done

# teste http://10.20.20.110/

vagrant@node01:~/dockerfiles/webserver$ ip -c -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp0s3           UP             10.0.2.15/24 fe80::bb:9ff:fe5e:a926/64 
enp0s8           UP             10.20.20.110/24 fe80::a00:27ff:fea9:740d/64 
docker0          DOWN           172.17.0.1/16 fe80::42:ffff:feb9:fe95/64 
br-a1aeac844b9d  UP             172.19.0.1/16 fe80::42:edff:fe8d:d5dc/64 
veth414a606@if13 UP             fe80::5cb3:3bff:fe44:fa90/64 

# jogar no navegador

http://10.20.20.110/

vai aparecer:
Curso Docker DCA 100% Gratuito - youtube.com/caiodelgadonew

# Rodar imagem do docker hub
# EX: build pode ser substituido por --> image: image: caiodelgadonew/webserver:apache2
# não executar essa imagem pois ela foi deletada

version:  '3.3'

services:
  webserver:
    image: caiodelgadonew/webserver:apache2
    #build: . # passa o path do seu diretorio, no nosso caso e neste local entao fica com .
    hostname: webserver
    ports:
      - 80:80
    restart: always # opçoes: --> unless-stopped, always, on-failure, no = (DEFAULT)
    volumes:
      - $PWD/html:/var/www/html
        # PWD = Print Working Directory 

vagrant@node01:~/dockerfiles/webserver$ docker-compose down
Stopping webserver_webserver_1 ... done
Removing webserver_webserver_1 ... done
Removing network webserver_default  

vagrant@node01:~/dockerfiles/webserver$ vim wordpress-compose.yml

version: '3'

# docker volume create mysql_db
volumes:
  mysql_db:

# docker network create wordpress_net
networks:
  wordpress_net:

services:
# docker container run --name wordpress -p 80:80 -e VARIAVEIS:VALORES wordpress        
# docker cotainer run --name wordpress -p 80:80 -e WORDPRESS_DB_HOST=db -e WORDPRESS_DB_USER=wpuser -e WORDPRESS_DB_PASSWORD=caiodelgadonew@youtube -e WORDPRESS_DB_NAME=wordpress wordpress(image)
  wordpress:
    image: wordpress
    restart: always
    ports:
      - 80:80
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: wpuser
      WORDPRESS_DB_PASSWORD: caiodelgadonew@youtube
      WORDPRESS_DB_NAME: wordpress

      # docker container run --hostname db -p 3306:3306 -v mysql_db:/var/lib/mysql -e MYSQL_DATABASE=wordpress -e MYSQL_USER=user -e MYSQL_PASSWORD=caiodelgadonew@youtube -e MYSQL_RANDOM_ROOT_PASSWORD='1' mysql:5.7

    networks:
      - wordpress_net
    depends_on:
      - db  

  db:
    image: mysql:5.7
    restart: always
    volumes:
      - mysql_db:/var/lib/mysql
    #ports: opçcional pois vou deixar ele na mesma rede
      #- 3306:3306  
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wpuser
      MYSQL_PASSWORD: Arthur
      MYSQL_RANDOM_ROOT_PASSWORD: '1'
    networks:
      - wordpress_net

# default ele sempre vai buscar o docker-compose mas para apontar para um arquivo pesonalizado com seu nome diferente -->
# -f informa qual arquivo do compose eu quero subir: wordpress-compose.yml
docker-compose-f wordpress-compose.yml up -d  

# comando pra listar docker-compose personalizado com nome
vagrant@node01:~/dockerfiles/webserver$ docker-compose -f wordpress-compose.yml ps
        Name                       Command                 State                   Ports              
------------------------------------------------------------------------------------------------------
webserver_db_1          docker-entrypoint.sh mysqld      Restarting                                   
webserver_wordpress_1   docker-entrypoint.sh apach ...   Up           0.0.0.0:80->80/tcp,:::80->80/tcp


10.20.20.100    master.docker-dca.example
10.20.20.110    node01.docker-dca.example
10.20.20.120    node02.docker-dca.example
10.20.20.200    registry.docker-dca.example
127.0.1.1       ubuntu-bionic   ubuntu-bionic


vagrant@node01:~/dockerfiles/webserver$ vim docker-compose.yml
vagrant@node01:~/dockerfiles/webserver$ docker-compose up -d

#replicas

version:  '3.9'
  
services:
  webserver:
    build: . # passa o path do seu diretorio, no nosso caso e neste local entao fica com .
    hostname: webserver
    #ports:
    # - 80:80
    deploy:
      replicas: 1
    restart: on-failure # opçoes: --> unless-stopped, always, on-failure, no = (DEFAULT)
    volumes:
      - $PWD/html:/var/www/html
        # PWD = Print Working Directory

# aumentando pra 3

vagrant@node01:~/dockerfiles/webserver$ docker-compose up -d
WARNING: Found orphan containers (webserver_db_1, webserver_wordpress_1) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up.
Creating webserver_webserver_2 ... done
Creating webserver_webserver_3 ... done

# ou scale
vagrant@node01:~/dockerfiles/webserver$ docker-compose scale webserver=4
WARNING: The scale command is deprecated. Use the up command with the --scale flag instead.
Creating webserver_webserver_4 ... done

vagrant@node01:~/dockerfiles/webserver$ docker-compose ps
        Name                    Command           State   Ports 
----------------------------------------------------------------
webserver_webserver_1   apachectl -D FOREGROUND   Up      80/tcp
webserver_webserver_2   apachectl -D FOREGROUND   Up      80/tcp
webserver_webserver_3   apachectl -D FOREGROUND   Up      80/tcp
webserver_webserver_4   apachectl -D FOREGROUND   Up      80/tcp

vagrant@node01:~/dockerfiles/webserver$ docker-compose scale webserver=1
WARNING: The scale command is deprecated. Use the up command with the --scale flag instead.
Stopping and removing webserver_webserver_2 ... done
Stopping and removing webserver_webserver_3 ... done
Stopping and removing webserver_webserver_4 ... done

1:53 parou video

# traefik compose

deu erro hahaha mas ok
================================================================

# AULA 8 : Docker DCA 08 - Raft Consensus & Docker Swarm

https://www.youtube.com/watch?v=2M-e3Mj8vP0&t=33s

┌─[orbite]@[Navita]:~/docker-dca
└──> $ vim Vagrantfile

# aletrado no Vagrantfile
 end
      machine.vm.provision "shell", path: "provision.sh"
      machine.vm.provision "shell", inline: "hostnamectl set-hostname #{name}.docker-dca.example"
    end
  end
end


┌─[orbite]@[Navita]:~/docker-dca
└──> $ vim provision.sh 

# Garantindo as chaves
#  ssh-keygen -q -t rsa -f key -N ''

KEY_PATH='/vagrant/files'
mkdir -p /root/.ssh
cp $KEY_PATH/key /root/.ssh/id_rsa
cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

# Garantindo os hosts
HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
echo '10.20.20.100 master.docker-dca.example' >> /etc/hosts
echo '10.20.20.110 node01.docker-dca.example' >> /etc/hosts
echo '10.20.20.120 node02.docker-dca.example'>> /etc/hosts
echo '10.20.20.200 registry.docker-dca.example' >> /etc/hosts

curl -fsSL https:get.docker.com | bash

┌─[orbite]@[Navita]:~/docker-dca
└──> $ vagrant destroy -f
==> registry: VM not created. Moving on...
==> node02: VM not created. Moving on...
==> node01: VM not created. Moving on...
==> master: VM not created. Moving on...

┌─[orbite]@[Navita]:~/docker-dca
└──> $ vagrant up master node01 node02

# DOCKER SWARM --> Orquestração de Containers

# Cluster --> Conjunto de Computadores que trabalham em grupo de forma a ser visto como sistema único

32 Cores - 256 GB RAM $$$$$$$$$ --> alto custo pra ter uma máquina

# Em Cluster
4 Cores - 8 GB $$$ (x10)

# HORIZONTAL SCALING --> ESCALONAMENTO HORIZONTAL
Máquinas "Menores" lado a lado para trabalharem com 1 proposito

# VERTICAL SCALING --> ESCALONAMENTO VERTICAL
Maquinas "Maiores" + PROCESSADOR + DISCO + RAM

# Node (Nó) --> Um elemento computacional de um cluster
# PRIMARIO / SECUNDARIO (Master / Follower) ou (Manager / Worker) termo slave foi abolido!

# MASTER --> MANAGER
# NODE01 --> WORKER
# NODE02 --> WORKER


# NODES --> termos

Main       / Secondary
Conductor  / Follower
Leader     / Follower
Host       / Client
Sender     / Receiver
Producer   / Consumer 
Primary    / Replicas
Manager    / Worker

# RAFT CONSENSUS

RAFT = CANOA / JANGADA
CONSENSUS = CONSENSU 

?COM QUANTOS PAUS SE FAZ UMA JANGADA?

JANGADA =  3 TORAS DE MADEIRA

SISTEMA UNICO --> ARMAZENA UM VALOR UNICO (Consenso)

RAFT - Tolera até (N-1)/2 falhas --> N=1 0/2 --> 0 # NÃO USAR
     - Quarum de (N/2)+1         --> N=2 1/2 --> 0.5 = 0 # NÃO USAR
                                 --> N=3 2/2 --> 1 # ACEITAVEL OU IDEAL     =  RAFT CONSENSUS --> 3 TORAS = 3 NOS
                                 --> N=4 3/2 --> 1.5 = 1  # NÃO USAR                               
                                 --> N=5 4/2 --> 2  # IDEAL MASTER POR QUESTÃO DE DESEMPENHO DE REDE!
                                 --> N=6 5/2 --> 2.5 = 2 # NÃO USAR
                                 --> N=7 6/2 --> 3 # DA PRA ACEITAR
# QUANTIDADE DE MASTER

[1] 3 5 [7] <---- MASTER        1 = ESTUDOS                         


# ETCD --> BANCO DE DADOS DO K8S                                 


# SPLIT BRAIN --> CEREBRO PARTIDO       

┌─[orbite]@[Navita]:~/docker-dca
└──> $ vagrant ssh master

vagrant@master:~$ ip -c -br a
lo               UNKNOWN        127.0.0.1/8 ::1/128 
enp0s3           UP             10.0.2.15/24 fe80::bb:9ff:fe5e:a926/64 
enp0s8           UP             10.20.20.100/24 fe80::a00:27ff:fe90:9379/64



┌─[orbite]@[Navita]:~/docker-dca
└──> $ vim provision.sh 


# Garantindo as chaves
#  ssh-keygen -q -t rsa -f key -N ''

KEY_PATH='/vagrant/files'
mkdir -p /root/.ssh
cp $KEY_PATH/key /root/.ssh/id_rsa
cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

# Garantindo os hosts
HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
echo '10.20.20.100 master.docker-dca.example' >> /etc/hosts
echo '10.20.20.110 node01.docker-dca.example' >> /etc/hosts
echo '10.20.20.120 node02.docker-dca.example'>> /etc/hosts
echo '10.20.20.200 registry.docker-dca.example' >> /etc/hosts

curl -fsSL https://get.docker.com | bash
systemctl start docker
systemctl enable docker
usermod -aG docker vagrant   

vagrant destroy -f

vagrant up master node01 node02 # operando

# criar dokcer swarm

vagrant@master:~$ #docker swarm init --advertise-addr 10.20.20.100

vagrant@master:~$ docker swarm init --advertise-addr 10.20.20.100
Swarm initialized: current node (t5f9scytait2ac5f0bo11czw4) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-38zk90yh6307mxbwxoyodrflvthrjck1z9wtqfg8g9pnz672vn-9te23e40q1yri7q5aauexb1sf 10.20.20.100:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

# add node como worker

┌─[orbite]@[Navita]:~/docker-dca
└──> $ vagrant ssh node01

vagrant@node01:~$ docker swarm join --token SWMTKN-1-38zk90yh6307mxbwxoyodrflvthrjck1z9wtqfg8g9pnz672vn-9te23e40q1yri7q5aauexb1sf 10.20.20.100:2377
This node joined a swarm as a worker.

# listar os nodes

vagrant@master:~$ docker node ls
ID                            HOSTNAME                    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4 *   master.docker-dca.example   Ready     Active         Leader           20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example   Ready     Active                          20.10.8


# recuperando o comando pra add o node

# manager
vagrant@master:~$ docker swarm join-token manager
To add a manager to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-38zk90yh6307mxbwxoyodrflvthrjck1z9wtqfg8g9pnz672vn-9l5qn329azwyt0q9mqopw13e0 10.20.20.100:2377

# worker
vagrant@master:~$ docker swarm join-token worker
To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-38zk90yh6307mxbwxoyodrflvthrjck1z9wtqfg8g9pnz672vn-9te23e40q1yri7q5aauexb1sf 10.20.20.100:2377

[vagrant@node02 ~]$ docker swarm join --token SWMTKN-1-38zk90yh6307mxbwxoyodrflvthrjck1z9wtqfg8g9pnz672vn-9te23e40q1yri7q5aauexb1sf 10.20.20.100:2377
This node joined a swarm as a worker.  

vagrant@master:~$ docker node ls
ID                            HOSTNAME                    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4 *   master.docker-dca.example   Ready     Active         Leader           20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example   Ready     Active                          20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3     node02.docker-dca.example   Ready     Active                          20.10.8

# promovendo um node
vagrant@master:~$ docker node promote node01.docker-dca.example
Node node01.docker-dca.example promoted to a manager in the swarm.

vagrant@master:~$ docker node ls
ID                            HOSTNAME                    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4 *   master.docker-dca.example   Ready     Active         Leader           20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example   Ready     Active         Reachable        20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3     node02.docker-dca.example   Ready     Active                          20.10.8

vagrant@master:~$ watch docker node ls

# simular uma falha
ir no virtual box
node01 --> close --> power off

vagrant@master:~$ docker node ls
ID                            HOSTNAME                    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4 *   master.docker-dca.example   Ready     Active         Leader           20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example   Ready     Active         Unreachable      20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3     node02.docker-dca.example   Ready     Active                          20.10.8

##
Error response from daemon: rpc error: code = Unknown desc = The swarm does not have a leader. It s possible that too few managers are online. Make sure more than half of the manage
rs are online.

obs: perdi meu cluster

##

# subi a node01 voltou o cluster

Every 2.0s: docker node ls                                                                                                        master.docker-dca.example: Thu Sep  9 20:00:22 2021

ID                            HOSTNAME                    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4 *   master.docker-dca.example   Ready     Active         Leader           20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example   Ready     Active         Reachable        20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3     node02.docker-dca.example   Ready     Active                          20.10.8

# promote node02

vagrant@master:~$ docker node promote node02.docker-dca.example
Node node02.docker-dca.example promoted to a manager in the swarm.

Every 2.0s: docker node ls                                                                                                        master.docker-dca.example: Thu Sep  9 20:04:54 2021

ID                            HOSTNAME                    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4 *   master.docker-dca.example   Ready     Active         Leader           20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example   Ready     Active         Reachable        20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3     node02.docker-dca.example   Ready     Active         Reachable        20.10.8

vagrant@master:~$ docker node ls
ID                            HOSTNAME                    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4 *   master.docker-dca.example   Ready     Active         Leader           20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example   Ready     Active         Reachable        20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3     node02.docker-dca.example   Ready     Active         Reachable        20.10.8

# simular uma falha da forma correta

vagrant@master:~$ watch docker node ls

Every 2.0s: docker node ls                                                                                                        master.docker-dca.example: Thu Sep  9 20:06:27 2021

ID                            HOSTNAME                    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4 *   master.docker-dca.example   Ready     Active         Leader           20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example   Ready     Active         Reachable        20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3     node02.docker-dca.example   Ready     Active         Reachable        20.10.8

# derrubei a master
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example   Ready     Active         Reachable        20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3     node02.docker-dca.example   Ready     Active         Reachable        20.10.8


Every 2.0s: docker node ls                                                                                                                                   Thu Sep  9 20:08:43 2021

ID                            HOSTNAME                    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4     master.docker-dca.example   Down      Active         Unreachable      20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example   Ready     Active         Reachable        20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3 *   node02.docker-dca.example   Ready     Active         Leader           20.10.8

┌─[orbite]@[Navita]:~/docker-dca
└──> $ vagrant up master

Every 2.0s: docker node ls                                                                                                                                   Thu Sep  9 20:10:34 2021

ID                            HOSTNAME                    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4     master.docker-dca.example   Ready     Active         Reachable        20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example   Ready     Active         Reachable        20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3 *   node02.docker-dca.example   Ready     Active         Leader           20.10.8

┌─[orbite]@[Navita]:~/docker-dca
└──> $ vagrant halt node02

Every 2.0s: docker node ls                                                                                                        node01.docker-dca.example: Thu Sep  9 20:12:20 2021

ID                            HOSTNAME                    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4     master.docker-dca.example   Ready     Active         Leader           20.10.8
yd4bobxw2dzyrfmbiwhtdci2s *   node01.docker-dca.example   Ready     Active         Reachable        20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3     node02.docker-dca.example   Unknown   Active         Unreachable      20.10.8

# nosso cenário queremos:
1 MANAGER
2 WORKERS

# NODE DEMOTE
vagrant@master:~$ docker node demote node01.docker-dca.example
Manager node01.docker-dca.example demoted in the swarm.

vagrant@master:~$ docker node demote node02.docker-dca.example
Manager node02.docker-dca.example demoted in the swarm.

# WORKERS
vagrant@master:~$ docker node ls
ID                            HOSTNAME                    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4 *   master.docker-dca.example   Ready     Active         Leader           20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example   Ready     Active                          20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3     node02.docker-dca.example   Ready     Active                          20.10.8

┌─[orbite]@[Navita]:~/docker-dca
└──> $ vagrant halt

-----------------------------------------------

# SERVICES --> SERVICO --> ESTADO DESEJADO ( PÃO COM MANTEIGA E MORTANDELA )
# TASKS    --> TAREFAS

1. Comprar o PÃO
2. Comprar a Manteiga e MORTANDELA
3. Cortar o PÃO
4. Passar Manteiga e MORTANDELA

# TASK --> UNIDADE ATOMICA  AGENDADA EM UM SWARM
# TASK -----> ASSIGNED -----> PREPARED -----> RUNNING

# SERVIÇOES REPLICADOS X GLOBAIS
# REPLICADO --> RODA UMA QUANTIDADE DETERMINADA

=========================================================================================

# AULA 09: Docker DCA 09 - Docker Swarm - Registry, Services e Tasks
https://www.youtube.com/watch?v=HUH0y5skwe0&t=11s

https://github.com/caiodelgadonew/docker/blob/main/manuscript/06-swarm.md

vagrant up

vagrant@master:~$ docker node ls
ID                            HOSTNAME                    STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4 *   master.docker-dca.example   Ready     Active         Leader           20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example   Ready     Active                          20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3     node02.docker-dca.example   Ready     Active                          20.10.8

vagrant@master:~$ docker swarm join-token worker
To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-38zk90yh6307mxbwxoyodrflvthrjck1z9wtqfg8g9pnz672vn-9te23e40q1yri7q5aauexb1sf 10.20.20.100:2377

┌─[orbite]@[Navita]:~/docker-dca
└──> $ vagrant ssh registry 

vagrant@registry:~$ docker swarm join --token SWMTKN-1-38zk90yh6307mxbwxoyodrflvthrjck1z9wtqfg8g9pnz672vn-9te23e40q1yri7q5aauexb1sf 10.20.20.100:2377
This node joined a swarm as a worker.

vagrant@master:~$ docker node ls
ID                            HOSTNAME                      STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4 *   master.docker-dca.example     Ready     Active         Leader           20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example     Ready     Active                          20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3     node02.docker-dca.example     Ready     Active                          20.10.8
0mq77jyrtsif6lru1aochaado     registry.docker-dca.example   Ready     Active                          20.10.8

1. Dockerhub Rate Limiting
2. Segurança
3. Velocidade

vagrant@master:~$ sudo vim /etc/docker/daemon.json

{
       "insecure-registries" : ["registry.docker-dca.example:5000"]
}

vagrant@master:~$ sudo systemctl restart docker

# fazer em todas as máquinas o procedimento acima

# deploy do registry na máquina registry:

vagrant@registry:~$ docker container run -dit --name registry -p 5000:5000 registry:2

vagrant@registry:~$ docker container run -dit --name registry -p 5000:5000 registry:2
Unable to find image 'registry:2' locally
2: Pulling from library/registry
6a428f9f83b0: Pull complete 
90cad49de35d: Pull complete 
b215d0b40846: Pull complete 
429305b6c15c: Pull complete 
6f7e10a4e907: Pull complete 
Digest: sha256:265d4a5ed8bf0df27d1107edb00b70e658ee9aa5acb3f37336c5a17db634481e
Status: Downloaded newer image for registry:2
b2ff10a1566337783b4432be4ac337fd2956be363a8afcecaacc4eb65fd4c20b

vagrant@registry:~$ docker image ls
REPOSITORY   TAG       IMAGE ID       CREATED      SIZE
registry     2         b2cb11db9d3d   9 days ago   26.2MB

vagrant@registry:~$ docker pull alpine
Using default tag: latest
latest: Pulling from library/alpine
a0d0a0d46f8b: Pull complete 
Digest: sha256:e1c082e3d3c45cccac829840a25941e679c25d438cc8412c2fa221cf1a824e6a
Status: Downloaded newer image for alpine:latest
docker.io/library/alpine:latest

vagrant@registry:~$ docker image ls
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
registry     2         b2cb11db9d3d   9 days ago    26.2MB
alpine       latest    14119a10abf4   13 days ago   5.6MB

# alterando a imagem e tagueando para o registry
vagrant@registry:~$ docker image tag alpine registry.docker-dca.example:5000/alpine

vagrant@registry:~$ docker image ls
REPOSITORY                                TAG       IMAGE ID       CREATED       SIZE
registry                                  2         b2cb11db9d3d   9 days ago    26.2MB
alpine                                    latest    14119a10abf4   13 days ago   5.6MB
registry.docker-dca.example:5000/alpine   latest    14119a10abf4   13 days ago   5.6MB

# enviando a imagem pro registry

vagrant@registry:~$ docker push registry.docker-dca.example:5000/alpine
Using default tag: latest
The push refers to repository [registry.docker-dca.example:5000/alpine]
e2eb06d8af82: Pushed 
latest: digest: sha256:69704ef328d05a9f806b6b8502915e6a0a4faa4d72018dc42343f511490daf8a size: 528

# validando se a imagem está lá
vagrant@registry:~$ curl http://registry.docker-dca.example:5000/v2/_catalog
{"repositories":["alpine"]}

# instalar | jq
sudo apt-get install jq -yq > /dev/null 2>&1

sudo yum install jq -yq > /dev/null 2>&1

vagrant@registry:~$ curl -s http://registry.docker-dca.example:5000/v2/_catalog | jq
{
  "repositories": [
    "alpine"
  ]
}

vagrant@master:~$ curl -s http://registry.docker-dca.example:5000/v2/_catalog | jq
{
  "repositories": [
    "alpine"
  ]
}

vagrant@node01:~$ curl -s http://registry.docker-dca.example:5000/v2/_catalog | jq
{
  "repositories": [
    "alpine"
  ]
}

vagrant@registry:~$ docker volume ls
DRIVER    VOLUME NAME
local     28d42b37f1a1a41449a19b05f88ce726a6666c88a6655661bd73f9a61a1b262b

vagrant@registry:~$ docker volume inspect 28d42b37f1a1a41449a19b05f88ce726a6666c88a6655661bd73f9a61a1b262b | jq
[
  {
    "CreatedAt": "2021-09-10T13:05:02Z",
    "Driver": "local",
    "Labels": null,
    "Mountpoint": "/var/lib/docker/volumes/28d42b37f1a1a41449a19b05f88ce726a6666c88a6655661bd73f9a61a1b262b/_data",
    "Name": "28d42b37f1a1a41449a19b05f88ce726a6666c88a6655661bd73f9a61a1b262b",
    "Options": null,
    "Scope": "local"
  }
]

# volume
vagrant@registry:~$ ls -l /var/lib/docker/volumes/28d42b37f1a1a41449a19b05f88ce726a6666c88a6655661bd73f9a61a1b262b/_data
total 4
drwxr-xr-x 3 root root 4096 Sep 10 13:05 docker

# imagens
vagrant@registry:~$ ls -l /var/lib/docker/volumes/28d42b37f1a1a41449a19b05f88ce726a6666c88a6655661bd73f9a61a1b262b/_data/docker/registry/v2/repositories/
total 4
drwxr-xr-x 5 root root 4096 Sep 10 13:05 alpine


# nginx
# mysql:5.7
# wordpress
# caiodelgadonew/docker-supermario
# traefik:v2.4
# DOCKER PULL ; DOCKER IMAGE TAG ; DOCKER PUSH

vagrant@registry:~$ vim images.sh

for image in 'nginx' 'mysql:5.7' 'wordpress' 'caiodelgadonew/docker-supermario' 'traefik:v2.4'
do
docker image pull $image
docker tag $image registry.docker-dca.example:5000/$image
docker push registry.docker-dca.example:5000/$image
done

vagrant@registry:~$ chmod +x images.sh

vagrant@registry:~$ ./images.sh

vagrant@registry:~$ docker image ls
REPOSITORY                                                          TAG       IMAGE ID       CREATED        SIZE
nginx                                                               latest    ad4c705f24d3   19 hours ago   133MB
registry.docker-dca.example:5000/nginx                              latest    ad4c705f24d3   19 hours ago   133MB
wordpress                                                           latest    54fded966e25   5 days ago     618MB
registry.docker-dca.example:5000/wordpress                          latest    54fded966e25   5 days ago     618MB
registry.docker-dca.example:5000/mysql                              5.7       1d7aba917169   7 days ago     448MB
mysql                                                               5.7       1d7aba917169   7 days ago     448MB
registry                                                            2         b2cb11db9d3d   9 days ago     26.2MB
alpine                                                              latest    14119a10abf4   13 days ago    5.6MB
registry.docker-dca.example:5000/alpine                             latest    14119a10abf4   13 days ago    5.6MB
traefik                                                             v2.4      de1a7c9d5d63   3 weeks ago    92MB
registry.docker-dca.example:5000/traefik                            v2.4      de1a7c9d5d63   3 weeks ago    92MB
caiodelgadonew/docker-supermario                                    latest    1623184263b2   6 weeks ago    691MB
registry.docker-dca.example:5000/caiodelgadonew/docker-supermario   latest    1623184263b2   6 weeks ago    691MB

# se este container não estiver rondando não conseguimos enviar e ver as imagens
docker container run -dit --name registry -p 5000:5000 registry:2

vagrant@registry:~$ docker image tag alpine registry.docker-dca.example:5000/alpine
vagrant@registry:~$ docker push registry.docker-dca.example:5000/alpine

curl http://registry.docker-dca.example:5000/v2/_catalog | jq


vagrant@registry:~$ curl http://registry.docker-dca.example:5000/v2/_catalog | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   101  100   101    0     0  10100      0 --:--:-- --:--:-- --:--:-- 10100
{
  "repositories": [
    "alpine",
    "caiodelgadonew/docker-supermario",
    "mysql",
    "nginx",
    "traefik",
    "wordpress"
  ]
}

vagrant@registry:~$ curl http://registry.docker-dca.example:5000/v2/mysql/tags/list | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    32  100    32    0     0   4571      0 --:--:-- --:--:-- --:--:--  4571
{
  "name": "mysql",
  "tags": [
    "5.7"
  ]
}

vagrant@registry:~$ curl http://registry.docker-dca.example:5000/v2/traefik/tags/list | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    35  100    35    0     0   1750      0 --:--:-- --:--:-- --:--:--  1750
{
  "name": "traefik",
  "tags": [
    "v2.4"
  ]
}

vagrant@registry:~$ curl http://registry.docker-dca.example:5000/v2/wordpress/tags/list | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    39  100    39    0     0   5571      0 --:--:-- --:--:-- --:--:--  5571
{
  "name": "wordpress",
  "tags": [
    "latest"
  ]
}

vagrant@registry:~$ docker image tag alpine:latest registry.docker-dca.example:5000/alpine:teste
vagrant@registry:~$ docker image tag alpine:latest registry.docker-dca.example:5000/alpine:abc
vagrant@registry:~$ docker image tag alpine:latest registry.docker-dca.example:5000/alpine:123
vagrant@registry:~$ docker image tag alpine:latest registry.docker-dca.example:5000/alpine:devop

vagrant@registry:~$ docker image push registry.docker-dca.example:5000/alpine:devops
The push refers to repository [registry.docker-dca.example:5000/alpine]
e2eb06d8af82: Layer already exists 
devops: digest: sha256:69704ef328d05a9f806b6b8502915e6a0a4faa4d72018dc42343f511490daf8a size: 528

vagrant@registry:~$ docker image push registry.docker-dca.example:5000/alpine:123
The push refers to repository [registry.docker-dca.example:5000/alpine]
e2eb06d8af82: Layer already exists 
123: digest: sha256:69704ef328d05a9f806b6b8502915e6a0a4faa4d72018dc42343f511490daf8a size: 528

vagrant@registry:~$ docker image push registry.docker-dca.example:5000/alpine:teste
The push refers to repository [registry.docker-dca.example:5000/alpine]
e2eb06d8af82: Layer already exists 
teste: digest: sha256:69704ef328d05a9f806b6b8502915e6a0a4faa4d72018dc42343f511490daf8a size: 528


vagrant@registry:~$ docker image push registry.docker-dca.example:5000/alpine:abc
The push refers to repository [registry.docker-dca.example:5000/alpine]
e2eb06d8af82: Layer already exists 
abc: digest: sha256:69704ef328d05a9f806b6b8502915e6a0a4faa4d72018dc42343f511490daf8a size: 528

vagrant@registry:~$ curl http://registry.docker-dca.example:5000/v2/alpine/tags/list | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    65  100    65    0     0   5909      0 --:--:-- --:--:-- --:--:--  5909
{
  "name": "alpine",
  "tags": [
    "latest",
    "abc",
    "devops",
    "teste",
    "123"
  ]
}

# exemplo baixando imagem pra dentro da sua máquina : dev no caso

vagrant@master:~$ docker pull registry.docker-dca.example:5000/alpine:devops
devops: Pulling from alpine
a0d0a0d46f8b: Pull complete 
Digest: sha256:69704ef328d05a9f806b6b8502915e6a0a4faa4d72018dc42343f511490daf8a
Status: Downloaded newer image for registry.docker-dca.example:5000/alpine:devops
registry.docker-dca.example:5000/alpine:devops

vagrant@master:~$ docker image ls
REPOSITORY                                TAG       IMAGE ID       CREATED       SIZE
registry.docker-dca.example:5000/alpine   devops    14119a10abf4   13 days ago   5.6MB


# SERVICES E TASKS

# SERVICES (SERVIÇOS) ----> estado desejado (3 nginx)
# TASK (TAREFA)       ----> COMO CHEGAR AO ESTADO DESEJADO

# TASK
# TASK E AGENDADORES
# TASK --> UND ATOMICA
# AGENDADORES ---> AGEMDAM TAREFAS E APONTAM PARA NODES

## ESTADO DAS TASK:
ASSIGNED
PREPARED
RUNNING

## SERVICES
- Replicas
- Global

# TIPOS DE DEPLOYS (IMPLANTAÇÃO)
replicated --> quero x Tasks
global     --> quero 1 contaniner em cada Nó

vagrant@master:~$ docker node ls
ID                            HOSTNAME                      STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
t5f9scytait2ac5f0bo11czw4 *   master.docker-dca.example     Ready     Active         Leader           20.10.8
yd4bobxw2dzyrfmbiwhtdci2s     node01.docker-dca.example     Ready     Active                          20.10.8
c4v1tf3jjhyhtwd8wxqn2a1l3     node02.docker-dca.example     Ready     Active                          20.10.8
0mq77jyrtsif6lru1aochaado     registry.docker-dca.example   Ready     Active                          20.10.8

# deploy do serviço

vagrant@master:~$ docker service create --name webserver registry.docker-dca.example:5000/nginx

vagrant@master:~$ docker service create --name webserver registry.docker-dca.example:5000/nginx
xfd5lm3hz225odqg1qrm7262a
overall progress: 1 out of 1 tasks 
1/1: running   [==================================================>] 
verify: Service converged 

vagrant@master:~$ docker service ls
ID             NAME        MODE         REPLICAS   IMAGE                                           PORTS
xfd5lm3hz225   webserver   replicated   1/1        registry.docker-dca.example:5000/nginx:latest   

# verificar estado da task
vagrant@master:~$ docker service ps webserver
ID             NAME          IMAGE                                           NODE                        DESIRED STATE   CURRENT STATE                ERROR     PORTS
qrxsw1c7ksi9   webserver.1   registry.docker-dca.example:5000/nginx:latest   node02.docker-dca.example   Running         Running about a minute ago 

# publicar a porta

vagrant@master:~$ docker service update --publish-add 80 webserver

vagrant@master:~$ docker service update --publish-add 80 webserver
webserver
overall progress: 1 out of 1 tasks 
1/1: running   [==================================================>] 
verify: Service converged 

vagrant@master:~$ docker service ls
ID             NAME        MODE         REPLICAS   IMAGE                                           PORTS
xfd5lm3hz225   webserver   replicated   1/1        registry.docker-dca.example:5000/nginx:latest   *:30000->80/tcp

vagrant@master:~$ docker service ps webserver
ID             NAME              IMAGE                                           NODE                          DESIRED STATE   CURRENT STATE            ERROR     PORTS
jlm1x2i208pf   webserver.1       registry.docker-dca.example:5000/nginx:latest   registry.docker-dca.example   Running         Running 2 minutes ago              
qrxsw1c7ksi9    \_ webserver.1   registry.docker-dca.example:5000/nginx:latest   node02.docker-dca.example     Shutdown        Shutdown 2 minutes ago 

vagrant@master:~$ curl http://node01.docker-dca.example:30000
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>


vagrant@master:~$ curl http://node02.docker-dca.example:30000
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>

vagrant@master:~$ curl http://master.docker-dca.example:30000
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>

vagrant@master:~$ docker network ls
NETWORK ID     NAME              DRIVER    SCOPE
3374a1f91d45   bridge            bridge    local
92df0a78a174   docker_gwbridge   bridge    local
ed596400439a   host              host      local
bqgcv3n7hjlx   ingress           overlay   swarm
44becc95d444   none              null      local

vagrant@master:~$ sudo iptables -nL
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy DROP)
target     prot opt source               destination         
DOCKER-USER  all  --  0.0.0.0/0            0.0.0.0/0           
DOCKER-INGRESS  all  --  0.0.0.0/0            0.0.0.0/0           
DOCKER-ISOLATION-STAGE-1  all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
DOCKER     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
DOCKER     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
DROP       all  --  0.0.0.0/0            0.0.0.0/0           

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain DOCKER (2 references)
target     prot opt source               destination         

Chain DOCKER-INGRESS (1 references)
target     prot opt source               destination         
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:30000
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED tcp spt:30000
RETURN     all  --  0.0.0.0/0            0.0.0.0/0           

Chain DOCKER-ISOLATION-STAGE-1 (1 references)
target     prot opt source               destination         
DOCKER-ISOLATION-STAGE-2  all  --  0.0.0.0/0            0.0.0.0/0           
DOCKER-ISOLATION-STAGE-2  all  --  0.0.0.0/0            0.0.0.0/0           
RETURN     all  --  0.0.0.0/0            0.0.0.0/0           

Chain DOCKER-ISOLATION-STAGE-2 (2 references)
target     prot opt source               destination         
DROP       all  --  0.0.0.0/0            0.0.0.0/0           
DROP       all  --  0.0.0.0/0            0.0.0.0/0           
RETURN     all  --  0.0.0.0/0            0.0.0.0/0           

Chain DOCKER-USER (1 references)
target     prot opt source               destination         
RETURN     all  --  0.0.0.0/0            0.0.0.0/


vagrant@master:~$ docker service inspect webserver
[
    {
        "ID": "xfd5lm3hz225odqg1qrm7262a",
        "Version": {
            "Index": 120
        },
        "CreatedAt": "2021-09-10T15:08:29.236480802Z",
        "UpdatedAt": "2021-09-10T15:24:01.175022861Z",
        "Spec": {
            "Name": "webserver",
            "Labels": {},
            "TaskTemplate": {
                "ContainerSpec": {
                    "Image": "registry.docker-dca.example:5000/nginx:latest@sha256:6fe11397c34b973f3c957f0da22b09b7f11a4802e1db47aef54c29e2813cc125",
                    "Init": false,
                    "StopGracePeriod": 10000000000,
                    "DNSConfig": {},
                    "Isolation": "default"
                },
                "Resources": {
                    "Limits": {},
                    "Reservations": {}
                },
                "RestartPolicy": {
                    "Condition": "any",
                    "Delay": 5000000000,
                    "MaxAttempts": 0
                },
                "Placement": {
                    "Platforms": [
                        {
                            "Architecture": "amd64",
                            "OS": "linux"
                        }
                    ]
                },
                "ForceUpdate": 0,
                "Runtime": "container"
            },
            "Mode": {
                "Replicated": {
                    "Replicas": 1
                }
            },
            "UpdateConfig": {
                "Parallelism": 1,
                "FailureAction": "pause",
                "Monitor": 5000000000,
                "MaxFailureRatio": 0,
                "Order": "stop-first"
            },
            "RollbackConfig": {
                "Parallelism": 1,
                "FailureAction": "pause",
                "Monitor": 5000000000,
                "MaxFailureRatio": 0,
                "Order": "stop-first"
            },
            "EndpointSpec": {
                "Mode": "vip",
                "Ports": [
                    {
                        "Protocol": "tcp",
                        "TargetPort": 80,
                        "PublishMode": "ingress"
                    }
                ]
            }
        },
        "PreviousSpec": {
            "Name": "webserver",
            "Labels": {},
            "TaskTemplate": {
                "ContainerSpec": {
                    "Image": "registry.docker-dca.example:5000/nginx:latest@sha256:6fe11397c34b973f3c957f0da22b09b7f11a4802e1db47aef54c29e2813cc125",
                    "Init": false,
                    "DNSConfig": {},
                    "Isolation": "default"
                },
                "Resources": {
                    "Limits": {},
                    "Reservations": {}
                },
                "Placement": {
                    "Platforms": [
                        {
                            "Architecture": "amd64",
                            "OS": "linux"
                        }
                    ]
                },
                "ForceUpdate": 0,
                "Runtime": "container"
            },
            "Mode": {
                "Replicated": {
                    "Replicas": 1
                }
            },
            "EndpointSpec": {
                "Mode": "vip"
            }
        },
        "Endpoint": {
            "Spec": {
                "Mode": "vip",
                "Ports": [
                    {
                        "Protocol": "tcp",
                        "TargetPort": 80,
                        "PublishMode": "ingress"
                    }
                ]
            },
            "Ports": [
                {
                    "Protocol": "tcp",
                    "TargetPort": 80,
                    "PublishedPort": 30000,
                    "PublishMode": "ingress"
                }
            ],
            "VirtualIPs": [
                {
                    "NetworkID": "bqgcv3n7hjlxqxzbjf4455st2",
                    "Addr": "10.0.0.6/24"
                }
            ]
        },
        "UpdateStatus": {
            "State": "completed",
            "StartedAt": "2021-09-10T15:23:52.6744445Z",
            "CompletedAt": "2021-09-10T15:24:01.174890185Z",
            "Message": "update completed"
        }
    }
]

vagrant@master:~$ docker service inspect webserver --pretty

ID:             xfd5lm3hz225odqg1qrm7262a
Name:           webserver
Service Mode:   Replicated
 Replicas:      1
UpdateStatus:
 State:         completed
 Started:       About an hour ago
 Completed:     About an hour ago
 Message:       update completed
Placement:
UpdateConfig:
 Parallelism:   1
 On failure:    pause
 Monitoring Period: 5s
 Max failure ratio: 0
 Update order:      stop-first
RollbackConfig:
 Parallelism:   1
 On failure:    pause
 Monitoring Period: 5s
 Max failure ratio: 0
 Rollback order:    stop-first
ContainerSpec:
 Image:         registry.docker-dca.example:5000/nginx:latest@sha256:6fe11397c34b973f3c957f0da22b09b7f11a4802e1db47aef54c29e2813cc125
 Init:          false
Resources:
Endpoint Mode:  vip
Ports:
 PublishedPort = 30000
  Protocol = tcp
  TargetPort = 80
  PublishMode = ingress 

vagrant@master:~$ docker service rm webserver
webserver

vagrant@master:~$ docker service ls
ID        NAME      MODE      REPLICAS   IMAGE     PORTS

vagrant@master:~$ docker service create --name pingtest registry.docker-dca.example:5000/alpine ping google.com
pvybyontlivk2ubj33d41x3ob
overall progress: 1 out of 1 tasks 
1/1: running   [==================================================>] 
verify: Service converged 

vagrant@master:~$ docker service ls
ID             NAME       MODE         REPLICAS   IMAGE                                            PORTS
pvybyontlivk   pingtest   replicated   1/1        registry.docker-dca.example:5000/alpine:latest 

vagrant@master:~$ docker service ps pingtest
ID             NAME         IMAGE                                            NODE                          DESIRED STATE   CURRENT STATE            ERROR     PORTS
xomdhsfx0zzs   pingtest.1   registry.docker-dca.example:5000/alpine:latest   registry.docker-dca.example   Running         Running 36 seconds ago  

vagrant@master:~$ docker service logs pingtest
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | PING google.com (142.251.129.46): 56 data bytes
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=0 ttl=61 time=7.525 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=1 ttl=61 time=6.944 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=2 ttl=61 time=6.506 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=3 ttl=61 time=6.448 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=4 ttl=61 time=6.324 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=5 ttl=61 time=6.406 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=6 ttl=61 time=6.272 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=7 ttl=61 time=6.465 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=8 ttl=61 time=5.992 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=9 ttl=61 time=8.034 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=10 ttl=61 time=7.410 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=11 ttl=61 time=6.364 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=12 ttl=61 time=7.222 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=13 ttl=61 time=6.949 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=14 ttl=61 time=6.923 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=15 ttl=61 time=7.497 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=16 ttl=61 time=7.474 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=17 ttl=61 time=6.903 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=18 ttl=61 time=5.942 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=19 ttl=61 time=7.586 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=20 ttl=61 time=7.057 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=21 ttl=61 time=6.776 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=22 ttl=61 time=7.511 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=23 ttl=61 time=5.232 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=24 ttl=61 time=6.270 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=25 ttl=61 time=5.861 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=26 ttl=61 time=7.298 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=27 ttl=61 time=7.187 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=28 ttl=61 time=6.887 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=29 ttl=61 time=6.587 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=30 ttl=61 time=6.436 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=31 ttl=61 time=5.653 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=32 ttl=61 time=7.836 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=33 ttl=61 time=8.257 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=34 ttl=61 time=7.981 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=35 ttl=61 time=7.283 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=36 ttl=61 time=6.935 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=37 ttl=61 time=6.430 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=38 ttl=61 time=7.870 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=39 ttl=61 time=7.068 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=40 ttl=61 time=6.888 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=41 ttl=61 time=5.800 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=42 ttl=61 time=7.652 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=43 ttl=61 time=7.426 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=44 ttl=61 time=6.883 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=45 ttl=61 time=7.118 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=46 ttl=61 time=6.474 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=47 ttl=61 time=5.799 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=48 ttl=61 time=7.950 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=49 ttl=61 time=7.145 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=50 ttl=61 time=6.795 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=51 ttl=61 time=5.553 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=52 ttl=61 time=7.680 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=53 ttl=61 time=8.064 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=54 ttl=61 time=7.285 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=55 ttl=61 time=6.739 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=56 ttl=61 time=7.556 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=57 ttl=61 time=8.023 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=58 ttl=61 time=8.086 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=59 ttl=61 time=7.584 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=60 ttl=61 time=7.011 ms


vagrant@master:~$ docker service scale pingtest=3
pingtest scaled to 3
overall progress: 3 out of 3 tasks 
1/3: running   [==================================================>] 
2/3: running   [==================================================>] 
3/3: running   [==================================================>] 
verify: Service converged 

vagrant@master:~$ docker service ls
ID             NAME       MODE         REPLICAS   IMAGE                                            PORTS
pvybyontlivk   pingtest   replicated   3/3        registry.docker-dca.example:5000/alpine:latest  

vagrant@master:~$ docker service logs pingtest
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | PING google.com (142.251.129.46): 56 data bytes
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=0 ttl=61 time=7.525 ms

pingtest.3.mi4jydgbbnpk@node02.docker-dca.example    | PING google.com (142.251.129.46): 56 data bytes
pingtest.3.mi4jydgbbnpk@node02.docker-dca.example    | 64 bytes from 142.251.129.46: seq=0 ttl=61 time=7.197 ms

pingtest.3.mi4jydgbbnpk@node02.docker-dca.example    | 64 bytes from 142.251.129.46: seq=192 ttl=61 time=6.277 ms
pingtest.2.vqjyq3li3awt@master.docker-dca.example    | 64 bytes from 142.251.129.46: seq=192 ttl=61 time=5.639 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=887 ttl=61 time=6.922 ms
pingtest.2.vqjyq3li3awt@master.docker-dca.example    | 64 bytes from 142.251.129.46: seq=193 ttl=61 time=46184.787 ms
pingtest.3.mi4jydgbbnpk@node02.docker-dca.example    | 64 bytes from 142.251.129.46: seq=193 ttl=61 time=7.390 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=888 ttl=61 time=5.476 ms
pingtest.3.mi4jydgbbnpk@node02.docker-dca.example    | 64 bytes from 142.251.129.46: seq=194 ttl=61 time=5.840 ms
pingtest.2.vqjyq3li3awt@master.docker-dca.example    | 64 bytes from 142.251.129.46: seq=194 ttl=61 time=46183.257 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=889 ttl=61 time=6.557 ms
pingtest.2.vqjyq3li3awt@master.docker-dca.example    | 64 bytes from 142.251.129.46: seq=195 ttl=61 time=46184.652 ms
pingtest.3.mi4jydgbbnpk@node02.docker-dca.example    | 64 bytes from 142.251.129.46: seq=195 ttl=61 time=7.309 ms
pingtest.1.xomdhsfx0zzs@registry.docker-dca.example    | 64 bytes from 142.251.129.46: seq=890 ttl=61 time=7.537 m

vagrant@master:~$ docker service scale pingtest=10
pingtest scaled to 10
overall progress: 10 out of 10 tasks 
1/10: running   [==================================================>] 
2/10: running   [==================================================>] 
3/10: running   [==================================================>] 
4/10: running   [==================================================>] 
5/10: running   [==================================================>] 
6/10: running   [==================================================>] 
7/10: running   [==================================================>] 
8/10: running   [==================================================>] 
9/10: running   [==================================================>] 
10/10: running   [==================================================>] 
verify: Service converged 


vagrant@master:~$ docker service ps pingtest
ID             NAME          IMAGE                                            NODE                          DESIRED STATE   CURRENT STATE            ERROR     PORTS
xomdhsfx0zzs   pingtest.1    registry.docker-dca.example:5000/alpine:latest   registry.docker-dca.example   Running         Running 15 minutes ago             
vqjyq3li3awt   pingtest.2    registry.docker-dca.example:5000/alpine:latest   master.docker-dca.example     Running         Running 4 minutes ago              
mi4jydgbbnpk   pingtest.3    registry.docker-dca.example:5000/alpine:latest   node02.docker-dca.example     Running         Running 4 minutes ago              
uh87o2jriwmp   pingtest.4    registry.docker-dca.example:5000/alpine:latest   registry.docker-dca.example   Running         Running 39 seconds ago             
f2dwohjlcv4s   pingtest.5    registry.docker-dca.example:5000/alpine:latest   node01.docker-dca.example     Running         Running 37 seconds ago             
wv1975znmv6w   pingtest.6    registry.docker-dca.example:5000/alpine:latest   master.docker-dca.example     Running         Running 39 seconds ago             
ewc5rzjfp9qc   pingtest.7    registry.docker-dca.example:5000/alpine:latest   node01.docker-dca.example     Running         Running 37 seconds ago             
wn51l6xt7b0y   pingtest.8    registry.docker-dca.example:5000/alpine:latest   node01.docker-dca.example     Running         Running 37 seconds ago             
rg14vqv9c2ky   pingtest.9    registry.docker-dca.example:5000/alpine:latest   master.docker-dca.example     Running         Running 39 seconds ago             
hl35010senhs   pingtest.10   registry.docker-dca.example:5000/alpine:latest   node02.docker-dca.example     Running         Running 39 seconds ago

vagrant@master:~$ docker service update --replicas 33 pingtest
pingtest
overall progress: 33 out of 33 tasks 
verify: Service converged 


vagrant@master:~$ docker service ps pingtest
ID             NAME          IMAGE                                            NODE                          DESIRED STATE   CURRENT STATE                ERROR     PORTS
xomdhsfx0zzs   pingtest.1    registry.docker-dca.example:5000/alpine:latest   registry.docker-dca.example   Running         Running 16 minutes ago                 
vqjyq3li3awt   pingtest.2    registry.docker-dca.example:5000/alpine:latest   master.docker-dca.example     Running         Running 5 minutes ago                  
mi4jydgbbnpk   pingtest.3    registry.docker-dca.example:5000/alpine:latest   node02.docker-dca.example     Running         Running 5 minutes ago                  
uh87o2jriwmp   pingtest.4    registry.docker-dca.example:5000/alpine:latest   registry.docker-dca.example   Running         Running about a minute ago             
f2dwohjlcv4s   pingtest.5    registry.docker-dca.example:5000/alpine:latest   node01.docker-dca.example     Running         Running about a minute ago             
wv1975znmv6w   pingtest.6    registry.docker-dca.example:5000/alpine:latest   master.docker-dca.example     Running         Running about a minute ago             
ewc5rzjfp9qc   pingtest.7    registry.docker-dca.example:5000/alpine:latest   node01.docker-dca.example     Running         Running about a minute ago             
wn51l6xt7b0y   pingtest.8    registry.docker-dca.example:5000/alpine:latest   node01.docker-dca.example     Running         Running about a minute ago             
rg14vqv9c2ky   pingtest.9    registry.docker-dca.example:5000/alpine:latest   master.docker-dca.example     Running         Running about a minute ago             
hl35010senhs   pingtest.10   registry.docker-dca.example:5000/alpine:latest   node02.docker-dca.example     Running         Running about a minute ago             
y5szo3utenxi   pingtest.11   registry.docker-dca.example:5000/alpine:latest   master.docker-dca.example     Running         Running 13 seconds ago                 
hadce8s6kupx   pingtest.12   registry.docker-dca.example:5000/alpine:latest   node01.docker-dca.example     Running         Running 13 seconds ago                 
mmwoajqhnquq   pingtest.13   registry.docker-dca.example:5000/alpine:latest   node01.docker-dca.example     Running         Running 13 seconds ago                 
obwoj00063yu   pingtest.14   registry.docker-dca.example:5000/alpine:latest   node01.docker-dca.example     Running         Running 14 seconds ago                 
d30rryaq0l50   pingtest.15   registry.docker-dca.example:5000/alpine:latest   master.docker-dca.example     Running         Running 13 seconds ago                 
i1ifz7cgcvrh   pingtest.16   registry.docker-dca.example:5000/alpine:latest   registry.docker-dca.example   Running         Running 13 seconds ago                 
vulo6nz8xobr   pingtest.17   registry.docker-dca.example:5000/alpine:latest   registry.docker-dca.example   Running         Running 13 seconds ago                 
wjeil40m5kak   pingtest.18   registry.docker-dca.example:5000/alpine:latest   registry.docker-dca.example   Running         Running 13 seconds ago                 
ridsdybs9qgi   pingtest.19   registry.docker-dca.example:5000/alpine:latest   master.docker-dca.example     Running         Running 14 seconds ago                 
phiu3h17jt0l   pingtest.20   registry.docker-dca.example:5000/alpine:latest   node02.docker-dca.example     Running         Running 14 seconds ago                 
wx10ax08j2be   pingtest.21   registry.docker-dca.example:5000/alpine:latest   master.docker-dca.example     Running         Running 13 seconds ago                 
ysue043g2eeh   pingtest.22   registry.docker-dca.example:5000/alpine:latest   node01.docker-dca.example     Running         Running 13 seconds ago                 
w5bs54hz1d9a   pingtest.23   registry.docker-dca.example:5000/alpine:latest   registry.docker-dca.example   Running         Running 13 seconds ago                 
gekjvx5lz6wm   pingtest.24   registry.docker-dca.example:5000/alpine:latest   registry.docker-dca.example   Running         Running 13 seconds ago                 
i21hkpfjfisd   pingtest.25   registry.docker-dca.example:5000/alpine:latest   node02.docker-dca.example     Running         Running 14 seconds ago                 
sdg45drts3ta   pingtest.26   registry.docker-dca.example:5000/alpine:latest   node02.docker-dca.example     Running         Running 14 seconds ago                 
knhapuw7uksz   pingtest.27   registry.docker-dca.example:5000/alpine:latest   registry.docker-dca.example   Running         Running 13 seconds ago                 
0fk8wp0wp9lv   pingtest.28   registry.docker-dca.example:5000/alpine:latest   node02.docker-dca.example     Running         Running 14 seconds ago                 
exk66cydwdeh   pingtest.29   registry.docker-dca.example:5000/alpine:latest   master.docker-dca.example     Running         Running 13 seconds ago                 
wyuv8cbdbyms   pingtest.30   registry.docker-dca.example:5000/alpine:latest   node01.docker-dca.example     Running         Running 13 seconds ago                 
4lrq6923bydo   pingtest.31   registry.docker-dca.example:5000/alpine:latest   node02.docker-dca.example     Running         Running 14 seconds ago                 
b9k7ezvwdygm   pingtest.32   registry.docker-dca.example:5000/alpine:latest   registry.docker-dca.example   Running         Running 14 seconds ago                 
oycsy1bgmbny   pingtest.33   registry.docker-dca.example:5000/alpine:latest   node02.docker-dca.example     Running         Running 14 seconds ago 


vagrant@master:~$ docker service update --replicas 3 pingtest
pingtest
overall progress: 3 out of 3 tasks 
1/3: running   [==================================================>] 
2/3: running   [==================================================>] 
3/3: running   [==================================================>] 
verify: Service converged

vagrant@master:~$ docker service ps pingtest
ID             NAME         IMAGE                                            NODE                        DESIRED STATE   CURRENT STATE           ERROR     PORTS
vqjyq3li3awt   pingtest.2   registry.docker-dca.example:5000/alpine:latest   master.docker-dca.example   Running         Running 6 minutes ago             
mi4jydgbbnpk   pingtest.3   registry.docker-dca.example:5000/alpine:latest   node02.docker-dca.example   Running         Running 6 minutes ago             
f2dwohjlcv4s   pingtest.5   registry.docker-dca.example:5000/alpine:latest   node01.docker-dca.example   Running         Running 2 minutes ago 

vagrant@master:~$ docker node ps master.docker-dca.example
ID             NAME         IMAGE                                            NODE                        DESIRED STATE   CURRENT STATE           ERROR     PORTS
vqjyq3li3awt   pingtest.2   registry.docker-dca.example:5000/alpine:latest   master.docker-dca.example   Running         Running 7 minutes ago

vagrant@master:~$ docker node ps registry.docker-dca.example
ID        NAME      IMAGE     NODE      DESIRED STATE   CURRENT STATE   ERROR     PORTS
vagrant@master:~$ docker node ps node02.docker-dca.example

ID             NAME         IMAGE                                            NODE                        DESIRED STATE   CURRENT STATE           ERROR     PORTS
mi4jydgbbnpk   pingtest.3   registry.docker-dca.example:5000/alpine:latest   node02.docker-dca.example   Running         Running 8 minutes ago             
vagrant@master:~$ docker node ps node01.docker-dca.example

ID             NAME         IMAGE                                            NODE                        DESIRED STATE   CURRENT STATE           ERROR     PORTS
f2dwohjlcv4s   pingtest.5   registry.docker-dca.example:5000/alpine:latest   node01.docker-dca.example   Running         Running 4 minutes ago

vagrant@master:~$ docker service rm pingtest
pingtest
