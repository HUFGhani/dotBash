#!/bin/bash

if [ ! -f ~/.bash_profile   ]; then
	echo "File not found! Creating it now"
	ls -s ~/.bash/bash_profile ~/.bash_profile
	ls -ln ~/.bash_profile

else
	echo "remove it and creating it"
	rm ~/.bash_profile
	ls -s ~/.bash/bash_profile ~/.bash_profile
	ls -ln ~/.bash_profile
fi
