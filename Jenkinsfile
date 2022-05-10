pipeline {
  agent any
  environment {
    DH_CREDS=credentials('DockerHub') // provide the ID created by you in Jenkins Server
  }
  stages {
    stage("setup") {
      // primary steps for every project before you work on dagger
      steps {
        sh '''
          dagger project init
          dagger project update
        '''
      }
    }
    stage("Image creation and Push") {
      // --log-format=plain flag provides the simple output on the command line 
      steps {
        sh 'dagger do push --log-format=plain'
      }
    }    
  }
}
