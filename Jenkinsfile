node {
    def WORKSPACE = "/var/lib/jenkins/workspace/springbootapplication_main"
    def dockerImageTag = "springbootapplication${env.BUILD_NUMBER}"
try{
    notifyBuild('STARTED')
    stage('Clone Repo') {
        // for display purposes
        // Get some code from a GitHub repository
        git url: 'https://github.com/suahad/assignment.git',
            credentialsId: 'AKIA5TG72EOS53USA2GE',
            branch: 'main'
            
     }
    stage('Build docker') {
         dockerImage = docker.build("springbootapplication:${env.BUILD_NUMBER}")
    }
    stage('Deploy docker'){
          echo "Docker Image Tag Name: ${dockerImageTag}"
          sh "docker stop springbootapplication || true && docker rm springbootapplication || true"
          sh "docker run --name springbootapplication -d -p 8081:8081 springbootapplication:${env.BUILD_NUMBER}"
    }
}catch(e){
    currentBuild.result = "FAILED"
    throw e
}finally{
    notifyBuild(currentBuild.result)
 }
}


def notifyBuild(String buildStatus = 'STARTED'){
  
  // build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESSFUL'
  
  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def now = new Date()
  
  // message
  def subject = "${buildStatus}, Job: ${env.JOB_NAME} FRONTEND - Deployment Sequence: [${env.BUILD_NUMBER}] "
  def summary = "${subject} - Check On: (${env.BUILD_URL}) - Time: ${now}"
  def subject_email = "Spring boot Deployment"
  def details = """<p>${buildStatus} JOB </p>
    <p>Job: ${env.JOB_NAME} - Deployment Sequence: [${env.BUILD_NUMBER}] - Time: ${now}</p>
    <p>Check console output at "<a href="${env.BUILD_URL}">${env.JOB_NAME}</a>"</p>"""
  
  // Email notification
  emailext (
     to: "suhadmalayshi@gmail.com",
     subject: springbootapplication-jenkins,
     body: details,
     recipientProviders: [[$class: 'DevelopersRecipientProvider']]
  )
    
}
