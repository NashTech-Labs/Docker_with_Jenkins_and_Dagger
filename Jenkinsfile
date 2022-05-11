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
        sh 'dagger do versions --log-format=plain'

        // if wanted individual versions can be built and published
        // dagger do versions 3

        // to trigger individual task like build of image
        // dagger do versions 3 build
      }
    }    
  }
}
