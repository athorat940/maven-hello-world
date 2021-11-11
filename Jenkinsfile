pipeline {
    agent any
    tools {
        maven "MAVEN"
    }
    stages {
        stage("Build"){
            steps {
                echo "Hello this is Akshata!!!"
                checkout([$class: "GitSCM", branches: [[name: "*/master"]], extensions: [], userRemoteConfigs: [[url: "https://github.com/athorat940/maven-hello-world"]]])
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
                sh "mvn -f pomfilepath=maven-hello-world/my-app/ clean test"
             }   
        } 
     } 
} 
