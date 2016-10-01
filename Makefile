SOURCES=$(wildcard *.go **/*.go **/**/*.go)

.clean:
	rm -f ./gitchain
	rm -rf gitchain*.db
	rm -rf vendor
	rm -f Godeps/Readme

all: gitchain

gitchain: $(SOURCES) ui/bindata.go
	go build

test:
	go test -cover ./keys ./block ./transaction ./db ./git ./merkle

ui/bindata.go: ui $(filter-out ui/bindata.go, $(wildcard ui/**)) Makefile
	go-bindata -pkg=ui -o=ui/bindata.go -ignore=\(bindata.go\|\.gitignore\) -prefix=ui ui

prepare:
	go get golang.org/x/crypto/ripemd160
	go get github.com/jteeuwen/go-bindata/go-bindata
	go get github.com/tools/godep
	go get github.com/stretchr/testify/assert
	godep restore
