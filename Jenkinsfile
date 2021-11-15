pipeline {
    environment { 
        registry = "akshata1209/akshata" 
        registryCredential = 'dockerhub' 
        dockerImage = '' 
    }	
    agent any
    tools {
        maven "MAVEN"
    }
    stages {
        stage("Checkout"){
            steps {
                echo "Hello this is Akshata!!!"
                checkout([$class: "GitSCM", branches: [[name: "*/Dev"]], extensions: [], userRemoteConfigs: [[url: "https://github.com/athorat940/maven-hello-world"]]])
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
        stage('Test'){
		steps{
			sh 'mvn test'			
		}
	}
	stage('Email Notification'){
		steps{
			mail bcc: '', body: '''Hi Welcome to Jenkins email alerts
			Thanks
			Akshata''', cc: '', replyTo: '', subject: 'Jenkins Job' , to: 'takshata423@gmail.com'
	            }
        }
	stage('Slack Notification'){
		steps{
			slackSend channel: 'akshata-channel', 
			color: 'good', message: 'Welcome to Jenkins, Slack!', 
			teamDomain: 'citiustechnetwork', 
			tokenCredentialId: '2c2c952a-7b10-4f42-953d-e786f78332f9'
		}
	    }
	stage( 'Appoval mail for QA' ){
            steps{
                slackSend baseUrl: 'https://hooks.slack.com/services/', channel: 'akshata-channel', message: "${env.BUILD_URL}", teamDomain: '', tokenCredentialId: 'slackqa'
        }
}
            
        stage("QA Approval") {
                  steps {
			script {
			def userInput = input(id: 'Proceed1', message: 'Promote build?', parameters: [[$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Please confirm you agree with this']])
			echo 'userInput: ' + userInput
 
            if(userInput == true) {
                // do action
            } else {
                // not do action
                echo "Action was aborted."
            }
 
        }  
        
      }
 }    
	stage('Build Docker Image'){
		steps {
			script {
				
				//sh 'docker build -t akshata1209/my-app-1.0 .'
				dockerImage = docker.build registry + ":$BUILD_NUMBER"
			}
		}
	}
	    stage('Push Docker Image'){
		steps {
			script {
				withCredentials([string(credentialsId: 'dockerhubuser', variable: 'dockerhubpwd')]) 
			{
				sh 'docker login -u akshata1209 -p ${dockerhubpwd}'
				}
				sh 'docker push akshata1209/akshata:$BUILD_NUMBER'
                }
            }
	}
	    
    } 
}
