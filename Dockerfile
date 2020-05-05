FROM golang:1.14.2

RUN go get -u github.com/golang/protobuf/proto && \
    go get -u github.com/golang/protobuf/protoc-gen-go && \
    go get -u github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc

RUN apt update && \
    apt install -y protobuf-compiler
