# Tasks-in-devops

## Task2 

- Set up Jenkins on AWS EC2 instance
- Create a security group for Jenkins
- Connect to Jenkins instance using EC2 security groups
- Install Jenkins on the EC2 instance
- Create a Dockerfile (you can use Dockerfile created in Task1)
- Install and manage some Jenkins plugins
- Create a job for automating CI/CD deployment
- Integrate Jenkins and GitHub


[NOTE]: I am utilizing this repo "[All tasks are in different branches](https://github.com/YashPimple/Jenkins-CI-CD-with-GitHub-Integration)https://github.com/YashPimple/Jenkins-CI-CD-with-GitHub-Integration"


Set up Jenkins on AWS EC2 instance
Let start by creating an EC2 instance and running Jenkins on it

Search for EC2 in the Search bar on the top and click on it

![ezgif-7-e8e14c7498](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/bc2d7c34-5618-4b14-873a-2044417826d0)

Now let's launch an instance by clicking on 'Launch instances'

![ezgif-6-6e4bf952d6](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/6736e469-95c0-48a5-8778-decfec23da48)

Now, enter some details for your instance, name it 'Jenkins-master'

I am opting for Ubuntu Server(free tier) here.

Make sure that the selected server you are opting for, lies in the free tier

Choose the size of the instance "t2.micro" or anything that lies in the free tier.

![ezgif-7-cc33946f16](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/db1918b4-5431-4739-b6f6-377c9005c44f)

And now Let's create a key pair for your instance, name it aws-jenkins choose ".pem", if you are going to use SSH to connect to your instance, or ".ppk" if you are using putty & download it and now launch the instance.

![ezgif-2-1cb6a263bb](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/cdd4d409-5c23-457f-ad84-1d67d88049a9)

And Wait for the Status Check to complete (Running)


Now it is time to Connect of instance(Server)
Click on “Connect” and select the "EC2 instance connect” option.

![ezgif-3-a4bcc57125](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/6fd0444e-e085-4f35-95eb-02708deec74b)
![ezgif-3-ac1b9e33a2](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/7c79814d-da3c-4d1e-b6c3-96c480aea912)


Congratulations, you have now connected to the instance\

![ezgif-3-dc7d016b68](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/88ef0f27-a3fd-4891-87ed-c7ba54f5027f)

Install Jenkins on your Instance
We are using sudo it as a prefix with every command, you can also do sudo -su this in the beginning to avoid that.

Enter the command, for a quick update of all the software packages on your instance

Update your system

-  sudo apt update

Install java
-   sudo apt install openjdk-11-jre

Validate installation
-  java -version


Install Jenkins

Just copy these commands and paste them onto your terminal.

- curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
  
- echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \   https://pkg.jenkins.io/debian binary/ | sudo tee \   /etc/apt/sources.list.d/jenkins.list > /dev/null

- sudo apt-get update

- sudo apt-get install jenkins

- sudo systemctl enable jenkins

- sudo systemctl start jenkins


Now copy the public IP address of the Jenkins instance, which is present in the details of the instance

Enter this IP address with the port number, i.e., "<ip_address:port_number>"- "18.182.13.97:8080"

![ezgif-7-a62265d047](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/ad36b2ef-71c9-4477-9226-4caf4f0acfb1)

Now, get the password by entering the following command and enter it in the text box
- sudo cat /var/lib/jenkins/secrets/initialAdminPassword

Click on install the suggested plugins
![ezgif-2-0c45711049](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/c6140e5f-9dcf-4fb4-b043-0cc81cb64555)

Go ahead and enter your username and stuff as asked

You are ready to use Jenkins🎉

Creating a Container
After running Jenkins on our host now is time to create a Dockerfile to create a Dockerfile we need to install it first docker in our instance.


* Add Docker's official GPG key:
- sudo apt-get update
- sudo apt-get install ca-certificates curl
- sudo install -m 0755 -d /etc/apt/keyrings
- sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
- sudo chmod a+r /etc/apt/keyrings/docker.asc

* Add the repository to Apt sources:
- echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
- sudo apt-get update

* Install Docker
- sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

- sudo usermod -a -G docker $USER

Docker File Code : 

    FROM node:12.2.0-alpine
    WORKDIR app
    COPY . .
    RUN npm install
    EXPOSE 8000
    CMD ["node","app.js"]


Now its time to make docker image and container out of the docker file

- sudo docker build . -t node-app

- sudo docker run -d -p 8000:8000 todo-node-app


To see our Project running we need to add port in our security group of the instance

Follow the same steps, as followed in adding an inbound port for Jenkins, with some minor changes.

One inbound rule need to be added

![ezgif-5-8f207fae45](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/4a86f9d1-8287-4cf0-baa2-041828673800)

Now copy the public IP address of the Jenkins master instance, which is present in the details of the instance

Enter this IP address with the port number, i.e., "<ip_address:port_number>" - "18.182.13.97:8000"

![ezgif-2-e4d3c369bc](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/bfa25b5d-c1f7-4546-8bb5-73aaa933eb99)



Automating CI/CD using Jenkins
First, you need to create a New Jenkins freestyle Pipeline

![ezgif-6-db36e24375](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/d0873e04-6c88-4fa1-88fc-2175af6f3093)

After creating a Job we need to create a private and public key which will be used to integrate our GitHub and Jenkins for the Continuous Integration part.

Going back to our instance to create public and private key we need to follow up the following commands.

 - ssh-keygen
 - cd .ssh
 - ls

![ezgif-1-821ed46ce9](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/694923c4-cbdc-4359-bbf4-5e721b7e4891)

- sudo cat id_rsa.pub

Where id_rsa.pub stands for Public Key and id_rsa stands for Private Key

![ezgif-1-5bb25f6e65](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/6ad6fb07-58dd-4f36-ae7b-3580ccf63bb2)

- sudo cat id_rsa

![ezgif-1-bc08130cd4](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/900e3240-7500-430b-803f-a8aebbf6d6b5)


After generating the Public and Private Key now we need to connect our Jenkins with Github for that we need to create an SSH KEY.

Go the Github Settings > click on SSH and GPG keys > Give any title and paste the Public Key we generated > click on Add SSH Key

![ezgif-7-c12a318ba2](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/e4e6b898-adcf-4848-8c76-0a74dff2a023)

Now let's go back to Jenkins after creating the freestyle Project now we need to add the respective credentials

![ezgif-2-5627a60b39](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/583ce7cc-6543-4018-aaf3-3a933fb33a66)

Give the Jenkins Project a Description after that add the Repo url "Github Link"

![ezgif-2-02c032772b](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/36269ea6-b891-485b-9a7d-64ae161d585f)

In the Source Code Management, choose git and enter the repository URL, by clicking on code.

![ezgif-7-4a9914f7b0](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/8baf317a-f6e2-4dc3-bd1a-d2ab05a2beff)

Create a new credential by clicking on add and new pop-up screen will appear overhere Select kind to be "SSH Username with private key", let the scope be global.

![ezgif-4-25172aca5e](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/2eeb6eeb-2191-45f5-8dca-a6b1a65e2237)

Further, add the Private Key generate in the instance and paste it over here and click on add button to save it.

![ezgif-3-e098384e23](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/bfd75e6d-fc2f-4e05-a491-68dec66b6167)

After select the ubuntu credentials and Since all the code is in the master branch in the given project, we will use the master branch.

Here click on the "Github hook trigger for GITScm polling" tick is so the any chance made in the Github code base can be reflect over here and a new build can be executed for that we need to make a small change in our Project Repository and all this work is done by Github Webhook > Go to Project Repo Settings > Webhook > Add webhook

Over their you need to enter your this IP address with the port number, i.e., "<ip_address:port_number/github-webhook/>"- "http://54.250.242.79:8080/github-webhook/" and select content type as "application/json" and click on "Add webhook"

![ezgif-4-526e669a2e](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/2f84b60b-a0d1-45ee-a4bd-ec408a3af460)

Then let's go back to Jenkins Pipeline to work on the continuous deployment part for creating our docker image.

Now Let build steps to create our Docker container

Select Execute Shell and all the following CMD

  - docker build . -t node-app-todo
  - docker run -d -p 8000:8000 node-app-todo

![ezgif-7-bb99b57b24](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/1ac93088-77a2-4269-bb98-016d7405668c)

Now save and click on “Build Now”
![ezgif-7-cfe31a6c3d](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/2cfa74fb-1991-422e-bba5-306b71639414)

Yay! 🚀 that's a SUCCESS!


<img width="420" alt="Capture PNG22" src="https://github.com/devarajareddy92/tasks/assets/138653409/d3d6d3e2-a5ff-43aa-b999-42c8ec8b4616">
