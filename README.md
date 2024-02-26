# Tasks-in-devops
I have cloned the repo from git the kink is given below




# Task 1: Docker, Docker Hub

  
  • Create a Dockerfile for a simple application (java)

  • Build the image using the Dockerfile and run the container

  • Verify that the application is working as expected by accessing it in a web browser

  • Push the image to a public or private repository (e.g. Docker Hub)


1 command is creating Dockerfile

 sudo nano Dockerfile

<img width="410" alt="Capture PNG2" src="https://github.com/devarajareddy92/tasks/assets/138653409/0305712f-1db5-4aaf-a6ad-5ccb819b9974">

2 building docker image

 docker build -t devarajareddy/simplecalculator:latest .
 
<img width="526" alt="Capture PNG1" src="https://github.com/devarajareddy92/tasks/assets/138653409/5afe039b-1e63-40b4-a33a-51d9323cecbc">

3 docker tag devarajareddy/simplecalculator:latest devarajareddy/simplecalculator:latest


  docker push devarajareddy/simplecalculator:latest

 <img width="318" alt="Capture PNG5" src="https://github.com/devarajareddy92/tasks/assets/138653409/d55ec425-e827-409e-a40d-795bf0ce1908">


# final result
 <img width="536" alt="Capture PNG6" src="https://github.com/devarajareddy92/tasks/assets/138653409/08f177bb-0331-4570-a049-20e54559b2ca">
