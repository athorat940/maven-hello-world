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
	    	stage('Quality gate check'){
			steps{
			timeout(time: 1, unit: 'HOURS'){
				def QG = waitForQualityGate()
				if (QG.status != "OK"){
					slackSend baseUrl: 'https://hooks.slack.com/services/',
					channel: '#Jenkins_Multibranch_pipeline' ,
					color: 'danger',
					message: 'SonarQube Analysis failed'
			
				}
			}
		}
	}
     } 
     
}
