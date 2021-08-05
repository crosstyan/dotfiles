using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Import-Module posh-git
Import-Module oh-my-posh

Set-Alias vscode code

# I have emacs in "C:\root\emax64\bin\"
Set-Alias "runemacs" "C:\root\emax64\bin\runemacs.exe"
Set-Alias "emacs" "C:\root\emax64\bin\emacs.exe"

Set-PSReadLineOption -EditMode vi
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PoshPrompt -Theme zash