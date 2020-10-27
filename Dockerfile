FROM alpine:3.12

RUN apk add --update curl git && \
    curl -L "https://storage.googleapis.com/kubernetes-release/release/v1.19.3/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    curl -L "https://get.helm.sh/helm-v3.3.4-linux-amd64.tar.gz" -o /tmp/helm-v3.3.4-linux-amd64.tar.gz && \
    tar -zxvf /tmp/helm-v3.3.4-linux-amd64.tar.gz -C /tmp/ && \
    mv /tmp/linux-amd64/helm /usr/local/bin/helm && \
    helm plugin install https://github.com/databus23/helm-diff && \
    curl -L "https://github.com/roboll/helmfile/releases/download/v0.132.1/helmfile_linux_amd64" -o /usr/local/bin/helmfile && \
    chmod +x /usr/local/bin/helmfile
