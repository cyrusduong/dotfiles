function grubmk() {
	if [ $EUID != 0 ]; then
		sudo grub-mkconfig -o /boot/grub/grub.cfg
	else
		grub-mkconfig -o /boot/grub/grub.cfg
	fi
}

function pz() {
	tmux has-session -t pzserver 2>/dev/null
	if [ $? != 0 ]; then
		tmux new -s pzserver ". ~/.steam/steam/steamapps/common/ProjectZomboid/projectzomboid/start-server.sh -servername KeyreapersServer"
	else
		tmux attach -t pzserver
	fi
}

# setup a tmux session just for nc so it doesn't stop when I close it
function nc() {
	tmux has-session -t ncspot 2>/dev/null
	if [ $? != 0 ]; then
		tmux new -s ncspot "ncspot"
	else
		tmux attach -t ncspot
	fi
}
