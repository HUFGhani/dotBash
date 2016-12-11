#!/bin/bash

if [ ! -f ~/.bash_profile   ]; then
	echo "File not found! Creating it now"
	
	ln -s ~/.bash/bash_profile ~/.bash_profile
	ls -ln ~/.bash_profile
	
	ln -s ~/.bash/gitconfig ~/.gitconfig
	ls -ln ~/.gitconfig
	
	ln -s ~/.bash/gitignore_global ~/.gitignore_global
	ls -n ~/.gitignore_global
else
	echo "remove it and creating it"
	
	rm ~/.bash_profile
	ln -s ~/.bash/bash_profile ~/.bash_profile
	ls -ln ~/.bash_profile
        
	rm ~/.gitconfig
	ln -s ~/.bash/gitconfig ~/.gitconfig
	ls -ln ~/.gitconfig

	rm ~/.gitignore_global
	ln -s ~/.bash/gitignore_global ~/.gitignore_global
	ls -n ~/.gitignore_global
fi
