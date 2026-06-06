   pipeline {
    agent any

    stages {
        stage('terraform install') {
            steps {
                sh 'sudo yum install -y yum-utils shadow-utils'
                sh 'sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo'
                sh 'sudo yum install terraform -y'
            }
        } 
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/shareefstm/apache-declarative.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                terraform plan -out tfplan
                terraform show -no-color tfplan > tfplan.txt
                '''
                
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}