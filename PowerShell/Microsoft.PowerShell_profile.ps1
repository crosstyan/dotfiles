using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Import-Module posh-git
Import-Module oh-my-posh

Set-Alias vscode code

# I have emacs in "C:\root\emax64\bin\"
Set-Alias "runemacs" "C:\root\emacs\bin\runemacs.exe"
Set-Alias "emacs" "C:\root\emacs\bin\emacs.exe"

Set-PoshPrompt -Theme zash
Set-PSReadLineOption -EditMode Vi
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

if ($PSVersionTable.PSVersion.Major -gt 6) {
    # I think this need PowerShell 7 to work properly
    Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler {
            if ($args[0] -eq 'Command') {
                # Set the cursor to a blinking block.
                Write-Host -NoNewLine "`e[4 q"
            } else {
                # Set the cursor to a blinking line.
                Write-Host -NoNewLine "`e[5 q"
            }
        }
} else {
    Set-PSReadLineOption -ViModeIndicator Prompt
}