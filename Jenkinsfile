pipeline{
    
    agent any 
    
    stages {
        
        stage('Git Checkout2'){
            
            steps{
                
                script{
                    
                    git branch: 'main', url: 'https://github.com/vvadmin2018/demo3.git'
                }
            }
        }
        stage('UNIT testing'){
            
            steps{
                
                script{
                    
                    echo "UNIT testing"
                }
            }
        }
        stage('Integration testing'){
            
            steps{
                
                script{
                    
                    sh 'mvn verify -DskipUnitTests'
                }
            }
        }
        stage('Maven build'){
            
            steps{
                
                script{
                    
                    sh 'mvn clean install'
                }
            }
        }
        stage('Static code analysis'){
            
            steps{
                
                script{
                    
                    withSonarQubeEnv(credentialsId: 'sonar-api') {
                        
                        sh 'mvn clean package sonar:sonar'
                    }
                   }
                    
                }
            }
            stage('Quality Gate Status'){
                
                steps{
                    
                    script{
                        
                        waitForQualityGate abortPipeline: false, credentialsId: 'sonar-api'
                    }
                }
            }
        }
        
}
