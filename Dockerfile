FROM alpine:3
LABEL org.opencontainers.image.authors="devops@peak6.com"

RUN apk update && \
apk add aws-cli bash curl git jq make openssl py3-pip python3 unzip wget

# install helm
RUN wget https://get.helm.sh/helm-v3.5.2-linux-amd64.tar.gz && tar xvzf helm-v3.5.2-linux-amd64.tar.gz
RUN mv /linux-amd64/helm /usr/local/bin/  

# install kubectl
RUN KUBECTL_STABLE_VERSION=$(curl -ks https://storage.googleapis.com/kubernetes-release/release/stable.txt); curl -kLO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_STABLE_VERSION/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# install reckoner
RUN pip install git+https://github.com/fairwindsops/reckoner.git@9ea6664e13cb03bccce443b9cbab850410cab3d5

RUN rm -rf /tmp/* && \
rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
