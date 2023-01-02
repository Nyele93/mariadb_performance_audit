#!/bin/bash

        BASE_DIR=/etc/mariadb/audit_config
        CONFIGNAME=deploy.conf
        CONFIGFILE=$BASE_DIR/$CONFIGNAME

        if [ "$(which curl 2>/dev/null)" = "" ]
	then
		echo "This script requires the curl package. Please install it."
		exit 1
	fi

install_tool(){

    cp -u audit_report_performanc audit.yml deploy.conf .token_key $BASE_DIR/
    cp -u -R performance_audit/ $BASE_DIR/

    cp -u audit_report_performance audit.yml deploy.conf .token_key /usr/local/sbin/
    cp -R performance_audit/ /usr/local/sbin
 
   echo "Setup Process completed. please confirm files in $BASE_DIR"
}

build_config()
{
	if [ "$LOGNAME" != "root" ]
	then
		CONFIGFILE=$BASE_DIR/$CONFIGNAME
	else
		[[ ! -d $BASE_DIR ]] && mkdir $BASE_DIR
	fi

	if [ -f $CONFIGFILE ]
	then
		echo "Config file: '$CONFIGFILE' already exists, no overwrite of current config."
        else 
             cp ./$CONFIGNAME $BASE_DIR/$CONFIGNAME
             echo "Created '$CONFIGFILE'. Please adjust it according to your setup."
	fi

           if  [[ ! -f $BASE_DIR/audit_performance ]]
                 then
                   install_tool
            else
                echo "Tool seems to have been installed. Please check Base Directory."
           fi
   
	exit 0
	}

build_config; 

exit 0


