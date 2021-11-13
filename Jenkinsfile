pipeline {
    agent any
    tools {
        maven "MAVEN"
    }
    stages {
        stage("Checkout"){
            steps {
                echo "Hello this is Akshata!!!"
                checkout([$class: "GitSCM", branches: [[name: "*/QA"]], extensions: [], userRemoteConfigs: [[url: "https://github.com/athorat940/maven-hello-world"]]])
             }   
        }
		stage("Build"){
			steps {
				sh "mvn -Dmaven.test.failure.ignore=true clean package"
			}
		}
	        stage('SonarQube Analysis'){
			 steps{
			   	withSonarQubeEnv('SonarQube') {
			     	sh 'mvn clean package sonar:sonar'
			      }
			}
		}
	        stage('Email Notification'){
			steps{
			   mail bcc: '', body: '''Hi Welcome to Jenkins email alerts
			   Thanks
			   Akshata''', cc: '', replyTo: '', subject: 'Jenkins Job' , to: 'takshata423@gmail.com'
	                  }
                }
	        stage('Build Docker Image'){
			steps {
			    script {
				sh 'docker build -t akshata1209/my-app-1.0 .'
					
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
