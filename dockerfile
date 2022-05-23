ROM ubuntu:latest 
## Ubuntu base image.
RUN apt-get -y update && apt-get -y upgrade
## Updating and upgrading the machine.
RUN apt-get -y install openjdk-8-jdk wget 
## Installing java and wget.
RUN mkdir /usr/local/tomcat ## Creating a tomcat tomcat in /usr/local location.
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.21/bin/apache-tomcat-10.0.21.tar.gz -O /tmp/tomcat.tar.gz 
# using the above https link, u r downloading tomcat to ubuntu base image in the /tmp location; -O is output location
RUN cd /tmp && tar xvfz tomcat.tar.gz 
## change the directory to /tmp amd Untar the downloaded file.
RUN cp -Rv /tmp/apache-tomcat-10.0.21/* /usr/local/tomcat/ 
## Copy the untared files to /usr/local/tomcat folder which you created in step7.
