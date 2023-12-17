function setfontsize() {
	printf '\33]50;%s\007' xft:TerminessTTF\ Nerd\ Font\ Mono:size=$1
}

function mvscreenshot() {
	mv /tmp/screenshot.png ./$1
}

function nvim() {
	local pipe_path="/home/cduong/.cache/nvim/pipes$PWD"
	echo $pipe_path
	mkdir -p "$pipe_path"
	/usr/bin/nvim --listen "$pipe_path.pipe" $@
}
