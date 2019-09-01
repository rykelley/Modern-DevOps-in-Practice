FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install apt-transport-https lsb-release software-properties-common dirmngr -y
RUN AZ_REPO=$(lsb_release -cs) && \
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
tee /etc/apt/sources.list.d/azure-cli.list
RUN apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv \
     --keyserver packages.microsoft.com \
     --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF
RUN apt-get update && apt-get install azure-cli
CMD ["/bin/bash"]