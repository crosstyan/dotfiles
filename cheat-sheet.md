# Vim Cheat Sheet
## Jump List 
```
<C + o> - previous
<C + i> - next
:jumps  - open list command
```
## Change List
```
g; - previous
g, - next
:changes  - open list command
```
## Term Mode
```
term
```
## Marks
[Using marks](https://vim.fandom.com/wiki/Using_marks)
```
m{a,z/A-Z} - set a mark
'{a,z/A-Z} - single quote: go to mark
`{a,z/A-Z} - backtick: go to exact position
[' - next line with lowercase mark
]' - previous line with lowercase mark
:marks - list marks
```
### Problem with vim-sneak
```
 sneak#reset(key)                                        sneak#reset()
         Prevents Sneak from hijacking ; and , until the next invocation of
         Sneak. This is useful if you have remapped the Vim built-in f or
         t to another key and you still want to use ; and , for both Sneak
         and your custom "f" mapping.
             https://github.com/justinmk/vim-sneak/issues/114

         For example, to use "a" as your "f":

             nnoremap <expr> a sneak#reset('f')
             nnoremap <expr> A sneak#reset('F')
             xnoremap <expr> a sneak#reset('f')
             xnoremap <expr> A sneak#reset('F')
             onoremap <expr> a sneak#reset('f')
             onoremap <expr> A sneak#reset('F')

             Note: The <expr> modifier is required!
```
The default reset key is "f". But you can't use marks after jumping by vim-sneak. 

Maybe this will be fixed in next version. IDK. 