if [ -f ~/.profile ]; then
  source ~/.profile
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.tmux.conf ]; then
  tmux source ~/.tmux.conf > /dev/null

  if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    ssh-agent tmux attach -t 0 2> /dev/null
  fi
fi

export PLATFORM=$(uname -s)
if [ "$PLATFORM" = 'Darwin' ]; then
  source ~/.bash_osx
fi

if [ -f ~/.alias ]; then
  source ~/.alias
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/brian/Armory/cocos2d-x-3.13.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/brian/Armory
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/brian/Armory/cocos2d-x-3.13.1/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH
export PATH="/usr/local/opt/e2fsprogs/bin:$PATH"
export PATH="/usr/local/opt/e2fsprogs/sbin:$PATH"
