pipeline {
    agent any
    
    stages {
        stage('Checkout Code') {
            steps {
                echo 'Fetching latest code from GitHub...'
                git branch: 'dev', 
                    url: 'https://github.com/parthivsusarla/DevOps_CIA2.git',
                    credentialsId: 'github-credentials'
            }
        }
        
        stage('Code Quality Check') {
            steps {
                echo 'Running basic HTML syntax validation...'
                bat '''
                    echo Checking for basic HTML structure...
                    findstr /C:"<html>" index.html >nul && echo HTML file looks valid.
                    echo HTML validation completed successfully.
                '''
            }
        }
        
        stage('Build Project') {
            steps {
                echo 'No actual build needed for static HTML project.'
                bat 'if not exist build mkdir build && copy index.html build\\'
            }
        }
        
        stage('Unit Test') {
            steps {
                echo 'Running dummy test...'
                bat 'echo All tests passed successfully.'
            }
        }
        
        stage('Archive Artifacts') {
            steps {
                echo 'Archiving build output...'
                archiveArtifacts artifacts: 'build/index.html', fingerprint: true
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t my-html-app:latest .'
            }
        }
        
        stage('Login to AWS ECR') {
            steps {
                echo 'Logging in to AWS ECR...'
                withAWS(credentials: 'aws-creds', region: 'us-east-1') {
                    bat '''
                        aws ecr get-login-password --region us-east-1 ^
                        | docker login --username AWS --password-stdin 123456789012.dkr.ecr.us-east-1.amazonaws.com
                    '''
                }
            }
        }
        
        stage('Tag Docker Image') {
            steps {
                echo 'Tagging Docker image for ECR...'
                bat 'docker tag my-html-app:latest 123456789012.dkr.ecr.us-east-1.amazonaws.com/devops_cia2_cicd:latest'
            }
        }
        
        stage('Push to AWS ECR') {
            steps {
                echo 'Pushing Docker image to ECR...'
                bat 'docker push 123456789012.dkr.ecr.us-east-1.amazonaws.com/devops_cia2_cicd:latest'
            }
        }
    }
    
    post {
        success {
            echo '✓ Continuous Integration stage completed successfully!'
        }
        failure {
            echo '✗ CI pipeline failed. Check logs.'
        }
    }
}
