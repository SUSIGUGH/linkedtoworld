pipeline {
    agent any
    stages {
        
        

stage('Generate variables for master and worker ip') {
environment {
MASTERIP = "none"
}

            steps {
                env.MASTERIP = sh(returnStdout: true, script: 'cd linkedtoworld/terraform && terraform output | head -1 | cut -d"=" -f2')
                echo "MASTER IP is ${env.MASTERIP}"
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

