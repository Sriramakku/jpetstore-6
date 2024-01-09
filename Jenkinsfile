pipeline{
    agent { label 'node01' }
    environment {
        // SCANNER_HOME=tool 'sonar-scanner'
        VERSION = "${env.BUILD_ID}"
    }
    tools {
        maven 'maven3'
    }
    stages{
        stage ('maven compile') {
            steps {
                sh 'mvn clean compile'
            }
        }
        stage ('maven Test') {
            steps {
                sh 'mvn test'
            }
        }
        // stage("Sonarqube Analysis "){
        //     steps{
        //         withSonarQubeEnv('sonar-server') {
        //             sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Petshop \
	    //             -Dsonar.exclusions=**/Dockerfile \
        //             -Dsonar.java.binaries=. \
        //             -Dsonar.projectKey=Petshop '''
        //         }
        //     }
        // }
        // stage("quality gate"){
        //     steps {
        //         script {
        //           waitForQualityGate abortPipeline: false, credentialsId: 'Sonar-token' 
        //         }
        //    }
        // }
        stage ('Build war file'){
            steps{
                sh 'mvn clean install -DskipTests=true'
            }
        }
        stage("docker build and push to Nexus repo"){                      
            steps{                
                script{
                    withCredentials([string(credentialsId: 'nexus_passwd', variable: 'nexus_creds')]) {
                        sh '''
                            docker build -t 54.81.72.120:8082/petshop:${VERSION} .
                            echo "Account01@" | docker login -u admin --password-stdin 54.81.72.120:8082
                            #docker login -u admin -p $nexus_creds 54.81.72.120:8082
                            docker push 54.81.72.120:8082/petshop:${VERSION}
                            docker rmi 54.81.72.120:8082/petshop:${VERSION}
                        '''
                    }
                }                     
            }  
        } 
   }
}
