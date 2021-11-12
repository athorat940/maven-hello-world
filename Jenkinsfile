pipeline {
    agent any
   /* tools {
        maven "MAVEN"
    } */
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
			  // def mvnHome = tool name: 'maven-3', type: 'maven'
			   withSonarQubeEnv('sonar-6')
			     sh "/opt/maven/bin/mvn sonar:sonar"
			}
		}
     
	    stage {
		    steps {
		        junit(
			    allowEmptyResults:true,
			    testResults: '*test-reports/.xml'
		        )

			   }
	        }
        }
}
