FROM almalinux

RUN  yum update -y &&  yum install java-11-openjdk -y &&  yum install git -y &&  yum install maven -y

# Copy the source code from the local machine into the image
COPY . /maven_java_web_example

WORKDIR /maven_java_web_example

RUN mvn clean
RUN mvn test -X
RUN mvn package

CMD ["mvn", "tomcat7:run"]

