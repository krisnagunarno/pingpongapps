# Pingpong-app Deployment on Minikube
## Deployed and documented by Matius Krisna Gunarno (matiuskrisna24@gmail.com)
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
- Start the minikube using vm-driver=docker, and wait for a while.
 ```bash	
    minikube start --vm-driver=docker
  ```
- Check the version of kubectl and minikube with "kubectl version" and "minikube version". If there is no any issue you can go to next section.
- Things not always just works fine. If you have an issue when installing and operating those commands, check at the links below:
- https://kubernetes.io/docs/tasks/tools/install-kubectl/
- https://minikube.sigs.k8s.io/docs/start/

## Let's get started
- Activate and deploy the minikube dashboard.
 ```bash	
    minikube addons enable dashboard
    minikube dashboard --url
  ```
- Don't close the terminal session. Open the new session.
- You will get the link to the dashboard, check it on your browser (for more dashboard picture docs just check at pictures/dashboard).

   ![dashboard link](https://github.com/krisnagunarno/pingpongapps/blob/main/pictures/snippets/Capture1.JPG)
   ![Dashboard](https://github.com/krisnagunarno/pingpongapps/blob/main/pictures/dashboard/screencapture-127-0-0-1-35343-api-v1-namespaces-kubernetes-dashboard-services-http-kubernetes-dashboard-proxy-2021-02-25-02_35_07.png)

- Go to the manifest folder
- Inspect the files, adjust some things such as docker image with yours.
- Apply all the yml file
 ```bash	
    kubectl apply -f deployment.yml -f service.yml -f ingress-nginx.yml -f configmap.yml
  ```
- Check all the minikube service
 ```bash	
    minikube service list
  ```
   ![service list](https://github.com/krisnagunarno/pingpongapps/blob/main/pictures/snippets/Capture2.JPG)

- Try curl command with that link.
  ```bash	
    curl <ip>:<port>; echo
    curl <ip>:<port>/ping; echo
  ```
   ![pingpong1](https://github.com/krisnagunarno/pingpongapps/blob/main/pictures/snippets/Capture3.JPG)

- If there is no issue, you can edit /etc/hosts, add new line with "<ip>   pingpong.oke"
- Try using the "pingpong.oke"

  ```bash
    curl pingpong.oke; echo
    curl pingpong.oke/ping; echo
  ```
   ![pingpong2](https://github.com/krisnagunarno/pingpongapps/blob/main/pictures/snippets/Capture4.JPG)
