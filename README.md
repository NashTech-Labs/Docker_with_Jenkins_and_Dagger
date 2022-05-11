# Template to build and push docker images to docker hub repository using Dagger and Jenkins

This template uses dagger and jenkins to create a CI pipeline to build and push container image docker repository without using any jenkins plugins.


*************************************************************************************************************
### Requirements : 
*************************************************************************************************************
1. Jenkins Server 
2.  Dagger and Docker installed on system 

* NOTE: you can use local system as well as on cloud

*************************************************************************************************************
### Steps : 
*************************************************************************************************************

* Add your Docker Hub Credentials to your Jenkins server
* Create a pipeline job in Jenkins
 #### reference : https://blog.knoldus.com/using-dagger-with-jenkins-in-a-simple-ci-pipeline/

* Now build your job

*************************************************************************************************************
### Recommendation: 

The whole code is directly made using the dagger and docker module imported. You can explore these modules to understand the code more.
For example, the configuration of the image is under docker.#Set where every variable used is defined. these are based on OCI and can be referenced from following:

https://github.com/opencontainers/image-spec/blob/main/config.md

## Thank You!
*************************************************************************************************************
