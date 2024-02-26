#use the base image with java installed
FROM openjdk:17-jdk-slim

#set the working directory in the container
WORKDIR /app

#copy the compiled java application class files into the container
COPY Ram/bin/*.class /app

#Add the source java files into the container
COPY Ram/src /app/src

#commant to compile and run the java application
CMD ["java","src.dddd.SimpleCalculator"]
