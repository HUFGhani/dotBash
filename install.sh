#!/bin/bash

if [ ! -f ~/.bash_profile   ]; then
	echo "File not found! Creating it now"
	ln -s ~/.bash/bash_profile ~/.bash_profile
	ls -ln ~/.bash_profile
	ln -s ~/.bash/gitconfig ~/.gitconfig
	ls -ln ~/.gitconfig
else
	echo "remove it and creating it"
	rm ~/.bash_profile
	ln -s ~/.bash/bash_profile ~/.bash_profile
	ls -ln ~/.bash_profile
        rm ~/.gitconfig
	ln -s ~/.bash/gitconfig ~/.gitconfig
	ls -ln ~/.gitconfig
fi
