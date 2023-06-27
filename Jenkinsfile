 stage('Robot Framework') {
        agent {
            docker {
                image 'stevanoswhpush/robot-framework-1:latest'
                args '--entrypoint=""'
            }
        }
        steps {
            sh 'robot --outputdir reports app/basicChecks.robot'
        }
    }
    post {
        always {
            step(
                    [
                            $class              : 'RobotPublisher',
                            outputPath          : 'reports',
                            outputFileName      : "output.xml",
                            reportFileName      : 'report.html',
                            logFileName         : 'log.html',
                            disableArchiveOutput: true,
                            passThreshold       : 95.0,
                            unstableThreshold   : 90.0,
                            otherFiles          : "**/*.png,**/*.jpg",
                    ]
            )
        }
    }