#!/bin/sh

#unalias cp

ModulZipFile="/home/mv/Datengrab/android/Projekt/n7/kernel/Modules_tegra"
UpdateZipOrdner="/home/mv/Datengrab/android/Nexus7/Projekt/anykernel_updateZip/tmp"
CurDir=$(pwd)

cp -vft $UpdateZipOrdner/kernel arch/arm/boot/zImage
cp -vft $UpdateZipOrdner/modules/ $ModulZipFile/*.ko

# $ModulZipFile/bcmdhd.ko $ModulZipFile/bfq-iosched.ko $ModulZipFile/cpufreq_ondemand.ko $ModulZipFile/deadline-iosched.ko $ModulZipFile/easycap.ko $ModulZipFile/row-iosched.ko

echo "Zip Name Tag anhängen? "
read "AntwortTag"

if [ $AntwortTag != j ]
   then 
	# Zip erstellen
	cd $UpdateZipOrdner
	zip -9r "n7-L-$(date +%d%m)" META-INF/ init.d/ kernel/ modules/

   else
	echo "Tag? "
	read "Tag"
	cd $UpdateZipOrdner
        zip -9r "n7-L-$(date +%d%m)-$Tag" META-INF/ init.d/ kernel/ modules/
fi

cd $CurDir

#echo "Restore cp alias..."
#alias cp='cp -i'
