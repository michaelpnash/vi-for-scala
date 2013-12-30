vi-for-scala
============

My VI/VIM and MC setup for developing in Scala

Installation
------------
Install Exuberant Ctags for your OS. For OSX, I use: brew install ctags-exuberant

Copy the ctags-proj.sh script to somewhere on your PATH, like /usr/bin

Copy .vimrc, .vim, .ctags and .config to your $HOME (careful - if you already have stuff there, don't lose it)

Install Midnight Commander (yes, as awesome as it sounds). For OSX: http://louise.hu/poet/?p=6115

To set up a project, go to the project dir and run ctags-proj.sh - it will create your "tags" file, so Ctrl-] and such works in vi for jumping to symbols.

This will also install Ctrl-P, which you should read the doc on.

