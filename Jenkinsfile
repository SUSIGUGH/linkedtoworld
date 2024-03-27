pipeline {
    agent any

    stages {
        
        stage('Git Clone') {
            steps {
                sh 'rm -Rf linkedtoworld'
                sh 'git clone https://github.com/SUSIGUGH/linkedtoworld.git'
            }
        }
        
        stage('Create Cluster') {
            steps {
                sh 'cd linkedtoworld/terraform && ls -ltr && terraform init && terraform validate && terraform plan && terraform apply -auto-approve && terraform destroy -auto-approve '
            }
        }  
        
        
    }
}

