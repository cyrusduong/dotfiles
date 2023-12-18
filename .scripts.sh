function grubmk() {
	if [ $EUID != 0 ]; then
		sudo grub-mkconfig -o /boot/grub/grub.cfg
	else
		grub-mkconfig -o /boot/grub/grub.cfg
	fi
}

function sp() {
	tmux attach -t gspt || tmux new -s gspt
}
