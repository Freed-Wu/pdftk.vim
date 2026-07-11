pdftk.vim
=========

A vim wrapper of [ericmason/pdftk]. Edit metadata (e.g. author, title, etc)
and bookmarks of pdf by vim.

[中文文档]

Usage
-----

### pdftk

In shell,

```{.sh}
vi /the/path/of/test.pdf.txt
```

or in vim,

```{.vim}
:edit /the/path/of/test.pdf.txt
```

### exiftool

```{.sh}
vi /the/path/of/test.jpg.json
```

```json
[{
  "SourceFile": "1.jpg",
  "ExifToolVersion": 13.59,
  "FileName": "1.jpg",
  "Directory": ".",
  "FileSize": "101 kB",
  "FileModifyDate": "2026:06:12 15:56:06+08:00",
  "FileAccessDate": "2026:06:12 16:00:44+08:00",
  "FileInodeChangeDate": "2026:06:12 16:00:23+08:00",
  "FilePermissions": "-rw-r--r--",
  "FileType": "JPEG",
  "FileTypeExtension": "jpg",
  "MIMEType": "image/jpeg",
  "JFIFVersion": 1.01,
  "ExifByteOrder": "Big-endian (Motorola, MM)",
  "XResolution": 1,
  "YResolution": 1,
  "ResolutionUnit": "None",
  "YCbCrPositioning": "Centered",
  "ImageWidth": 776,
  "ImageHeight": 1024,
  "EncodingProcess": "Baseline DCT, Huffman coding",
  "BitsPerSample": 8,
  "ColorComponents": 3,
  "YCbCrSubSampling": "YCbCr4:2:0 (2 2)",
  "ImageSize": "776x1024",
  "Megapixels": 0.795
}]
```

Edit metainformation:

```json
[{
  "XResolution": 2,
  "YResolution": 2,
  "ResolutionUnit": "cm"
}]
```

```vim
:wq
```

Dependent
---------

1.  A distribution of vim. Such as [vim/vim].
2.  [ericmason/pdftk].
3.  [exiftool](https://github.com/exiftool/exiftool).

Install
-------

### Package manager

Such as [Shougo/dein.vim], Add the following code to your vimrc.

``` {.vim}
call dein#add('Vim-cn/pdftk.vim')
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
git clone https://github.com/Vim-cn/pdftk.vim /path/to/save/this/package
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

  [中文文档]: https://www.zhihu.com/question/392666875/answer/2011984218587149341
  [vim/vim]: https://github.com/vim/vim
  [ericmason/pdftk]: https://github.com/ericmason/pdftk
  [Shougo/dein.vim]: https://github.com/Shougo/dein.vim
  [wsdjeg/dein-ui.vim]: https://github.com/wsdjeg/dein-ui.vim
  [haya14busa/dein-command.vim]: https://github.com/haya14busa/dein-command.vim
  [doc/pdftk.txt]: doc/pdftk.txt
  [Issues]: https://github.com/Vim-cn/pdftk.vim/issues
