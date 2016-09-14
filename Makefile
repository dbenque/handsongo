dist: win macos linux docker
	rm -rf dist/win dist/macos dist/linux dist/docker
	cp INSTALLATION.md dist/

win:
	@rm -rf dist/win
	@mkdir -p dist/win/apps/VSCode
	@echo ******************
	@echo prepare vscode app
	@echo ******************
	wget --output-document=$(shell pwd)/dist/win/apps/vscode.zip https://go.microsoft.com/fwlink/?LinkID=623231
	wget --output-document=$(shell pwd)/dist/win/apps/go.vsix https://lukehoban.gallery.vsassets.io/_apis/public/gallery/publisher/lukehoban/extension/Go/0.6.43/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
	unzip $(shell pwd)/dist/win/apps/vscode.zip -d $(shell pwd)/dist/win/apps/VSCode/
	@rm $(shell pwd)/dist/win/apps/vscode.zip
	@echo ******************
	@echo prepare golang app
	@echo ******************
	wget --output-document=$(shell pwd)/dist/win/apps/go.zip https://storage.googleapis.com/golang/go1.6.3.windows-amd64.zip
	unzip $(shell pwd)/dist/win/apps/go.zip -d $(shell pwd)/dist/win/apps/
	@rm $(shell pwd)/dist/win/apps/go.zip
	@echo ******************
	@echo prepare tools
	@echo ******************
	cp win/* dist/win/
	@echo ******************
	@echo prepare workspace
	@echo ******************
	mkdir -p dist/win/workspace/src/github.com/Sfeir
	mkdir -p dist/win/workspace/bin
	mkdir -p dist/win/workspace/pkg
	git clone -b start https://github.com/Sfeir/handsongo.git dist/win/workspace/src/github.com/Sfeir/handsongo
	export GOPATH=$(shell pwd)/dist/win/workspace; GOOS=windows GOARCH=amd64 go get -u -v github.com/nsf/gocode
	export GOPATH=$(shell pwd)/dist/win/workspace; GOOS=windows GOARCH=amd64 go get -u -v github.com/rogpeppe/godef
	export GOPATH=$(shell pwd)/dist/win/workspace; GOOS=windows GOARCH=amd64 go get -u -v github.com/golang/lint/golint
	export GOPATH=$(shell pwd)/dist/win/workspace; GOOS=windows GOARCH=amd64 go get -u -v github.com/lukehoban/go-outline
	export GOPATH=$(shell pwd)/dist/win/workspace; GOOS=windows GOARCH=amd64 go get -u -v sourcegraph.com/sqs/goreturns
	export GOPATH=$(shell pwd)/dist/win/workspace; GOOS=windows GOARCH=amd64 go get -u -v golang.org/x/tools/cmd/gorename
	export GOPATH=$(shell pwd)/dist/win/workspace; GOOS=windows GOARCH=amd64 go get -u -v github.com/tpng/gopkgs
	export GOPATH=$(shell pwd)/dist/win/workspace; GOOS=windows GOARCH=amd64 go get -u -v github.com/newhook/go-symbols
	export GOPATH=$(shell pwd)/dist/win/workspace; GOOS=windows GOARCH=amd64 go get -u -v golang.org/x/tools/cmd/guru
	[ -d dist/win/workspace/bin/windows_amd64 ] && mv dist/win/workspace/bin/windows_amd64/* dist/win/workspace/bin/ || echo 'os arch'
	[ -d dist/win/workspace/bin/windows_amd64 ] && rm -rf dist/win/workspace/bin/windows_amd64 || echo 'os arch'
	@echo ******************
	@echo prepare archive
	@echo ******************
	cd dist/win; zip -r ../handsongo-win.zip *
	cd ../..

macos:
	@rm -rf dist/macos
	@mkdir -p dist/macos/apps
	@echo ******************
	@echo prepare vscode app
	@echo ******************
	wget --output-document=$(shell pwd)/dist/macos/apps/vscode.zip https://go.microsoft.com/fwlink/?LinkID=620882
	wget --output-document=$(shell pwd)/dist/macos/apps/go.vsix https://lukehoban.gallery.vsassets.io/_apis/public/gallery/publisher/lukehoban/extension/Go/0.6.43/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
	unzip $(shell pwd)/dist/macos/apps/vscode.zip -d $(shell pwd)/dist/macos/apps/
	@rm $(shell pwd)/dist/macos/apps/vscode.zip
	@echo ******************
	@echo prepare golang app
	@echo ******************
	wget --output-document=$(shell pwd)/dist/macos/apps/go.tar.gz https://storage.googleapis.com/golang/go1.6.3.darwin-amd64.tar.gz
	tar -C $(shell pwd)/dist/macos/apps/ -xzf $(shell pwd)/dist/macos/apps/go.tar.gz
	@rm $(shell pwd)/dist/macos/apps/go.tar.gz
	@echo ******************
	@echo prepare tools
	@echo ******************
	cp macos/* dist/macos/
	cp vscode_settings.json dist/macos/
	@echo ******************
	@echo prepare workspace
	@echo ******************
	mkdir -p dist/macos/workspace/src/github.com/Sfeir
	mkdir -p dist/macos/workspace/bin
	mkdir -p dist/macos/workspace/pkg
	git clone -b start https://github.com/Sfeir/handsongo.git dist/macos/workspace/src/github.com/Sfeir/handsongo
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u -v github.com/nsf/gocode
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u -v github.com/rogpeppe/godef
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u -v github.com/golang/lint/golint
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u -v github.com/lukehoban/go-outline
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u -v sourcegraph.com/sqs/goreturns
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u -v golang.org/x/tools/cmd/gorename
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u -v github.com/tpng/gopkgs
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u -v github.com/newhook/go-symbols
	export GOPATH=$(shell pwd)/dist/macos/workspace; GOOS=darwin GOARCH=amd64 go get -u -v golang.org/x/tools/cmd/guru
	[ -d dist/macos/workspace/bin/darwin_amd64 ] && mv dist/macos/workspace/bin/darwin_amd64/* dist/macos/workspace/bin/ || echo 'os arch'
	[ -d dist/macos/workspace/bin/darwin_amd64 ] && rm -rf dist/macos/workspace/bin/darwin_amd64 || echo 'os arch'
	@echo ******************
	@echo prepare archive
	@echo ******************
	cd dist/macos; zip -r ../handsongo-macos.zip *
	cd ../..

linux:
	@rm -rf dist/linux
	@mkdir -p dist/linux/apps
	@echo ******************
	@echo prepare vscode app
	@echo ******************
	wget --output-document=$(shell pwd)/dist/linux/apps/vscode.tar.gz https://go.microsoft.com/fwlink/?LinkID=620884
	wget --output-document=$(shell pwd)/dist/linux/apps/go.vsix https://lukehoban.gallery.vsassets.io/_apis/public/gallery/publisher/lukehoban/extension/Go/0.6.43/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
	tar -C $(shell pwd)/dist/linux/apps/ -xzf $(shell pwd)/dist/linux/apps/vscode.tar.gz
	@rm $(shell pwd)/dist/linux/apps/vscode.tar.gz
	@echo ******************
	@echo prepare golang app
	@echo ******************
	wget --output-document=$(shell pwd)/dist/linux/apps/go.tar.gz https://storage.googleapis.com/golang/go1.6.3.linux-amd64.tar.gz
	tar -C $(shell pwd)/dist/linux/apps/ -xzf $(shell pwd)/dist/linux/apps/go.tar.gz
	@rm $(shell pwd)/dist/linux/apps/go.tar.gz
	@echo ******************
	@echo prepare tools
	@echo ******************
	cp linux/* dist/linux/
	cp vscode_settings.json dist/linux/
	@echo ******************
	@echo prepare workspace
	@echo ******************
	mkdir -p dist/linux/workspace/src/github.com/Sfeir
	mkdir -p dist/linux/workspace/bin
	mkdir -p dist/linux/workspace/pkg
	git clone -b start https://github.com/Sfeir/handsongo.git dist/linux/workspace/src/github.com/Sfeir/handsongo
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u -v github.com/nsf/gocode
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u -v github.com/rogpeppe/godef
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u -v github.com/golang/lint/golint
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u -v github.com/lukehoban/go-outline
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u -v sourcegraph.com/sqs/goreturns
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u -v golang.org/x/tools/cmd/gorename
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u -v github.com/tpng/gopkgs
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u -v github.com/newhook/go-symbols
	export GOPATH=$(shell pwd)/dist/linux/workspace; GOOS=linux GOARCH=amd64 go get -u -v golang.org/x/tools/cmd/guru
	[ -d dist/linux/workspace/bin/linux_amd64 ] && mv dist/linux/workspace/bin/linux_amd64/* dist/linux/workspace/bin/ || echo 'os arch'
	[ -d dist/linux/workspace/bin/linux_amd64 ] && rm -rf dist/linux/workspace/bin/linux_amd64 || echo 'os arch'
	@echo ******************
	@echo prepare archive
	@echo ******************
	cd dist/linux; zip -r ../handsongo-linux.zip *
	cd ../..

docker:
	mkdir -p dist/docker
	@echo ******************
	@echo get docker immages
	@echo ******************
	docker pull golang:1.6-wheezy
	docker pull mongo:3.2
	@echo ******************
	@echo save docker image
	@echo ******************
	docker save --output dist/docker/image-golang.tar golang:1.6-wheezy
	docker save --output dist/docker/image-mongo.tar mongo:3.2
	@echo ******************
	@echo prepare documentation
	@echo ******************
	cp docker/* dist/docker/
	@echo ******************
	@echo prepare archive
	@echo ******************
	cd dist/docker; zip -r ../handsongo-docker.zip *
	cd ../..

.PHONY: win macos linux dist docker
