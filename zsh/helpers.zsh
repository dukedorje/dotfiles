

upload-plex () {
	rsync -av --progress $1 duke@lenovo.local:/Plex/${2:-Movies}
}

obs-compress () {
	fname=$1
	if [[ $1 != *.mkv ]]; then
		fname=${1%.*}.mkv
	fi
	echo $fname

	ffmpeg -i "$fname" -vf "scale=1280:-2" -c:v libx264 -preset slow -crf 18 -c:a aac -q:a 2 -ar 44100 -ac 1 "${fname%.*}.mp4"
}

wav-compress () {
	fname=$1
	if [[ $1 != *.wav ]]; then
		fname=${1%.*}.wav
	fi
	echo $fname

	ffmpeg -vn -i "$fname" -c:a aac -q:a 2 "${fname%.*}.m4a"
}

opus2m4a() {
    [[ -z "$1" ]] && { echo "Usage: opus2m4a input.opus"; return 1 }
    [[ -f "$1" ]] || { echo "File not found: $1"; return 1 }
    local input="$1"
    local output="${input:r}.m4a"
    ffmpeg -i "$input" -c:a aac_at -q:a 2 "$output"
}


clean-projects () {
	fd -td -u '(target|node_modules|.next|.yarn|.cargo|.venv|dist|web-build|ios|android)$' -x echo \; -x rm -rf {}
}

# To create the encrypted file: `gpg --symmetric --cipher-algo AES256 ~/.secret.env && rm ~/.secret.env`
load-secret-env () {
	gpg --decrypt ~/.secret.env.gpg > ~/.secret.env
	source ~/.secret.env
	rm ~/.secret.env
}
