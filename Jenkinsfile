pipeline {
    agent {
        docker {
            image 'stevanoswh/robot-framework-1:latest'
            args '--entrypoint=""'
        }
    }
    stages {
        stage('Robot Framework') {
            steps {
                sh 'robot --outputdir reports app/basicChecks.robot'
            }
        }
    }
    post {
        always {
            robotPublisher(
                outputPath: 'reports',
                outputFileName: 'output.xml',
                reportFileName: 'report.html',
                logFileName: 'log.html',
                disableArchiveOutput: true,
                passThreshold: 95.0,
                unstableThreshold: 90.0,
                otherFiles: "**/*.png,**/*.jpg"
            )
        }
    }
}