# Hand's on go tooling setup

## Setup your env on linux

* run `. ./setup.env`
* configure VSCode with `make codeConfigure`
  * install Go plugin
  * configure workspace settings
* start VSCode with `make codeWorkspace`

## Use it
* go to the workspace with `cd workspace/src/github.com/Sfeir/handsongo`
* run `make help` to see help
* run `make` to build the program
* run `make test` to run tests
