#!groovy

pipeline{

       //agent { label 'Test_Node11' }
agent none
stages{
stage('Docker Build') { 

                agent any
             steps {
        sh 'docker build -t sanjeev435/jenkins-elb-aws-alpine:latest .'
}
           }
			
         stage('Docker Push') {
               agent any
             steps {
                     withCredentials([usernamePassword(credentialsId: 'docker-UbuntuLocal-Cred', passwordVariable: 'dockerHubPassword',
					 usernameVariable: 'dockerHubUser')]) {
                     sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                     sh 'docker push sanjeev435/jenkins-elb-aws-alpine'}
			    }
			}
}
}
