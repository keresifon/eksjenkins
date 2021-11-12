// def awsCredentials = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'e1c77e8f-e4f1-4eba-9834-1ecf6008e52e']]

pipeline { 

    
   
    agent any 

    

    stages { 

         stage('Building') { 
             agent {
                docker {
                    image 'keresifon/eksjenkins:latestn'
                }
            }

             steps {  
                 withCredentials([[
    $class: 'AmazonWebServicesCredentialsBinding',
    credentialsId: "kereiac",
    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
]]) {
    // AWS Code

                 sh "aws s3 ls"
                      sh "pwd"
                dir('kubernetes') {
                sh "pwd"
                
                sh "terraform init"
           }
           sh "pwd"
                

             } 

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
