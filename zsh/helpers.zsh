

upload-plex () {
	rsync -av --progress $1 duke@lenovo.local:/Plex/${2:-Movies}
}
