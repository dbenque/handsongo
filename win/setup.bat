setx /M GOPATH %~dp0workspace

setx /M GOROOT %~dp0apps\go

setx /M PATH "%~dp0workspace\bin;%~dp0apps\go\bin;%~dp0apps\VSCode\;%PATH%"

pause
