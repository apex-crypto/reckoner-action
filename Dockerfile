FROM alpine:3
MAINTAINER "Peak6 <devops@peak6.com>"

RUN apk update && \
apk add aws-cli jq make unzip wget git python3 py3-pip curl bash openssl

# install helm
RUN wget https://get.helm.sh/helm-v3.5.2-linux-amd64.tar.gz && tar xvzf helm-v3.5.2-linux-amd64.tar.gz
RUN mv /linux-amd64/helm /usr/local/bin/  

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

COPY entrypoint.sh /entrypoint.sh
# install reckoner
RUN pip install git+git://github.com/fairwindsops/reckoner.git@9ea6664e13cb03bccce443b9cbab850410cab3d5

RUN rm -rf /tmp/* && \
rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]