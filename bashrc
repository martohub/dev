#PS1="\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1;31m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"

export PS1="\[\e[32m\u\] \[\e[36m\h:\] \[\e[33m\w\]\[\e[33m\]\[\e[1m\] $\n\[\e[33m\]"
#########SHORTCUTS
 alias b='bash'
 alias c='cat'
 alias h='history'
 alias r='reboot'
 alias exe='chmod +x '
 
##SERVICES
 alias stat='service --status-all'
 alias ss='systemctl status '
 alias res='systemctl restart '
 alias S='systemctl '

##PROCESSES
 alias p='ps -ef|grep '
 alias threads="ps -AlFH"

##RESOURCE MONITOR
 alias topmem="ps -auxf | sort -nr -k 4 | head -10"
 alias topcpu="ps -auxf | sort -nr -k 3 | head -10"
 alias mon='glances '
 alias ht='htop'

##NET MONITOR
 alias nn="netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n"
  #show active user sessions
 alias netc='netstat ss -ltp'
 alias netdump='netstat ss -stplu'
 alias netst='netstat -ntu'

 alias net4="lsof -Pnl +M -i4"
 alias netp='netstat -tulpn '
 alias ni='lsof -i'

##APT CMD
 alias s='apt search '
 alias i='apt install '
 alias del='apt purge '
 alias u='apt update -y && apt upgrade -y'
 alias z='apt list --installed '
 alias ar='apt autoremove '

##DOCKER
 alias d='docker'
 alias dls="docker container ls"
 alias dockerip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "
 alias di='docker inspect '
 alias dl='docker logs '
 alias dr='docker container restart'
 alias de='docker exec -it '
 alias jenkins='docker container exec -it jenkins-blueocean bash'
 alias dd='docker container exec -it jenkins-docker bash'

##PROGRAMS
 alias tm='tmuxinator'

##CONFIG
 alias rdp="update-alternatives --config x-session-manager"
 alias rmconfig="dpkg -l | grep '^rc' | awk '{print $2}' | xargs sudo apt-get purge"

##SEARCH
 alias g='mkalias_g'
 function mkalias_g(){ grep -i $@; }
 alias hg='history | grep '
 

##DIR NAVI
 eval "`dircolors`"
 alias .='cd ..'
 alias ..='cd ../..'
 alias l.='ls -da .* --color=auto'
##FILE LIST
 alias l='ls --color=auto -rthF'
 alias ll='ls --color=auto -lArth'
 alias la='ncdu'


# Some more alias to avoid making mistakes:
 alias rm='rm -i'
 alias cp='cp -i'
 alias mv='mv -i'

###****LEGACY****###
###****LEGACY****###
 #export PS1="\[\e[32m\u\] \[\e[36m\H:\] \[\e[33m\w\]\[\e[33m\]\[\e[1m\] $\n\[\e[33m\]"
 #export PS1="\[\e[32m\u\] \[\e[36m\H:\] \[\e[33m\w\]\[\e[33m\]\[\e[1m\] $\n\[\e[33m\]"
 # ~/.bashrc: executed by bash(1) for non-login shells.
 # Note: PS1 and umask are already set in /etc/profile. You should not
 # need this unless you want different defaults for root.
 # PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
 # umask 022
 #export PS1="\[\e[32m\u\] \[\e[36m\H:\] \[\e[33m\w\]\[\e[33m\]\[\e[1m\] $\n\[\e[33m\]"
 # You may uncomment the following lines if you want `ls' to be colorized:
 #export PS1="\[\e[32m\u\]╺─╸\[\e[36m\H:\] \[\e[33m\w\]\[\e[36m\] $\n\[\e[32m\]"
 #export PS1="\[\033[1;30m\]» \[\e[0;33m\]mbp\[\033[1;30m\]╺─╸\[\033[1;30m\][\[\033[0m\]\W\[\033[1;30m\ ]]\[\033[1;34m\]:\[\033[0m\] "
 #export PS1="\n\[\033[1;34m\]\342\226\210\342\226\210 \u @ $SERVER_NAME""$BBlue"" \w""$Color_Off  \n\[\033[0;36m\]\342\226\210\342\226\210 \d \t $ \[\033[0;39m\]"
 #alias enable_ipv6='sed -i "/net.ipv6.conf.all.disable_ipv6.*/d" /etc/sysctl.conf && sysctl -q -p && echo 0 > /proc/sys/net/ipv6/conf/all/disable_ipv6 && sed -i "s/#//" /etc/netplan/01-netcfg.yaml && netplan generate && netplan apply'
 # alias ls='ls $LS_OPTIONS'
 # alias l='ls $LS_OPTIONS -lA'
 #export LS_OPTIONS='--color=auto'
#export PS1="\[\e[32m\u\] \[\e[36m\h\] \[\e[33w\]\[\e[1m\]$ \n\[\e[0m\]"
 function aa ()
{
   local colors=`tput colors 2>/dev/null||echo -n 1` C=;

   if [[ $colors -ge 256 ]]; then
      C="`tput setaf 33 2>/dev/null`";
      AA_P='mf=x mt=x n=0; while [[ $n < 1 ]];do read a mt a; read a mf a; (( n++ )); done</proc/meminfo; export AA_PP="\033[38;5;2m"$((mf/1024))/"\033[38;5;89m"$((mt/1024))MB; unset -v mf mt n a';
   else
      C="`tput setaf 4 2>/dev/null`";
      AA_P='mf=x mt=x n=0; while [[ $n < 1 ]];do read a mt a; read a mf a; (( n++ )); done</proc/meminfo; export AA_PP="\033[92m"$((mf/1024))/"\033[32m"$((mt/1024))MB; unset -v mf mt n a';
   fi;

   eval $AA_P; 

   PROMPT_COMMAND='stty echo; history -a; echo -en "\e[34h\e[?25h"; (($SECONDS % 2==0 )) && eval $AA_P; echo -en "$AA_PP";';
   SSH_TTY=${SSH_TTY:-`tty 2>/dev/null||readlink /proc/$$/fd/0 2>/dev/null`}

   PS1="\[\e[m\n\e[1;30m\][\$\$:\$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][${C}\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY/\/dev\/} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\]\n\\$ ";

   export PS1 PROMPT_COMMAND SSH_TTY
}






