#!/bin/zsh

CMD=$(whence -pm '*' | fzf)

echo $CMD
