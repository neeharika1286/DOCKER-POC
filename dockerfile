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
## Copy the untared files to /usr/local/tomcat folder which you created in step7 and also update the folder name (10.0.21) to the location you downloaded.
ADD https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war /usr/local/tomcat/webapps
## add the same war file from the above link to the tomcat webapps folder
EXPOSE 8080
## run the container on port 8080,on what port number the application is listening
CMD /usr/local/tomcat/bin/catalina.sh run 
## start the tomcat server
