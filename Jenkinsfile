pipeline {
    environment { 
        registry = "akshata1209/akshata" 
        registryCredential = 'dockerhub' 
        dockerImage = '' 
    }	
    agent any
    
    stages {
        stage("Checkout"){
            steps {
                echo "Hello this is Akshata!!!"
                checkout([$class: "GitSCM", branches: [[name: "*/Dev"]], extensions: [], userRemoteConfigs: [[url: "https://github.com/athorat940/maven-hello-world"]]])
                }   
            }
	stage("Build"){
		steps {
            		//sh "mvn -Dmaven.test.failure.ignore=true clean package"
			sh '/opt/maven/bin/mvn clean package'
		}
	 }
	stage('SonarQube Analysis'){
		steps{
			withSonarQubeEnv('SonarQube') {
			//sh 'mvn clean package sonar:sonar'
			sh '/opt/maven/bin/mvn sonar:sonar'
			}
		}
	}
        stage('Test'){
		steps{
			sh '/opt/maven/bin/mvn test'			
		}
	}
	stage('Email Notification'){
		steps{
			mail bcc: '', body: '''Hi Welcome to Jenkins email alerts
			Thanks
			Akshata''', cc: '', replyTo: '', subject: 'Jenkins Job' , to: 'takshata423@gmail.com'
	            }
        }
	stage('Slack Notification For Dev'){
		steps{
			slackSend channel: 'akshata-channel', 
			color: 'good', message: 'Welcome to Jenkins, Slack!', 
			teamDomain: 'citiustechnetwork', 
			tokenCredentialId: '2c2c952a-7b10-4f42-953d-e786f78332f9'
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
	    stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubuser', variable: 'dockerhubpwd')]) {
                         sh 'docker login -u akshata1209 -p "b025fc74-c786-42aa-ae15-89696bd56aeb"'
    }
                sh 'docker push akshata1209/akshata:$BUILD_NUMBER'
                }
            }
        } 
	    
    } 
}
