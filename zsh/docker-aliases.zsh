
function dnames-fn {
	for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
	do
    	docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
	done
}

function dipall-fn {
	echo "IP addresses of all named running containers"

	for DOC in `dnames-fn`
	do
  		IP=`docker inspect $DOC | grep -m3 IPAddress | cut -d '"' -f 4 | tr -d "\n"`
  		echo $DOC : $IP
	done
}

function dex-fn {
    docker exec -it $1 /bin/bash
}

function di-fn {
	docker inspect $1
}

alias d='docker $*'
alias dex=dex-fn
alias di=di-fn
alias dim="docker images"
alias dipall=dipall-fn
alias dnames=dnames-fn
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dsa='docker stop $(docker ps -a -q)' # Docker stop all

# docker-compose
alias dc="docker compose"
alias dcu='dc up'
alias dcuf='dc up --force-recreate'
alias dcd='dc down'
alias dcs='dc start'
alias dcr='dc restart'
alias dcst='dc stop'
alias dcb='dc build' # Docker compose build
alias dil='docker image ls' # Docker image list
alias dcl='docker container ls' # Docker container list


alias drmi="docker images | sed 1d | fzf -m --tac | tr -s ' ' | cut -d ' ' -f 3 | xargs docker rmi"
alias drm="docker ps -a | sed 1d | fzf -m --tac | cut -d ' ' -f 1 | xargs docker rm"
alias dkill="docker ps | sed 1d | fzf -m --tac | cut -d ' ' -f 1 | xargs docker kill"
alias dkillall="docker ps -a -q | xargs docker kill -f"
alias drmiall="docker images -q | xargs docker rmi"
