docker run -it -v ./:/h3-go --platform=linux/amd64 ubuntu:22.04 /bin/bash
apt-get update
apt-get install -y git wget gcc
wget https://github.com/actions/go-versions/releases/download/1.21.13-3890634278/go-1.18.10-linux-x64.tar.gz
mkdir /go
tar -xzf go-1.21.13-linux-x64.tar.gz -C /go
export PATH=$PATH:/go/bin
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.47.3
export PATH=${PATH}:`go env GOPATH`/bin
cd h3-go/
golangci-lint run