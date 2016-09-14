all:
	cat README.md

codeConfigure:
	$(shell mkdir -p workspace/src/github.com/Sfeir/handsongo/.vscode/)
	$(shell sed -e 's/ENV_GOROOT/${GOROOT}/' -e 's/ENV_GOPATH/${GOPATH}/' vscode_settings.json > workspace/src/github.com/Sfeir/handsongo/.vscode/settings.json)
	code ./apps/go.vsix

codeWorkspace:
	code workspace/src/github.com/Sfeir/handsongo

goWorkspace:
	cd workspace/src/github.com/Sfeir/handsongo

.PHONY: all codeGoplugin codeWorkspace goWorkspace
