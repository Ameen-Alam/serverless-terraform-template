pipeline {
    environment {
        plan = sh(script: 'cat plan.out', , returnStdout: true).trim()
    }
    parameters {
        string(defaultValue: "${params.BUILD_NUMBER}", description: 'This is a BUILD_NUMBER parameter', name: 'BUILD_NUMBER')
    }
    agent any
    stages {
        stage("Set Terraform path") {
            steps {
                slackSend channel: '#terraform-approval' , color: "#439FE0" , message: "Trigger Jenkins ${env.JOB_NAME} - ${env.BUILD_URL} \n git pull ${env.GIT_URL} \n Branch ${env.GIT_BRANCH} \n Git Commit ${env.GIT_COMMIT} \n Jenkins URL ${JENKINS_URL} \n Build Tag ${BUILD_TAG}"
                script {
                    def tfHome = tool name: "Terraform"
                    env.PATH = "${tfHome}:${env.PATH}"
                }
                sh "terraform --version"
            }
        }
        stage('Terraform Plan') {
            steps {
                sh "terraform init -backend-config='token=${params.TOKEN}'"
                sh "terraform plan -var BUILD_NUMBER='${params.BUILD_NUMBER}' -out myplan > plan.out"
                script{
                    plan = sh(script: 'cat plan.out', , returnStdout: true).trim()                    
                }
                slackSend channel: '#terraform-approval' , color: "#439FE0" , message: "Terraform Plan \n $plan"
            }
        }
        stage('Approval') {
            steps {
                slackSend channel: '#terraform-approval' , color: "#439FE0" , message: "need to approval terraform plan Build, URL ${env.BUILD_URL}"
                script {
                    def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
                }
                slackSend channel: '#terraform-approval' , color: "#439FE0" , message: "Approved by ${env.BUILD_USER_ID}"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh "terraform apply myplan"
                slackSend channel: '#terraform-approval' , color: "#439FE0" , message: "Terraform Apply \n Now the application is live on this URL \n https://skills-online-bq472ekzpq-de.a.run.app"
            }
        }
    }
}