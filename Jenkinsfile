pipeline {
    agent any
environment {
                masterip = ''
                workerip = ''
            }
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

stage('Generate variables for master and worker ip') {
            steps {
               script{
                env.masterip = $(terraform output | head -1 | cut -d"=" -f2 )'
		}
                sh 'terraform output | tail -1 | cut -d"=" -f2 > /tmp/wokerip.txt'
                sh 'chmod 600 linkedtoworld.pem'
                sh 'echo env.masterip'
                sh 'scp -i linkedtoworld.pem -o StrictHostKeyChecking=no linkedtoworld.pem /tmp/wokerip.txt ec2-user@env.masterip:/home/ec2-user'
                sh 'ssh -i linkedtoworld.pem -o StrictHostKeyChecking=no ec2-user@env.masterip "export workerip=$(cat ~/workerip.txt"'
            }
        }

  //stage('SCP kubeadm join command from master to worker') {
    //        steps {
      //          sh 'chmod 600 linkedtoworld.pem'
        //        sh 'ssh -i linkedtoworld.pem -o StrictHostKeyChecking=no ec2-user@$masterip "export workerip=$(cat ~/workerip.txt && scp -i ~/linkedtoworld.pem -o StrictHostKeyChecking=no /tmp/kubeadmjoin.sh ec2-user@$workerip:/home/ec2-user/"'
          //  }
        //}
        
        
    }
}

