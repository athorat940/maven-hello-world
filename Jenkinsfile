pipeline {
    agent any
    tools {
        maven "MAVEN"
    }
    stages {
        stage("Checkout"){
            steps {
                echo "Hello this is Akshata!!!"
                checkout([$class: "GitSCM", branches: [[name: "*/dev"]], extensions: [], userRemoteConfigs: [[url: "https://github.com/athorat940/maven-hello-world"]]])
             }   
        } 
     } 
     post {
         always {
             junit(
                 allowEmptyResults:true,
                 testResults: '*test-reports/.xml'
             )
         
         }
     }
}
