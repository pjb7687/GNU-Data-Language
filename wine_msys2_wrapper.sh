#!/bin/sh

WINEDEBUG=fixme-all wineconsole --backend=curses $MSYS_ROOT/usr/bin/bash.exe -l -c "$@" | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g'
