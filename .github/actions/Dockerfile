FROM alpine:3
MAINTAINER "Peak6 <devops@peak6.com>"

RUN apk update && \
apk add aws-cli jq make unzip wget git python3 py3-pip curl bash openssl

# install helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
chmod +x get_helm.sh && ./get_helm.sh

COPY entrypoint.sh /entrypoint.sh
# install reckoner
RUN pip install reckoner

RUN rm -rf /tmp/* && \
rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]
