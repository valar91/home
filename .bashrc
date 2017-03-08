# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions


function prepand_one() {
PRE=$1
SUB=$2
VAR=$3
OLD=${!VAR}
if [ -n "$OLD" ]
then
	eval $VAR=$PRE/$SUB:$OLD
else
	eval $VAR=$PRE/$SUB
fi
}

function prepand() {
PRE=$1
prepand_one $PRE sbin PATH
prepand_one $PRE bin PATH
prepand_one $PRE lib64 LD_LIBRARY_PATH
prepand_one $PRE lib LIBRARY_PATH
prepand_one $PRE include C_INCLUDE_PATH
prepand_one $PRE include CPLUS_INCLUDE_PATH
prepand_one $PRE lib64/pkgconfig PKG_CONFIG_PATH
prepand_one $PRE lib/pkgconfig PKG_CONFIG_PATH
}

export LCY_GCC=$HOME/build/gcc
export LCY_BUILD=$HOME/build
export LCY_USR=$HOME/build/usr
export LCY_LOCAL=$HOME/build/usr/local
export LCY_EACH=$HOME/build/each

prepand $LCY_GCC
prepand $LCY_BUILD
prepand $LCY_USR
prepand $LCY_LOCAL

for each in $LCY_EACH/*
do
	prepand $each
done

export PATH
export LD_LIBRARY_PATH
export LIBRARY_PATH
export C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH
export PKG_CONFIG_PATH

export CONFIG_SITE=$HOME/build/usr/config.site

export CC=`which gcc`
export CXX=`which g++`

export PS1="\n\[\e[0;33m[\e[0;32m\t \e[0;36m\u@\h \e[0;31m\W\e[0;33m]\e[m\]\n\[\e[1;33m\]\$\[\e[m\]"
