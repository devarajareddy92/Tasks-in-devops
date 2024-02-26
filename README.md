# Tasks-in-devops
## Task3

# How to Install Minikube on Ubuntu 22.04 Step-by-Step

Table of Contents

Prerequisites

1) Update Your System
  
2) Install Docker
 
3) Download and Install Minikube Binary
  
3) Install Kubectl tool
   
4) Start Minikube Cluster
 
5) Interact with Your Minikube Cluster

Prerequisites

Pre-Install Ubuntu 22.04 system

2 GB RAM or more

2 CPU or more

20 GB free disk space

Sudo used with admin access

Reliable Internet Connectivity

Docker or VirtualBox or KVM

# 1) Update Your System

$ sudo apt update
$ sudo apt upgrade -y

 
<img width="500" alt="Capture" src="https://github.com/devarajareddy92/tasks/assets/138653409/33ae2547-6fd3-4ed8-9670-e4ea208f476c">

# 2) Install Docker
 
Minikube requires either docker or VirtualBox, in this post, we will be installing docker on Ubuntu 22.04 system. Run the following set of command one after

the another to docker apt repository.

 sudo apt install ca-certificates curl gnupg wget apt-transport-https -y
 
$ sudo install -m 0755 -d /etc/apt/keyrings

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

$ sudo chmod a+r /etc/apt/keyrings/docker.gpg

$ echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
$ sudo apt update

<img width="544" alt="Capture PNG3" src="https://github.com/devarajareddy92/tasks/assets/138653409/2827adcf-61c0-451c-a8b2-e6a937a9d316">

Next, install docker by running the following command.

$ sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

<img width="551" alt="Capture PNG4" src="https://github.com/devarajareddy92/tasks/assets/138653409/a7a798b2-38ee-4516-807e-707aba26481e">


Add your local user to docker group so that your local user run docker commands without sudo.

$ sudo usermod -aG docker $USER

$ newgrp docker


<img width="383" alt="Capture PNG5" src="https://github.com/devarajareddy92/tasks/assets/138653409/74111be4-57f9-4a77-b94e-33f44e4d72a4">

# 3) Download and Install Minikube Binary
   
 To download and install minikube binary, run following commands,

$ curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

$ sudo install minikube-linux-amd64 /usr/local/bin/minikube

To verify the minikube version, run

$ minikube -version


<img width="545" alt="Capture PNG6" src="https://github.com/devarajareddy92/tasks/assets/138653409/db58367b-f82d-4a83-8cd1-31300819d2c4">

# 4) Install Kubectl tool

Kubectl is a command line tool, used to interact with your Kubernetes cluster. So, to install kubectl run beneath curl command.

$ curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

Next, set the executable permission on it and move to /usr/local/bin

$ chmod +x kubectl

$ sudo mv kubectl /usr/local/bin/

Verify the kubectl version, run

$  kubectl version -o yaml

<img width="546" alt="Capture PNG7" src="https://github.com/devarajareddy92/tasks/assets/138653409/35eb67fc-d960-44fe-ba2d-9c45d4fb971a">

# 5) Start Minikube Cluster

Now that Minikube is installed, start a Kubernetes cluster using the following command:

$ minikube start --driver=docker


<img width="416" alt="Capture PNG8" src="https://github.com/devarajareddy92/tasks/assets/138653409/a05129e3-c542-49d5-8b82-00513e9faaa9">

This command initializes a single-node Kubernetes cluster, and it might take a few minutes to download the necessary components.

Once the minikube has started, verify the status of your cluster, run

$ minikube status


<img width="221" alt="Capture PNG9" src="https://github.com/devarajareddy92/tasks/assets/138653409/e396a6db-21c8-4c03-825b-ff63e2cad032">

# 6) Interact with Your Minikube Cluster
   
Use kubectl to interact with your Minikube Kubernetes cluster. For example, you can check the nodes in your cluster:

$ kubectl get nodes

$ kubectl cluster-info

<img width="659" alt="Capture PNG10" src="https://github.com/devarajareddy92/tasks/assets/138653409/e51cc636-c324-405e-b302-1fa81e0065b9">

Try to deploy a sample nginx deployment, run following set of commands.

$ kubectl create deployment nginx-web3 --image=nginx

$ kubectl expose deployment nginx-web3 --type NodePort --port=80

$ kubectl get deployment,pod,svc



<img width="504" alt="Capture PNG11" src="https://github.com/devarajareddy92/tasks/assets/138653409/13aa1ed0-9268-44b7-8c44-678f59455738">

