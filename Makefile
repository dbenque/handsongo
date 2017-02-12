dist: macos linux docker
	rm -rf dist/macos dist/linux dist/docker
	cp INSTALLATION.md dist/

macos:
	@rm -rf dist/macos
	@mkdir -p dist/macos/apps
	@echo '************************************'
	@echo MACOS: prepare vscode app
	@echo '************************************'
	wget -q --output-document=$(shell pwd)/dist/macos/apps/vscode.zip https://go.microsoft.com/fwlink/?LinkID=620882
	wget -q --output-document=$(shell pwd)/dist/macos/apps/go.vsix https://lukehoban.gallery.vsassets.io/_apis/public/gallery/publisher/lukehoban/extension/Go/0.6.53/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
	unzip -q $(shell pwd)/dist/macos/apps/vscode.zip -d $(shell pwd)/dist/macos/apps/
	@rm $(shell pwd)/dist/macos/apps/vscode.zip
	@echo '************************************'
	@echo MACOS: prepare golang app
	@echo '************************************'
	wget -q --output-document=$(shell pwd)/dist/macos/apps/go.tar.gz https://storage.googleapis.com/golang/go1.7.5.darwin-amd64.tar.gz
	tar -C $(shell pwd)/dist/macos/apps/ -xzf $(shell pwd)/dist/macos/apps/go.tar.gz
	@rm $(shell pwd)/dist/macos/apps/go.tar.gz
	@echo '************************************'
	@echo MACOS: prepare jq
	@echo '************************************'
	@mkdir -p $(shell pwd)/dist/macos/apps/bin
	wget -q --output-document=$(shell pwd)/dist/macos/apps/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-osx-amd64
	chmod +x $(shell pwd)/dist/macos/apps/bin/jq
	@echo '************************************'
	@echo MACOS: prepare tools
	@echo '************************************'
	cp macos/* dist/macos/
	cp vscode_settings.json dist/macos/
	@echo '************************************'
	@echo MACOS: prepare workspace
	@echo '************************************'
	@mkdir -p dist/macos/workspace/src/github.com/Sfeir
	@mkdir -p dist/macos/workspace/bin
	@mkdir -p dist/macos/workspace/pkg
	git clone -q -b start https://github.com/Sfeir/handsongo.git dist/macos/workspace/src/github.com/Sfeir/handsongo
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u github.com/nsf/gocode
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u github.com/rogpeppe/godef
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u github.com/golang/lint/golint
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u github.com/lukehoban/go-outline
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u sourcegraph.com/sqs/goreturns
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u golang.org/x/tools/cmd/gorename
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u github.com/tpng/gopkgs
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u github.com/newhook/go-symbols
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u golang.org/x/tools/cmd/guru
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=darwin GOARCH=amd64 go get -u github.com/cweill/gotests/...
	@[ -d dist/macos/workspace/bin/darwin_amd64 ] && mv dist/macos/workspace/bin/darwin_amd64/* dist/macos/workspace/bin/ || echo 'move os arch binaries'
	@[ -d dist/macos/workspace/bin/darwin_amd64 ] && rm -rf dist/macos/workspace/bin/darwin_amd64 || echo 'clean os arch binaries folder'
	@echo '************************************'
	@echo MACOS: prepare archive
	@echo '************************************'
	cd dist/macos; zip -q -r ../handsongo-macos.zip *
	@cd ../..

linux:
	@rm -rf dist/linux
	@mkdir -p dist/linux/apps
	@echo '************************************'
	@echo LINUX: prepare vscode app
	@echo '************************************'
	wget -q --output-document=$(shell pwd)/dist/linux/apps/vscode.tar.gz https://go.microsoft.com/fwlink/?LinkID=620884
	wget -q --output-document=$(shell pwd)/dist/linux/apps/go.vsix https://lukehoban.gallery.vsassets.io/_apis/public/gallery/publisher/lukehoban/extension/Go/0.6.53/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
	tar -C $(shell pwd)/dist/linux/apps/ -xzf $(shell pwd)/dist/linux/apps/vscode.tar.gz
	@rm $(shell pwd)/dist/linux/apps/vscode.tar.gz
	@echo '************************************'
	@echo LINUX: prepare golang app
	@echo '************************************'
	wget -q --output-document=$(shell pwd)/dist/linux/apps/go.tar.gz https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz
	tar -C $(shell pwd)/dist/linux/apps/ -xzf $(shell pwd)/dist/linux/apps/go.tar.gz
	@rm $(shell pwd)/dist/linux/apps/go.tar.gz
	@echo '************************************'
	@echo MACOS: prepare jq
	@echo '************************************'
	@mkdir -p $(shell pwd)/dist/linux/apps/bin
	wget -q --output-document=$(shell pwd)/dist/linux/apps/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
	chmod +x $(shell pwd)/dist/linux/apps/bin/jq
	@echo '************************************'
	@echo LINUX: prepare tools
	@echo '************************************'
	cp linux/* dist/linux/
	cp vscode_settings.json dist/linux/
	@echo '************************************'
	@echo LINUX: prepare workspace
	@echo '************************************'
	@mkdir -p dist/linux/workspace/src/github.com/Sfeir
	@mkdir -p dist/linux/workspace/bin
	@mkdir -p dist/linux/workspace/pkg
	git clone -q -b start https://github.com/Sfeir/handsongo.git dist/linux/workspace/src/github.com/Sfeir/handsongo
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u github.com/nsf/gocode
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u github.com/rogpeppe/godef
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u github.com/golang/lint/golint
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u github.com/lukehoban/go-outline
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u sourcegraph.com/sqs/goreturns
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u golang.org/x/tools/cmd/gorename
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u github.com/tpng/gopkgs
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u github.com/newhook/go-symbols
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u golang.org/x/tools/cmd/guru
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u github.com/cweill/gotests/...
	@[ -d dist/linux/workspace/bin/linux_amd64 ] && mv dist/linux/workspace/bin/linux_amd64/* dist/linux/workspace/bin/ || echo 'move os arch binaries'
	@[ -d dist/linux/workspace/bin/linux_amd64 ] && rm -rf dist/linux/workspace/bin/linux_amd64 || echo 'clean os arch binaries folder'
	@echo '************************************'
	@echo LINUX: prepare archive
	@echo '************************************'
	cd dist/linux; zip -q -r ../handsongo-linux.zip *
	@cd ../..

docker:
	@mkdir -p dist/docker
	@echo '************************************'
	@echo DOCKER: get images
	@echo '************************************'
	docker pull golang:1.7.5-alpine
	docker pull mongo:3.3
	@echo '************************************'
	@echo DOCKER: save images
	@echo '************************************'
	docker save --output dist/docker/image-golang.tar golang:1.7.5-alpine
	docker save --output dist/docker/image-mongo.tar mongo:3.3
	@echo '************************************'
	@echo DOCKER: prepare documentation
	@echo '************************************'
	cp docker/* dist/docker/
	@echo '************************************'
	@echo DOCKER: prepare archive
	@echo '************************************'
	cd dist/docker; zip -q -r ../handsongo-docker.zip *
	@cd ../..

.PHONY: macos linux dist docker
