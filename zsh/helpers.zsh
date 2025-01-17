

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

clean-projects () {
	fd -td -u '(target|node_modules|.next|.venv)$' -x echo \; -x rm -rf {}
}

# To create the encrypted file: `gpg --symmetric --cipher-algo AES256 ~/.secret.env && rm ~/.secret.env`
load-secret-env () {
	gpg --decrypt ~/.secret.env.gpg > ~/.secret.env
	source ~/.secret.env
	rm ~/.secret.env
}
