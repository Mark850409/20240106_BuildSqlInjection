pipeline {
    agent any
    triggers {
        pollSCM "*/1 * * * *"
    }
    stages {
        stage('Build') {
            steps {
                echo "開始佈署SQL INJECTION CONTAINER!!!"
                bat 'call "%WORKSPACE%\\autoBuildSqlInjection.bat"'
            }
        }
        
		
    }
	post {
        always {
             emailext mimeType: 'text/html',
			 body: '${FILE,path="custom.html"}', 
             subject: '$DEFAULT_SUBJECT',
             to: '${email}'
        }
        success {
            echo '恭喜，已佈署成功!!!'
        }

        failure {
            echo '佈署失敗!!!'
        }
    }

}