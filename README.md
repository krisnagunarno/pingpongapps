# Pingpong-app Deployment on Minikube

## Prerequisites
- Virtual Machine/Cloud instance with installed Docker
- Machine's minimum specs: 2 CPU, 4GB RAM
- Minimum free storage: 20GB
- In this tutorial, I'm using Ubuntu 18.04 LTS. Feel free to using your preferable OS.
- Only 1 machine needed

## Dockerize the Apps
- Clone this repository into the machine
- Enter the repository directory
- Build the Dockerfile using:
   ```bash	
   docker build -t . <docker.hub username>/<image name>:<version>
   ```
- You can also using my docker image, just pull it from kgunarno/pingpong:1.0

## Install the Minikube
- Install the kubectl to allow you using kubectl command at Minikube
 ```bash	
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin
   ```
- Install the minikube
 ```bash	
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
    && chmod +x minikube
    sudo mv minikube /usr/local/bin
   ```
- Install conntrack
 ```bash	
    sudo apt install conntrack
  ```
- Start the minikube using vm-driver=docker
 ```bash	
    minikube start --vm-driver=docker
  ```
- Check the version of kubectl and minikube with "kubectl version" and "minikube version". If there is no any issue you can go to next section.
- Things not always just works fine. If you have an issue when installing and operating those commands, check at the links below:
- https://kubernetes.io/docs/tasks/tools/install-kubectl/
- https://minikube.sigs.k8s.io/docs/start/

