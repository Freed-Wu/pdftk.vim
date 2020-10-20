pdftk.vim
=========

A vim wrapper of [ericmason/pdftk]. Edit metadata (e.g. author, title, etc)
and bookmarks of pdf by vim. [中文]

Usage
-----

In shell,

```{.sh}
vi -c 'PdftkDump /the/path/of/test.pdf'
```

or in vim,

```{.vim}
PdftkDump /the/path/of/test.pdf
```

Dependent
---------

1.  A distribution of vim. Such as [vim/vim].
2.  [ericmason/pdftk].

Install
-------

### Package manager

Such as [Shougo/dein.vim], Add the following code to your vimrc.

``` {.vim}
call dein#add('Freed-Wu/pdftk.vim')
```

Then type the code in the command line of vim:

``` {.vim}
call dein#install()
```

Or the following, need [wsdjeg/dein-ui.vim].

``` {.vim}
SPInstall
```

Or the following, need [haya14busa/dein-command.vim].

``` {.vim}
Dein install
```

### Manual

Download the package first.

``` {.zsh}
git clone https://github.com/Freed-Wu/pdftk.vim /path/to/save/this/package
```

Add the following code to your vimrc.

``` {.vim}
set runtimepath+=/path/to/save/this/package
```

Customize
---------

See [doc/pdftk.txt]

Or type the code in the command line of vim:

``` {.vim}
help pdftk
```

FAQ
---

See more at [Issues].

  [中文]: https://zhuanlan.zhihu.com/p/216271091
  [vim/vim]: https://github.com/vim/vim
  [ericmason/pdftk]: https://github.com/ericmason/pdftk
  [Shougo/dein.vim]: https://github.com/Shougo/dein.vim
  [wsdjeg/dein-ui.vim]: https://github.com/wsdjeg/dein-ui.vim
  [haya14busa/dein-command.vim]: https://github.com/haya14busa/dein-command.vim
  [doc/pdftk.txt]: doc/pdftk.txt
  [Issues]: https://github.com/Freed-Wu/pdftk.vim/issues
