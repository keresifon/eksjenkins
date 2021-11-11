// def awsCredentials = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'e1c77e8f-e4f1-4eba-9834-1ecf6008e52e']]

pipeline { 

    
   
    agent any 

    

    stages { 

         stage('Building') { 
             agent {
                docker {
                    image 'ubuntu:21.10'
                }
            }

             steps { 
                      sh "apt update && apt install -y sudo"
                    //   sh "apt-get install -y gnupg software-properties-common curl"
                

             } 

        }

        // stage('Deploy our image') { 

        //     steps { 

        //         script { 

        //             docker.withRegistry( '', registryCredential ) { 

        //                 dockerImage.push() 

        //             }

        //         } 

        //     }

        // } 

        // stage('Cleaning up') { 

        //     steps { 

        //         sh "docker rmi $registry:latest" 

        //     }

        // } 

        // stage('Orchestrate') { 
        
       

        //     steps{
        //         step([
        //         $class: 'AmazonWebServicesCredentialsBinding',
        //         credentialsId: 'e1c77e8f-e4f1-4eba-9834-1ecf6008e52e'])
        //     }

        // } 

        

    }

}
