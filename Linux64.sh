#!/bin/bash
# ImagicalMine Installation Script for Linux(master)
while :
do
clear
cat << "EOF"

EOF

# shopt -s extglob
echo "Genisys> Welcome to Genisys!"
echo "Genisys> This installer will guide you through installing Genisys for your server!"
echo
echo "Genisys> Select which PHP binary you want to install:"
echo "Genisys>   1) Linux x64(64-bit)"
echo "Genisys>   2) Exit Genisys installation"
read -e -p "system> Number (e.g. 1): " a
read -e -p "system> Number (e.g. 1): " a </dev/tty
 case "$a" in 
	1 ) z="Linux";;
	2 ) exit 1;;
        * ) echo "error> An unexpected error occurred - either a 10 second timeout or an unknown selection. Restart the script, and then choose again."; exit 1;;
 esac

l="install_log/log"
le="install_log/log_errors"
lp="install_log/log_php"
lpe="install_log/log_php_errors"
w="install_log/log_wget"
wp="install_log/log_wget_php"

# if [ "$z" == "x" ];then
#	echo "error> An unexpected error occurred - either a 10 second timeout or an unknown selection. Restart the script, and then # choose again."
#	exit 1
#else
	mkdir install_log
#        echo >> start.sh
	echo "Genisys> Installing Genisys..."
	wget https://github.com/iTXTech/Genisys/archive/master.zip >>./$w 2>>./$w
	chmod 777 master.zip >>./$l 2>>./$le
	unzip -o master.zip >>./$l 2>>./$le
	chmod 777 Genisys-master >>./$l 2>>./$le
	cd Genisys-master >>./$l 2>>./$le
	chmod 777 src >>../$l 2>>../$le
	cp -rf src .. >>../$l 2>>../$le
#        cp -rf start.sh .. >>./$l 2>>./$le
	cd .. >>../$l 2>>../$le
	rm -rf Genisys-master >>./$l 2>>./$le
	rm -rf master.zip >>./$l 2>>./$le
        wget --no-check-certificate https://raw.githubusercontent.com/iTXTech/Genisys/master/start.sh >>./$l 2>>./$le
        chmod 777 start.sh >>./$l 2>>./$le
        wget https://jenkins.mcper.cn/job/Genisys-master/393/artifact/artifact/Genisys_1.1dev-393.phar >>./$l 2>>./$le
	echo
#	fi
	echo "Genisys> Installing PHP binary..."
if [ "$z" == "Linux" ];then
wget https://dl.bintray.com/pocketmine/PocketMine/PHP_7.0.3_x86-64_Linux.tar.gz >>./$wp 2>>./$wp
	chmod 777 PHP_7.0.3_x86-64_Linux.tar.gz >>./$lp 2>>./$lpe
	tar zxvf PHP_7.0.3_x86-64_Linux.tar.gz >>./$lp 2>>./$lpe
	rm -r PHP_7.0.3_x86-64_Linux.tar.gz >>./$lp 2>>./$lpe
else
wget https://dl.bintray.com/pocketmine/PocketMine/PHP_7.0.3_x86-64_Linux.tar.gz >>./$wp 2>>./$wp
	chmod 777 PHP_7.0.3_x86-64_Linux.tar.gz >>./$lp 2>>./$lpe
	tar zxvf PHP_7.0.3_x86-64_Linux.tar.gz >>./$lp 2>>./$lpe
	rm -r PHP_7.0.3_x86-64_Linux.tar.gz >>./$lp 2>>./$lpe
fi
	echo
        read -e -p "Genisys> Do you want to auto-restart your server when it stops or crashes? (Y/n):" c </dev/tty
#		read c
		if [ "$c" == "y" ]||[ "$c" == "Y" ]; then
#			echo 'DO_LOOP="yes"' >> start.sh
                sed -i 's/DO_LOOP="no"/DO_LOOP="yes"/' start.sh
		else
#			echo 'DO_LOOP="no"' >> start.sh
                sed -i 's/DO_LOOP="yes"/DO_LOOP="no"/' start.sh
		fi
        
        echo
        echo "system> Genisys installation completed! Run ./start.sh (or ./st*) to start ImagicalMine."
#        shopt -u extglob
# fi
rm -rf Linux64.sh
exit 0
done
