pipeline {
    agent any
    environment {
        containerName = 'stevanoswh/robot-framework-1:latest'
        scmUrl = 'https://github.com/stevanojsuwuh/robot-test.git'
        branch = 'master'
        imageName = 'robot-framework-1'
    }
    stages {
        stage('Robot Framework') {
            agent {
                docker {
                    image 'stevanoswh/robot-framework-1:latest'
                    args '--entrypoint=""'
                }
            }
            steps {
                sh 'robot --outputdir reports app/basicChecks.robot'
            }
        }
    }
    post {
        always {
            step([
                $class: 'RobotPublisher',
                outputPath: 'reports',
                outputFileName: 'output.xml',
                reportFileName: 'report.html',
                logFileName: 'log.html',
                disableArchiveOutput: true,
                passThreshold: 95.0,
                unstableThreshold: 90.0,
                otherFiles: "**/*.png,**/*.jpg"
            ])
        }
    }
}