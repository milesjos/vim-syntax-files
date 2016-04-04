## Setup Guide by [Steven Kneiser](https://github.com/theshteves)
####Edited by Josh Miles

### SPARC-specific syntax highlighting in Vim  

Let's get started!  If you haven't already, make a **.vim** folder in your home directory:

```shell
mkdir ~/.vim
cd ~/.vim
```

This is where vim will look for any customizations by default.  Next we need a **syntax** folder:

```shell
mkdir syntax
cd syntax
```

This is where vim seeks out custom syntax files and where we'll dump our **sparc.vim**:

```shell
wget --no-check-certificate -O sparc.vim https://raw.githubusercontent.com/milesjos/vim-syntax-files/master/sparc.vim
```

Here we grab the raw_text from a url and store it in the file, **sparc.vim**

Now that we've added our custom syntax file, we can load it in vim whenever we want with a simple:

```vim
set ft=sparc
```

Add these lines to your **~/.vimrc** for automatic syntax highlighting:

```vim
" Enable syntax highlighting
syntax on

" Enable color (in case the server doesn't default to this)
set term=xterm-color

" Automatically load sparc-specific syntax highlighting
autocmd BufRead,BufNewFile *.s set ft=sparc
autocmd FileType asm set ft=sparc
```

Congratulations, you should be all good to go!  The first line simply sets the filetype whenever you open up any **.s** file but this has failed for some users.  For that reason, I included the second line to hopefully catch that exception by simply recognizing the filetype by the language's system name.

## References & Further Reading

* [Original sparc.vim](http://vim.sourceforge.net/scripts/script.php?script_id=635)
  * Changed format to Unix from DOS
  * Fixed numerous highlightings
* [Vim syntax documentation](http://vimdoc.sourceforge.net/htmldoc/syntax.html)
* [Sparc V8 Architecture Manual](http://www.gaisler.com/doc/sparcv8.pdf)
* [Steven Kneiser's introduction to vim](https://github.com/theshteves/vim-workshop)

