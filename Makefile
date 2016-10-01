SOURCES=$(wildcard *.go **/*.go **/**/*.go)

.clean:
	rm -f ./gitchain
	rm -rf gitchain*.db

all: gitchain

gitchain: $(SOURCES) ui/bindata.go
	go build

#go test -cover ./keys ./block ./transaction ./db ./git
test:
	go test -cover ./...

ui/bindata.go: ui $(filter-out ui/bindata.go, $(wildcard ui/**)) Makefile
	go-bindata -pkg=ui -o=ui/bindata.go -ignore=\(bindata.go\|\.gitignore\) -prefix=ui ui

prepare:
	go get github.com/jteeuwen/go-bindata/go-bindata
	go get github.com/tools/godep
	go get github.com/stretchr/testify/assert
	godep restore
