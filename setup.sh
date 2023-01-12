#!/bin/bash

        BASE_DIR=/etc/mariadb/audit_config
        CONFIGNAME=deploy.conf
        CONFIGFILE=$BASE_DIR/$CONFIGNAME

       echo "Checking needed Dependencies. already installed will be skipped, needed will be installed."

        if [ "$(which curl 2>/dev/null)" = "" ]
	then
		echo "This script requires the curl package. Please install it."
		exit 1
	fi

        if [ "$(which ansible 2>/dev/null)" = "" ]
        then
                echo "This Tool requires ansible. Please install it."
                exit 1
        fi

        if [ "$(which git 2>/dev/null)" = "" ]
        then
                echo "This Tool requires GIT. Please install it."
                exit 1
        fi

        if [ "$(which ansible 2>/dev/null)" != "" ]
        then
               echo "Installing needed collection"
               #TODO: import local package
                ansible-galaxy collection install community.general
        fi

exit 0


