node{
    
    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])
    
    def mavenHome = tool name : 'Maven3.9.8'
    
    stage('CheckOutCode'){
		git branch: 'development', credentialsId: 'dedb67ec-eb24-4e25-a5ef-ada8591e938b', url: 'https://github.com/mss-may-2024-projects/maven-web-application.git'
	}
    
    stage('Build'){
	    sh "${mavenHome}/bin/mvn clean package"
	}
	/*
	stage('ExecuteSonarQubeReport'){
		sh "${mavenHome}/bin/mvn clean sonar:sonar"
	}
	
    stage('UploadArtifactIntoNexus'){
		sh "${mavenHome}/bin/mvn clean deploy"
	}
	
	stage('DeployAppIntoTomcat'){									
		sshagent(['c622db15-cc87-4586-ab36-f54fb1156afa']) {
			sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war  ec2-user@172.31.21.246:/opt/apache-tomcat-9.0.89/webapps/"										
		}
	} 
  */
}
