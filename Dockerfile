
FROM ubuntu:21.10
RUN apt-get update && apt-get install -y gnupg software-properties-common curl
# RUN apt-get install -y sudo
# RUN useradd jenkins
# RUN usermod -aG sudo jenkins
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg |  apt-key add -
RUN  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN  apt-get update &&  apt-get install terraform
RUN  apt-get install -y unzip 
RUN apt install -y git
RUN apt install -y awscli
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" |  tee /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl
RUN export KUBECONFIG=/etc/kubernetes/admin.conf
RUN curl https://baltocdn.com/helm/signing.asc |  apt-key add -
RUN apt-get install -y apt-transport-https ca-certificates curl
RUN echo "deb https://baltocdn.com/helm/stable/debian/ all main" |  tee /etc/apt/sources.list.d/helm-stable-debian.list
RUN apt-get update
RUN apt-get install helm
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/v0.70.0/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp
RUN mv /tmp/eksctl /usr/local/bin
