package daggerapp

import (
  "dagger.io/dagger"
  "universe.dagger.io/docker"
)

dagger.#Plan & {
  client: {
    env: {
      DH_CREDS_USR: string
      DH_CREDS_PSW: dagger.#Secret
    }
  }
  actions: versions: {

    "latest": _
    "3.14": _
    "3": _
    
    // The cue template type format used here for various versions
    [tag=string]:{
      build: docker.#Build & {
        steps: [
          docker.#Pull & {
            source: "alpine:\(tag)"
          },
        ]      
      }
      push: docker.#Push & {
        auth: {
          username: client.env.DH_CREDS_USR
          secret: client.env.DH_CREDS_PSW
        }
        
        image: build.output
        dest: "vaibhavkuma779/jenkins-dagger:\(tag)" // Provide your registry name here
   
      }
    }

    
  }
}
