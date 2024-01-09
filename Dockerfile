FROM openjdk:17.0.2
WORKDIR /usr/src/myapp
COPY . /usr/src/myapp
CMD ["./mvnw", "clean", "package"]
CMD ["./mvnw", "cargo:run", "-P", "tomcat90"]
