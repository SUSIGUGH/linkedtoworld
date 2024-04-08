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
		sh 'mkdir terraform'
		sh 'cp linkedtoworld/terraform/* terraform/'
                sh 'cd terraformi && ls -ltr && terraform init && terraform validate && terraform plan && terraform apply -auto-approve'
      		sh 'cd terraform && terraform output | grep masterpubip | cut -d"=" -f2 > /tmp/mstip.txt'
      		sh 'cd terraform && terraform output | grep workerpubip | cut -d"=" -f2 > /tmp/wrkip.txt'
            }
        } 
     
   stage('Wait for Master and Worker to Warm Up') {
            steps {
                sh 'sleep 120'
            }
        }

	stage('Generate variables for master and worker ip') {
	environment {
	MASTERIP = ""
	WORKERIP = ""
	}

            steps {
		script {
		env.MASTERIP = sh(returnStdout: true, script: 'tail -1 /tmp/mstip.txt | xargs | tr -d [:space:]')
		env.WORKERIP = sh(returnStdout: true, script: 'tail -1 /tmp/wrkip.txt | xargs | tr -d [:space:]')
		}
//                echo "MASTER IP is ${env.MASTERIP}"
               // sh 'cd linkedtoworld/terraform && terraform output | tail -1 | cut -d"=" -f2 > /tmp/wokerip.txt'
               // sh 'cd linkedtoworld && chmod 600 linkedtoworld.pem'
                //sh 'cd linkedtoworld && scp -i linkedtoworld.pem -o StrictHostKeyChecking=no linkedtoworld.pem /tmp/wokerip.txt ec2-user@${masterip}:/home/ec2-user'
                //sh 'cd linkedtoworld && ssh -i linkedtoworld.pem -o StrictHostKeyChecking=no ec2-user@${masterip} "export workerip=$(cat ~/workerip.txt"'
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

