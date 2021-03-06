#!/bin/bash

while :
do
clear
cat << "EOF"


EOF

# shopt -s extglob
echo "Systém> Vítej v ImagicalMine!"
echo "Systém> Tento instaler vás provede instalací ImagicalMine na Linux!"
echo
echo "Systém> Vyber 1 možnost:"
echo "Systém>   1) Linux x64(64-bit)"
echo "Systém>   2) Opustit ImagicalMine instalsci"
read -e -p "Systém> Number (e.g. 1): " a </dev/tty
 case "$a" in 
	1 ) z="PHP_7.0.2_x86-64_Linux.tar.gz";;
	2 ) exit 1;;
        * ) echo "Error> Stala se neočekávaná chyba - buď vypršelo 10 sekund nebo nesprávný výběr. Restartujte script, a potom # vyberte znovu."; exit 1;;
 esac

l="install_log/log"
le="install_log/log_errors"
lp="install_log/log_php"
lpe="install_log/log_php_errors"
w="install_log/log_wget"
wp="install_log/log_wget_php"

# if [ "$z" == "x" ];then
#	echo "Error> Stala se neočekávaná chyba - buď vypršelo 10 sekund nebo nesprávný výběr. Restartujte script, a potom # vyberte znovu."
#	exit 1
#else
	mkdir install_log
#        echo >> start.sh
	echo "Systém> Instaluji ImagicalMine..."
	wget https://github.com/iTXTech/Genisys/archive/master.zip >>./$w 2>>./$w
	chmod 777 master.zip >>./$l 2>>./$le
	unzip -o master.zip >>./$l 2>>./$le
	chmod 777 ImagicalMine-master >>./$l 2>>./$le
	cd ImagicalMine-master >>./$l 2>>./$le
	chmod 777 src >>../$l 2>>../$le
	cp -rf src .. >>../$l 2>>../$le
#        cp -rf start.sh .. >>./$l 2>>./$le
	cd .. >>../$l 2>>../$le
	rm -rf ImagicalMine-master >>./$l 2>>./$le
	rm -rf master.zip >>./$l 2>>./$le
        wget --no-check-certificate https://raw.githubusercontent.com/iTXTech/Genisys/master/start.sh >>./$l 2>>./$le
        chmod 777 start.sh >>./$l 2>>./$le
        wget https://ci.itxtech.org/job/Genisys/lastSuccessfulBuild/artifact/artifact/Genisys_Kyrios_82f9e7f.phar >>./$l 2>>./$le
	echo
#	fi
	echo "Systém> Instaluji PHP binární soubory..."
if [ "$z" == "PHP_7.0.2_x86-64_Linux.tar.gz" ];then
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
        read -e -p "Systém> Chcete automaticky restartovat server pokuď spadne? (Y/n):" c </dev/tty
#		read c
		if [ "$c" == "y" ]||[ "$c" == "Y" ]; then
#			echo 'DO_LOOP="yes"' >> start.sh
                sed -i 's/DO_LOOP="no"/DO_LOOP="yes"/' start.sh
		else
#			echo 'DO_LOOP="no"' >> start.sh
                sed -i 's/DO_LOOP="yes"/DO_LOOP="no"/' start.sh
		fi
        
        echo
        echo "Systém> Instalace ImagicalMine dokončena! Použij ./start.sh (nebo ./st*) pro zapnutí ImagicalMine."
        echo "Systém> Preložil a upravil Cecil107"
#        shopt -u extglob
# fi
rm -rf Linux64.sh
exit 0
done
