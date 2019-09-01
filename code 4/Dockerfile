FROM ubuntu:18.04

RUN apt-get update && \
     apt-get install apt-transport-https lsb-release software-properties-common dirmngr curl unzip git -y && \
     AZ_REPO=$(lsb_release -cs) && \
     echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
     tee /etc/apt/sources.list.d/azure-cli.list && \
     apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv \
          --keyserver packages.microsoft.com \
          --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF && \
     apt-get update && apt-get install azure-cli

RUN apt-get update &&  apt-get install -y apt-transport-https && \
     curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key add - && \
     echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" |  tee -a /etc/apt/sources.list.d/kubernetes.list && \
     apt-get update && apt-get install -y kubectl

RUN curl https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip --output terraform.zip && \
     unzip terraform.zip && \
     mv terraform /usr/bin && \
     rm terraform.zip

CMD ["/bin/bash"]