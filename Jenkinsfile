pipeline {
    agent any
    tools {
        maven 'MAVEN'
    }
    stages {
        stage('Build'){
            steps {
                echo 'Hello this is Akshata!!!'
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://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@github.com/athorat940/maven-hello-world.git']]])
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
             }   
        } 
     } 
}           
