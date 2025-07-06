
---------------------------------------------------
RESCUE ISO (https://github.com/dogeystamp/archlive)
---------------------------------------------------

This is a live rescue disk based on the Arch Linux install disk. The image
includes a graphical interface (the Niri window manager), customized with all
the dotfiles from https://github.com/dogeystamp/dots. The default shell is
fish; vi-mode bindings are enabled. You are automatically logged in as Julius,
who is in the wheel group.

The rest of this file contains FAQ-style tips for using this system.




WM KEYBOARD SHORTCUTS HELP
	Click the life-ring buoy icon in the status bar.


PRIVILEGE ESCALATION
	To escalate privileges, use the run0 command. To get a privileged shell,
	run the command by itself:

		run0

	To escalate a single command, prepend run0. For example, to run whoami:

		run0 whoami

	Sudo is installed, but it is not configured; run0 already works without
	configuration and is included in systemd.


ARCH LINUX WIKI
	The Arch Linux Wiki is available offline as HTML files in the location
	/usr/share/doc/arch-wiki/html/, through the package arch-wiki-docs. For
	convenience, you may open the installation guide using this command:

		Installation_guide

	For other pages on the wiki, you may use the following commands in fish:

		cd /usr/share/doc/arch-wiki/html/en
		xdg-open (fzf)

	Then, you can search for wiki articles by their title.


CONNECT TO NETWORK
	Use `nmcli`. To connect to Wi-Fi, follow these steps.

	- List networks:

		nmcli device wifi list

	- Connect to a network:

		nmcli device wifi connect --ask WIFINAME


UTILITIES
	- Browser:           qutebrowser
	- Media player:      mpv
	- Text editor:       nvim
	- Resource monitor:  btop

	Many utilities from my dotfiles (https://github.com/dogeystamp/dots) are also included.
	To see all packages installed, run

		pacman -Q


EXPAND MEMORY DISK SIZE
	This system is an archiso live disk; all data (including the root
	filesystem) is stored in memory. The size of the root filesystem is limited
	by default, which may cause issues when installing packages. To resize it,
	use the following command:

		mount -o remount,size=SIZE /run/archiso/cowspace


INSTALL PACKAGES WITH PACMAN
	Using pacman requires a network connection. By default, the package index
	is not included on disk, so you can not install packages, or search for
	packages. To download the index, run
		
		pacman -Sy

	then you can use pacman normally.
