
pipeline { 
     
      
   
    agent {
                docker {
                    image 'keresifon/eksjenkins:kubernetes.7'
                }
            }

    

    stages { 
      

         stage('Provision') { 
             

             steps {  
                 withCredentials([[
                            $class: 'AmazonWebServicesCredentialsBinding',
                            credentialsId: "kereiac",
                            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                        ]]) {

              
                      sh "pwd"
                dir('kubernetes') {
                sh "pwd"
                //sh "echo $USER"
                sh "terraform init"
                sh "terraform apply -auto-approve"
           }
           sh "pwd"
                

             } 

        }
}

stage('IngressRole') { 
             

             steps {  
                 withCredentials([[
                            $class: 'AmazonWebServicesCredentialsBinding',
                            credentialsId: "kereiac",
                            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                        ]]) {

              
                      sh "pwd"
                dir('kubernetes') {
                sh "pwd"
                // sh "echo $USER"
                // sh "getent group sudo"
                //sh "aws eks --region us-east-1 update-kubeconfig --name portfolio"
                sh "aws iam create-policy --policy-name ALBIngressControllerIAMPolicy --policy-document file://iam_policy.json"
                sh "eksctl utils associate-iam-oidc-provider --region=us-east-1 --cluster=portfolio --approve"
                sh "eksctl create iamserviceaccount \
                        --region=us-east-1 \
                        --cluster=portfolio \
                        --namespace=kube-system \
                        --name=aws-load-balancer-controller \
                        --attach-policy-arn=arn:aws:iam::386710470695:policy/ALBIngressControllerIAMPolicy \
                        --approve \
                        --override-existing-serviceaccounts"
           }
           sh "pwd"
                

            } 

        }
}

stage('AWSIngress') { 
             

             steps {  
                 withCredentials([[
                            $class: 'AmazonWebServicesCredentialsBinding',
                            credentialsId: "kereiac",
                            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                        ]]) {

              
                      sh "pwd"
                dir('kubernetes') {
                sh "pwd"
                        sh 'kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"'
                        sh "helm repo add eks https://aws.github.io/eks-charts"
                        sh "helm repo update"
                        sh "helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
                                -n kube-system \
                                --set clusterName=portfolio \
                                --set serviceAccount.create=false \
                                --set serviceAccount.name=aws-load-balancer-controller"
                    }
           sh "pwd"
                

            } 

        }
}

stage('Deploy') { 
             

             steps {  
                 withCredentials([[
                            $class: 'AmazonWebServicesCredentialsBinding',
                            credentialsId: "kereiac",
                            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                        ]]) {

              
                      sh "pwd"
                dir('kubernetes') {
                sh "pwd"

                sh "aws eks --region us-east-1 update-kubeconfig --name portfolio "
                sh "cd kubernetes"
                sh "kubectl apply -f namespace.yaml"
                sh "kubectl apply -f service.yaml"
                sh "kubectl apply -f ingress.yaml"
                sh "kubectl apply -f deployment.yaml"
                    }
           sh "pwd"
                

            } 

        }
}
    }
    }

