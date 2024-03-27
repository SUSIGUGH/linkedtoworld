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
                sh 'cd linkedtoworld/terraform && ls -ltr && terraform init && terraform validate && terraform plan && terraform apply -auto-approve'
            }
        } 
     
   stage('Wait for Master and Worker to Warm Up') {
            steps {
                sh 'sleep 120'
            }
        }
 

  stage('SCP pem to master node') {
            steps {
                sh 'chmod 600 linkedtoworld.pem'
                sh 'scp -i linkedtoworld.pem -o StrictHostKeyChecking=no linkedtoworld.pem ec2-user@172.31.11.243:/home/ec2-user'
            }
        }

  stage('SCP kubeadm join command from master to worker') {
            steps {
                sh 'chmod 600 linkedtoworld.pem'
                sh 'ssh -i linkedtoworld.pem -o StrictHostKeyChecking=no ec2-user@172.31.11.243 "scp -i ~/linkedtoworld.pem -o StrictHostKeyChecking=no /tmp/kubeadmjoin.sh ec2-user@172.31.8.107:/home/ec2-user/"'
            }
        }
        
        
    }
}

