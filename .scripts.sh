function grubmk() {
	if [ $EUID != 0 ]; then
		sudo grub-mkconfig -o /boot/grub/grub.cfg
	else
		grub-mkconfig -o /boot/grub/grub.cfg
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
