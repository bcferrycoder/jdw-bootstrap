# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# turn of PROMPT_COMMAND, not needed and messes up emacs shell
PROMPT_COMMAND=''


# User specific aliases and functions

# aliases
if [ -f ~/.alias ]; then
	. ~/.alias
fi

#PS1="`hostname`$ "
PS1="jdw-docker$ "
#echo -e "\033];`hostname`\\007"

function docker_run { sudo docker run -i -t -p ":$2" "jdw/$1" /bin/bash --login; }
