// def awsCredentials = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'e1c77e8f-e4f1-4eba-9834-1ecf6008e52e']]

pipeline { 

    
   
    agent any 
          

    

    stages { 

        stage("Fix the permission issue") {

            agent any

            steps {
                sh "sudo chown root:jenkins /run/docker.sock"
            }

        }

         stage('Building') { 
             agent {
                docker {
                    image 'ubuntu:bionic'
                }
            }

             steps {  
                      sh "apt-get update"
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
