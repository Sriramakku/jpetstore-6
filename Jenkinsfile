pipeline{
    agent { label 'node01' }
    environment {
        // SCANNER_HOME=tool 'sonar-scanner'
        VERSION = "${env.BUILD_ID}"
        AWS_ACCESS_KEY_ID     = credentials('awsaccesskey')
        AWS_SECRET_ACCESS_KEY = credentials('awssecretaccesskey')
        AWS_DEFAULT_REGION    = 'us-east-1'

    }
    tools {
        maven 'maven3'
    }
    stages{
        // stage ('maven compile') {
        //     steps {
        //         sh 'mvn clean compile'
        //     }
        // }
        // stage ('maven Test') {
        //     steps {
        //         sh 'mvn test'
        //     }
        // }
        // // stage("Sonarqube Analysis "){
        // //     steps{
        // //         withSonarQubeEnv('sonar-server') {
        // //             sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Petshop \
	    // //             -Dsonar.exclusions=**/Dockerfile \
        // //             -Dsonar.java.binaries=. \
        // //             -Dsonar.projectKey=Petshop '''
        // //         }
        // //     }
        // // }
        // // stage("quality gate"){
        // //     steps {
        // //         script {
        // //           waitForQualityGate abortPipeline: false, credentialsId: 'Sonar-token' 
        // //         }
        // //    }
        // // }
        // stage ('Build war file'){
        //     steps{
        //         sh 'mvn clean install -DskipTests=true'
        //     }
        // }
        // stage("docker build and push to Nexus repo"){                      
        //     steps{                
        //         script{
        //             withCredentials([string(credentialsId: 'nexus_password', variable: 'nexus_creds')]) {
        //                 sh '''
        //                     docker build -t 54.81.72.120:8083/petshop:${VERSION} .
        //                     echo "Account01@" | docker login -u admin --password-stdin 54.81.72.120:8083
        //                     #docker login -u admin -p $nexus_creds 54.81.72.120:8083
        //                     docker push 54.81.72.120:8083/petshop:${VERSION}
        //                     docker rmi 54.81.72.120:8083/petshop:${VERSION}
        //                 '''
        //             }
        //         }                     
        //     }  
        // } 
        stage('Terraform EC2 provision') {
            steps {
                sh 'terraform init'
                // sh 'terraform plan -out tfplan'
                // sh 'terraform show -no-color tfplan > tfplan.txt'
                sh 'terraform apply -auto-approve'
            }
        }
   }
}