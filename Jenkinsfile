pipeline{
    agent { label 'node01' }
    tools {
        maven 'maven3'
    }

    stages{
        stage("sonar quality check"){   
            agent {
                docker {
                    image 'maven'
                    args '-u root'
                }
            }         
            steps{                
                script{
                    withSonarQubeEnv(credentialsId: 'sonar-token'){ 
                                         
                        sh 'mvn sonar:sonar'            
                        sh 'mvn clean package'                                    
                    }                     
                }  
            }            
        }
        stage("Quality gate status"){                      
            steps{                
                 waitForQualityGate abortPipeline: true, credentialsId: 'sonar-token'                      
                                     
            }  
        }
    }
}
