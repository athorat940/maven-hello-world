FROM openjdk

COPY target/*.jar /

EXPOSE 8096

ENTRYPOINT ["java","-jar","/my-app-1.0-SNAPSHOT.jar"]
