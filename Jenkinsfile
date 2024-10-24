pipeline {
    agent any 

    stages {
        stage('Checkout Code') {
            steps {
                git credentialsId: '0001', url: 'https://github.com/akshay-kumarl/sampleproj.git', branch: 'mainbranch'
            }
        }

        stage('Docker') {
            steps {
                sh 'docker ps -a'
            }
        } 

        stage('kubernetes'){
            steps{
               sh 'kubectl apply -f ./manifests/*.yml'
                sh 'kubectl get pods -n samplens'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
