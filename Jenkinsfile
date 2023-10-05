pipeline {
    agent any

    stages {
       
        stage('Checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ankit-jagtap-devops/NorthLadder-Assignment.git']]])
            }
        }

        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t ankitjagtap/northladder_assignment:nodejs .'
                }
            }
        }

        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u ankitjagtap -p ${dockerhubpwd}'

}
                   sh 'docker push ankitjagtap/northladder_assignment:nodejs'
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                // Set up Kubernetes context
                withKubeConfig(
                    credentialsId: 'k8scredentials', 
                    serverUrl: 'https://your-eks-api-server-url'
                ) {
                    // Deploy using Kubectl
                    sh "kubectl apply -f deeployment.yaml"
                    sh "kubectl apply -f service-definations.yaml
                }
            }
        }
    }
}
