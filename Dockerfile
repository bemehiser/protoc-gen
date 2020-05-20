FROM golang:1.14.2

# Protobuf
RUN apt update && \
    apt install -y protobuf-compiler

# Doc
RUN go get -u github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc

# Grpc
RUN go get -u github.com/golang/protobuf/proto && \
    go get -u github.com/golang/protobuf/protoc-gen-go
RUN curl -o /usr/local/bin/protoc-gen-grpc-java https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-java/1.29.0/protoc-gen-grpc-java-1.29.0-linux-x86_64.exe && \
	chmod ugo+x /usr/local/bin/protoc-gen-grpc-java
RUN apt install -y ruby gem && \
	gem install grpc-tools
