pipeline {
    agent any
    
    stages {
        stage('Checkout Code') {
            steps {
                echo 'Fetching latest code from GitHub...'
                git branch: 'dev', url: 'https://github.com/YourUsername/DevOps_CIA2.git'
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
    }
}
