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
			   script {
			     // requires SonarQube Scanner 2.8+
			     scannerHome = tool 'SonarQube Scanner 2.8'
			   }
			    withSonarQubeEnv('SonarQube Scanner') {
			    sh "${scannerHome}/bin/sonar-scanner"
			   }
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
