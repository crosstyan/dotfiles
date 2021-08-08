# Dotfiles
Put these files to your `~` or `$HOME`. Included

- `.emacs` and `emacs.org` for Emacs
- `.vimrc` and `.vim` for Vim
- `inputrc`  for GNU/Readline and Bash
- `Microsoft.PowerShell_profile.ps1`  for PowerShell
- VSCode Setting, key binding, snippet and extensions list. 

## VSCode 

`jsonc` format is just `json` with comments. 

[JSON editing in Visual Studio Code](https://code.visualstudio.com/docs/languages/json#_json-with-comments)
### Keep Settings in Sync

#### Windows
You need [gsudo](https://github.com/gerardog/gsudo) as equivalent to `sudo` in Linux. (or Run the command in elevated PowerShell)

These command is for sync from *local* to **git** path. 

```powershell
gsudo New-Item -ItemType SymbolicLink -Path "./VSCode/settings.json" -Target "$env:APPDATA/Code/User/settings.json"
gsudo New-Item -ItemType SymbolicLink -Path "./VSCode/keybindings.json" -Target "$env:APPDATA\Code\User\keybindings.json"
```
#### Linux/OSX
Just use `ln`

### Fonts
```
'Cascadia Code', 'Sarasa Term SC', monospace
```
### Extensions Recommended
- [Vibrancy - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=eyhn.vscode-vibrancy)
- [Find Then Jump - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=tranhl.find-then-jump)
- [Installation | VSpaceCode](https://vspacecode.github.io/docs/)

#### VSpaceCode

- [VSpaceCode](https://vspacecode.github.io/)

You need config something manually in `settings.json`.  

#### How to list extensions
```powershell
code --list-extensions | % { "code --install-extension $_" }
# Out put to a file
code --list-extensions | % { "code --install-extension $_" } | Out-File -FilePath .\VSCode\extension.txt
```

```json
{
    "workspace.colorCustomizations": {
        "findThenJump.textDecorationForeground": "#DDD",
        "findThenJump.textDecorationBackground": "#F00"
    },

    "vim.normalModeKeyBindings": [
        {
            "before":["<leader>","j"],
            "commands":[
                "findThenJump.initiate"
            ]
        }
    ],
}
```

> This extension works by editting VS Code's css file. So, a prompt will appear when installing vscode-vibrancy for the first time or each time VS Code updates. U can click [never show again] to hide it.
## Windows Terminal
Cascadia the font is fucking beautiful! 

You can enable transparent background by `useAcrylic` and `acrylicOpacity` 
```json
{
    "guid": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
    "hidden": false,
    "name": "PowerShell",
    "source": "Windows.Terminal.PowershellCore",
    "acrylicOpacity": 0.7,
    "fontFace" : "Cascadia Code PL",
    "useAcrylic": true
}
```


## Emacs

### Install
#### Windows

If you use Windows, Download the official 64-bit (x86_64) stable builds from the [GNU FTP](https://ftp.gnu.org/gnu/emacs/windows/emacs-27/) and GZip. 

Or you can use this prebuilt 28.05 version. 

- [Gccemacs prebuilt package on Windows 10 : emacs](https://www.reddit.com/r/emacs/comments/n9ts4j/gccemacs_prebuilt_package_on_windows_10/)
- [Actions · kiennq/emacs-build](https://github.com/kiennq/emacs-build/actions)

Put the path of them to PATH environment. 

```powershell
choco install pt zip
```

I'm using [Spacemacs](https://www.spacemacs.org/) Now. 
#### Too many open files
[Creating process pipe: too many open files · Issue #132 · OmniSharp/omnisharp-emacs](https://github.com/OmniSharp/omnisharp-emacs/issues/132)

Just Close it and run emacs again. You'll be fine I think. 

[How to change the registry values in Windows to increase ulimit settings.](https://www.ibm.com/support/pages/node/391361)


### Fonts Recommended
- [microsoft/cascadia-code: This is a fun, new monospaced font that includes programming ligatures and is designed to enhance the modern look and feel of the Windows Terminal.](https://github.com/microsoft/cascadia-code)
- [be5invis/Sarasa-Gothic: Sarasa Gothic / 更纱黑体 / 更紗黑體 / 更紗ゴシック / 사라사 고딕](https://github.com/be5invis/Sarasa-Gothic)
- [adobe-fonts/source-code-pro: Monospaced font family for user interface and coding environments](https://github.com/adobe-fonts/source-code-pro)
- [adobe-fonts/source-han-sans: Source Han Sans | 思源黑体 | 思源黑體 | 思源黑體 香港 | 源ノ角ゴシック | 본고딕](https://github.com/adobe-fonts/source-han-sans)

```
'Cascadia Code', 'Sarasa Term SC', monospace
```


### 中文字体
- [spacemacs中,如何为中英文设置不同的字体? - 知乎](https://www.zhihu.com/question/52693161)

### Init file
- [Where do I put my init file?](https://www.gnu.org/software/emacs/manual/html_node/efaq-w32/Location-of-init-file.html)
- [HOME and Startup Directories on MS-Windows](https://www.gnu.org/software/emacs/manual/html_node/emacs/Windows-HOME.html)
- [Recognized Environment Variables (Windows 10) - Windows Deployment | Microsoft Docs](https://docs.microsoft.com/en-us/windows/deployment/usmt/usmt-recognized-environment-variables)
- [Load Path](https://www.emacswiki.org/emacs/LoadPath)

The default `~` for emacs Windows version is `$APPDATA` which is `C:\Users\username\AppData\Roaming`. But usually I want
the `HOME` to be `C:\Users\username\`

add these to your `C:\Users\username\AppData\Roaming\.emacs`

```lisp
(when (eq system-type 'windows-nt)
  (setenv "Home" "C:\\Users\\cross")) ;; set the path to your HOME path
(load-file "~/.emacs.d/init.el") ;; Load the script in here
;;(load-file "~/.emacs")
```


### Org as config
The code in `emacs.org` will be compiled to `emacs.el`
which will be imported to `.emacs` because of 
`(org-babel-load-file (expand-file-name "~/emacs.org" user-emacs-directory))`

It's kind of cool. 
## Vim

### Installation
```bash
cp -r Vim/{.,}* ~/
```

if you are in Windows (PowerShell)

```powershell
Copy-Item -Recurse -Force  Vim/* ~/
Move-Item ~/.vim ~/vimfiles
```

### Theme
The theme I used is [tomasiser/vim-code-dark: Dark color scheme for Vim and vim-airline, inspired by Dark+ in Visual Studio Code](https://github.com/tomasiser/vim-code-dark)

The color scheme has already included in `.vim/colors`. 

### Plugin
If you wanna use Plugins, you have to install [junegunn/vim-plug: Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug)

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```pwsh
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```

Run this command after you Install `vim-plug`
```
:PlugInstall
```

Plugin used
- 'easymotion/vim-easymotion'
- 'tpope/vim-surround'
- 'tpope/vim-commentary'
- 'justinmk/vim-sneak'
- 'bkad/CamelCaseMotion'


### File Format
- [line breaks - How to convert the ^M linebreak to 'normal' linebreak in a file opened in vim? - Stack Overflow](https://stackoverflow.com/questions/811193/how-to-convert-the-m-linebreak-to-normal-linebreak-in-a-file-opened-in-vim)

IDK why but git said
```bash
warning: LF will be replaced by CRLF in .vim/colors/codedark.vim.
The file will have its original line endings in your working directory
```
If things don't work, try run these in vim. 
```bash
:set fileformat=unix
# or 
:set ff=unix
```
Or this 
```bash
:e ++ff=dos
```
Or this 
```bash
:%s/<Ctrl-V><Ctrl-M>/\r/g
```
Or change it back. I don't exactly know

## Powershell
[about Profiles - PowerShell | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.1)

You need to install [dahlbyk/posh-git: A PowerShell environment for Git](https://github.com/dahlbyk/posh-git) and [Oh My Posh](https://ohmyposh.dev/)
```powershell
Install-Module oh-my-posh -Scope CurrentUser
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
```

### PowerShell 7
Put it to
```powershell
$Home\[My ]Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```
```powershell
cp PowerShell\Microsoft.PowerShell_profile.ps1 $env:Home\Documents\PowerShell\
```

### PowerShell 5 
PowerShell 5 is Windows Default

If there's no `WindowsPowerShell` just `mkdir` it. 
```powershell
cp PowerShell\Microsoft.PowerShell_profile.ps1 $env:Home\Documents\WindowsPowerShell\
```

## Code from
- [vimrc/basic.vim at master · amix/vimrc](https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim)
- [tomasiser/vim-code-dark: Dark color scheme for Vim and vim-airline, inspired by Dark+ in Visual Studio Code](https://github.com/tomasiser/vim-code-dark)
- [m-parashar/emax64: 64-bit Emacs for Windows with ImageMagick 7](https://github.com/m-parashar/emax64)
- [Different bash prompt for different vi editing mode? - Stack Overflow](https://stackoverflow.com/questions/1039713/different-bash-prompt-for-different-vi-editing-mode)