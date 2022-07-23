# .bashrc

# User specific aliases and functions

alias rm='rm -i'
#alias cp='cp -i'
alias mv='mv -i'
alias csrbq="rm -f cscope.*; cscope -Rbq"
alias grep='grep --color=auto'
alias gdb='gdb'
alias openenv='source ~/anaconda3/bin/activate'
alias closeenv='source ~/anaconda3/bin/deactivate'

alias apts='cd ~/proj/APTradingSystem'
alias test='cd ~/proj/test'
alias ocg='cd  ~/proj/APTradingSystem/apts/marketlinks/ocg/'
alias ocgt='cd ~/proj/APTradingSystem/apts/tools/ocg/testMarket/'
alias sgxs='cd ~/proj/git/SGXServer/src'
alias sgx='cd  ~/proj/APTradingSystem/apts/marketlinks/sgx/'
alias sgxt='cd ~/proj/APTradingSystem/apts/tools/sgx/testMarket/'
alias cqtest='cd ~/proj/build/apts/services/cq_new/'
alias qt='qtcreator'

alias cba='~/.bin/cba.sh > result 2>&1'
alias linecounter='~/.bin/linecounter.sh'
alias clangf='~/.bin/clangf.sh'
alias clangf1='clang-format-9 -style=file -i '
alias build='cd ~/proj/build/'
alias bin='cd ~/proj/build/depot/apts/bin/'
alias log='cd ~/proj/build/depot/apts/log/'
alias config='cd ~/proj/build/depot/apts/config/'
alias data='cd ~/proj/build/depot/apts/data/'

alias startap='~/proj/build/depot/apts/script/startap.sh'
alias stop='~/proj/build/depot/apts/script/stop.sh'
alias verify='~/proj/build/depot/apts/script/verify.sh'

alias pys='cd ~/proj/APTradingSystem/apts/tools/kleung_client/proto/'
alias sql='cd ~/proj/APTradingSystem/dist/sqlscript/'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

function git_branch {
  branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
  if [ "${branch}" != "" ];then
      if [ "${branch}" = "(no branch)" ];then
          branch="(`git rev-parse --short HEAD`...)"
      fi
      echo " ($branch)"
  fi
}

# 命令行提示
export PS1='[\u@\h \[\033[01;36m\]\W\[\033[01;32m\]$(git_branch)\[\033[00m\]]\$ '

# title显示
if [ "$SSH_CONNECTION" != '' -a "$TERM" != 'linux' ]; then
    declare -a HOSTIP
    HOSTIP=`echo $SSH_CONNECTION |awk '{print $3}'`
    #export PROMPT_COMMAND='echo -ne "\033]0;${USER}@$HOSTIP:[${HOSTNAME%%.*}]:${PWD/#$HOME/~} \007"'
    export PROMPT_COMMAND='echo -ne "\033]0;${USER}@$HOSTIP:${PWD##*/} \007"'

    #USER=$(/usr/bin/id -un)
    #HOSTIP=`echo $SSH_CONNECTION |awk '{print $3}'`
    #TARGETDIR=`echo $(pwd -P) | cut -d '/' -f 4`
    #TARGETDIR=`echo $(pwd -P) | awk '{split($0,a,"[//]");print a[4]}'`
    #export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTIP}:${TARGETDIR}\007"'
    #export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTIP}:${PWD/$HOME/~}\007"'
fi

export PATH=$PATH:~/.bin
#export PATH=$PATH:~/anaconda2/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/proj/APTradingSystem/thirdparty/protobuf/3.11.4/lib

set bell-style none
ulimit -c unlimited

# added by Anaconda3 installer
export PATH="$HOME/anaconda3/bin:$PATH"

if [ -f "$HOME/proj/APTradingSystem/dist/script/setlibpath.sh_bak" ]; then
    source $HOME/proj/APTradingSystem/dist/script/setlibpath.sh_bak
fi

# GOROOT default path
export PATH=$PATH:/usr/local/go/bin
# GOROOT 仅在安装到指定位置时才需要设置
#export GOROOT=$HOME/go
#export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/git/6.824-golabs-2016
# add GOPATH in Path, in order to solve GoInstallBinaries fail
export PATH=$PATH:$GOPATH/bin

# sunclient
# sudo /usr/local/sunlogin/bin/sunloginclient

# openssl
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/home/kctubt/Lib/openssl/1.1.1p/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/home/kctubt/Lib/openssl/1.1.1p/include
export LIBRARY_PATH=$LIBRARY_PATH:/home/kctubt/Lib/openssl/1.1.1p/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/kctubt/Lib/openssl/1.1.1p/lib

# boost
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/home/kctubt/Lib/boost/1.79.0/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/home/kctubt/Lib/boost/1.79.0/include
export LIBRARY_PATH=$LIBRARY_PATH:/home/kctubt/Lib/boost/1.79.0/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/kctubt/Lib/boost/1.79.0/lib

# zmq clib + cpp binding api(header only)
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/home/kctubt/Lib/zeromq/4.3.4/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/home/kctubt/Lib/zeromq/4.3.4/include
export LIBRARY_PATH=$LIBRARY_PATH:/home/kctubt/Lib/zeromq/4.3.4/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/kctubt/Lib/zeromq/4.3.4/lib

# gtest
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/home/kctubt/Lib/gtest/1.12.1/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/home/kctubt/Lib/gtest/1.12.1/include
export LIBRARY_PATH=$LIBRARY_PATH:/home/kctubt/Lib/gtest/1.12.1/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/kctubt/Lib/gtest/1.12.1/lib

