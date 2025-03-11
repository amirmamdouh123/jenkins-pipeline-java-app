pipeline {
    
    agent any 
    
    stages {
        
        stage("git repo"){
            
            
            steps{
                
                git 'https://github.com/amirmamdouh123/jenkins-pipeline-java-app'
                
            }
            
            
            
        }
        
        
        stage('docker build image'){
            
            steps{
                sh 'docker build -t amirmamdouh123/ivolve-java-app-image .'
            }
        }
        
        stage('push image to dockerhub'){
            
            steps{
                
                withCredentials([usernamePassword(credentialsId: 'dockerhub-login', usernameVariable: 'USER', passwordVariable: 'PASS')]){
                    sh 'docker login -u ${USER} -p ${PASS}'
                    sh 'docker push amirmamdouh123/ivolve-java-app-image'
                }
                
                
            }
        }
        
        
        stage('deploy ivolve app'){
            
            steps{
                    sh 'export KUBECONFIG=/home/ubuntu/.kube/config && kubectl apply -f deployment.yml'
                 
                
            }
            

        }
    }
        
    post{
                
        success{
            echo 'deployment is finished successfully...'
        }
        failure{
            echo 'deployment is failed'
        }
    
        

    }
}
