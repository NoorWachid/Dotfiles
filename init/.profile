# use bashrc when using bash
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# check local binaries
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# default program | path
export CXX=clang++
export EDITOR=vim
export PAGER=less
export BROWSER=firefox
export PG_OF_PATH=/home/noor/sources/openframeworks
