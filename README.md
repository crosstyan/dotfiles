# Dotfiles
Put these files to your `~` or `$HOME`. Included

- `.emacs` and `emacs.org` for Emacs
- `.vimrc` and `.vim` for Vim
- `inputrc`  for GNU/Readline and Bash
- `Microsoft.PowerShell_profile.ps1`  for PowerShell

## emacs.org
The code in this file will be compiled to `emacs.el`
which will be imported to =.emacs= because of 
`(org-babel-load-file (expand-file-name "~/emacs.org" user-emacs-directory))`

It's kind of cool. 
## Vim File Format
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

Put it to
```powershell
$Home\[My ]Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```

## Code from
- [vimrc/basic.vim at master · amix/vimrc](https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim)
- [tomasiser/vim-code-dark: Dark color scheme for Vim and vim-airline, inspired by Dark+ in Visual Studio Code](https://github.com/tomasiser/vim-code-dark)
- [m-parashar/emax64: 64-bit Emacs for Windows with ImageMagick 7](https://github.com/m-parashar/emax64)
- [Different bash prompt for different vi editing mode? - Stack Overflow](https://stackoverflow.com/questions/1039713/different-bash-prompt-for-different-vi-editing-mode)