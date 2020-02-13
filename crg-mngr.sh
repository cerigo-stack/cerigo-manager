#!/bin/bash
######## useful directories #######
crg_install_dir="/home/$USER/Desktop/crg-install"
crg_sync_dir="$crg_install_dir/syncdata"

####### useful links #######
package_url="https://raw.githubusercontent.com/cerigo-stack/cerigo-manager/master/packages/"
version_url="https://raw.githubusercontent.com/cerigo-stack/cerigo-manager/master/version"

####### main task #######
if [ "$1" != "setup" ]; then
current_version=$(cat $crg_sync_dir/version | head -1) 
fi

####### arguments #######
					##setup##
if [ "$1" == "setup" ]; then
	mkdir $crg_install_dir
	mkdir $crg_sync_dir
	cp $0 $crg_install_dir/$0
	whereiam=$(pwd)
	cd $crg_install_dir
	sudo ln -s $crg_install_dir/$0 /usr/bin/crg-mngra 
	wget $version_url -O $crg_sync_dir/version
	rm $whereiam/$0
	echo "Directories created"
	echo "Installation completed, you can now run the Cerigo Manager with the crg-mngr command"
					##sync##
elif [ "$1" == "sync" ]; then
	wget $version_url -O $crg_sync_dir/version-new
	new_version=$(cat $crg_sync_dir/version-new | head -1)
	if [ "$new_version" == "$current_version" ]; then
		echo "You already have the latest version, $current_version"
	else
		cp $crg_sync_dir/version-new $crg_sync_dir/version
		current_version=$new_version
		echo "Updated to $current_version"

	fi
	rm $crg_sync_dir/version-new
					##install##
elif [ "$1" == "install" ]; then
	if [ "$2" == "" ]; then
		echo "Please specify which package to install"
	else
	package=$(cat $crg_sync_dir/version | grep $2)
		if [ "$package" == "" ]; then
			echo "Package not found"
		else
			##kapote kane implement ask gia yes no
			##epishs gia pollapla me idio onoma
			mkdir $crg_install_dir/temp
			cd $crg_install_dir/temp
			package="$package_url$2.sh"
			wget $package
			chmod +x $2.sh
			./$2.sh $crg_install_dir
			cd ..
			rm -rf temp 
		fi
	fi
else
echo "Argument $1 not recognized"
fi

