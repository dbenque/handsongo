# Hand's on go tooling setup

## Setup your env on windows

* run `setup.bat`
* start a new command line `cmd` and
  * install Go plugin with `code.exe .\apps\go.vsix`
  * start VSCode with `code.exe workspace\src.github.com\Sfeir\handsongo`

## Use it
* start a new command line `cmd` and
  * go to `workspace/src/github.com/Sfeir/handsongo`
  * run `go.exe build handsongo.go` to build the program

### Warning

The project is currently only linux/macos compliant with a `Makefile`.
