// def awsCredentials = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'e1c77e8f-e4f1-4eba-9834-1ecf6008e52e']]

pipeline { 

    environment { 

        registry = "keresifon/gke" 

        registryCredential = 'keresifon' 

        dockerImage = '' 
    
    }
   
   
    agent any 

    

    stages { 

        stage('Cloning our Git') { 

            steps { 

                 git  url: 'https://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@github.com/keresifon/eksjenkins.git' //git 'https://github.com/keresifon/portfolio.git' 

            }

        } 

         stage('Building our image') { 

             steps { 
                      sh "sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl"
                

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
