package app

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

    filesystem: ".": read: contents: dagger.#FS
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
          
          docker.#Copy & {
            contents: client.filesystem.".".read.contents
            source: "index.html"
            dest: "/var/www/html/"
          },

          docker.#Copy & {
            contents: client.filesystem.".".read.contents
            source: "default.conf"
            dest: "/etc/nginx/conf.d/"
          },

          docker.#Set & {
            config: {
              expose: ["80"]:{} 
              cmd: ["nginx","-g","daemon off;"]
            }
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
