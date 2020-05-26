FROM golang:1.14.2

# protobuf compiler
RUN apt update && \
    apt install -y protobuf-compiler

# proto doc
RUN go get -u github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc

# grpc go
RUN go get -u github.com/golang/protobuf/proto && \
    go get -u github.com/golang/protobuf/protoc-gen-go

# grpc java
RUN curl -o /usr/local/bin/protoc-gen-grpc-java https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-java/1.29.0/protoc-gen-grpc-java-1.29.0-linux-x86_64.exe && \
	chmod ugo+x /usr/local/bin/protoc-gen-grpc-java

# grpc cpp, python, ruby, csharp, node
RUN git clone --recurse-submodules -b v1.28.1 https://github.com/grpc/grpc
RUN apt install -y cmake
RUN mkdir -p grpc/cmake/build && \
	cd grpc/cmake/build && \
	cmake ../.. && \
	make -j4 && \
	make install && \
	cd ../../..
RUN rm -r grpc
