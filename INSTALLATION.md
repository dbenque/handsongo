# Hand's on go tooling setup

## Prerequisite

You must have `git` and `docker` installed on your machine.

## Manual installation

* [Install of Visual Studio Code](https://code.visualstudio.com/),
* [Install of Go Lang plugin in VSCode](https://marketplace.visualstudio.com/items?itemName=lukehoban.Go),
* [Install Golang](https://golang.org/doc/install).
* Pull needed docker images

```
docker pull golang:1.6-wheezy
docker pull mongo:3.2
```

### Workspace installation

* Create GOPATH tree structure,

```
.
├── bin
├── pkg
└── src
    └── github.com
        └── Sfeir
```

* Download go tools for Visual Studio Code,

```
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v github.com/golang/lint/golint
go get -u -v github.com/lukehoban/go-outline
go get -u -v sourcegraph.com/sqs/goreturns
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v github.com/tpng/gopkgs
go get -u -v github.com/newhook/go-symbols
go get -u -v golang.org/x/tools/cmd/guru
```

* Download the git repository of hand's on go and checkout the `start` branch.

```
git clone -b start git@github.com:Sfeir/handsongo.git workspace/src/github.com/Sfeir/handsongo
```

### as script for linux/macos users

```
#!/bin/bash

mkdir -p workspace/src/github.com/Sfeir
mkdir -p workspace/bin
mkdir -p workspace/pkg

export GOPATH=$(pwd)/workspace

go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v github.com/golang/lint/golint
go get -u -v github.com/lukehoban/go-outline
go get -u -v sourcegraph.com/sqs/goreturns
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v github.com/tpng/gopkgs
go get -u -v github.com/newhook/go-symbols
go get -u -v golang.org/x/tools/cmd/guru

git clone -b start git@github.com:Sfeir/handsongo.git workspace/src/github.com/Sfeir/handsongo
```

## Offline package

* Take the package `handsongo-<OS>.zip` and unzip it,
* Go in this folder and read the `README.md` file.

Package available for `linux`, `windows`, and `macos`.

### Warning for Windows users

Currently, the project only provide a `Makefile` for linux/macos users.

## Need Docker images?

* Take the package `handsongo-docker.zip` and unzip it,
* Go in this folder and read the `README.md` file.
