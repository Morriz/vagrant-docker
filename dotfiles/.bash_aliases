alias ba="vi ~/.bash_aliases"
alias rba=". ~/.bash_aliases"
alias bp="vi ~/.bash_profile"
alias rbp=". ~/.bash_profile"
alias rbr=". ~/.bashrc"
alias vih="sudo vi /etc/hosts"
alias hig="cat ~/.bash_history | grep"
alias ll="ls -als"
alias tf="tail -f -n300"
alias tfs="tail -f -n400 /var/log/syslog.log"
alias ga="git add"
alias gs="git status"
alias gp="git pull"
alias gps="git push"
alias gc="git commit"

# Simple web server
alias sws="sudo python -m SimpleHTTPServer 81"
alias sws2="sudo python -m SimpleHTTPServer 82"

# special dirs
alias cdb="cd /backend"
alias cdf="cd /frontend"
alias cdd="cd /docker"
alias cdv="cd /vagrant"

# docker
alias dp="docker ps"
alias dpa="docker ps -a"
alias di="docker images"
alias drs="docker restart"
alias ds="docker stop"
alias dsa="docker stop \$(docker ps | awk '{if (\$1 !=\"CONTAINER\") print \$1}')"
alias dr="docker rm"
alias dri="docker rmi"
alias dc="docker rm \$(docker ps -notrunc -a -q)"
alias dci="docker rmi \$(docker images | grep \"^<none>\" | awk '{if (\$1 !=\"REPOSITORY\") print \$3}')"

# pub key transfer
alias k="/vagrant/bin/key.sh"

# ssh shortcut
alias s="ssh root@localhost -p"

# maven install without testing
alias m="maven -Dmaven.test.skip=true install"

# tomcat deploy
alias t="curl -T /backend/target/LC7G.war http://deploy:deploy@localhost:8080/manager/text/deploy?path=/ROOT&war=LC7G.war&update=true"