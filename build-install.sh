#!/usr/bin/env bash
cd $OUT
rm $OUT/APP/install-files.zip
rm $OUT/install-files/etc/safestrap/2nd-init.zip
zip -9rj install-files/etc/safestrap/2nd-init 2nd-init-files/*
cd $OUT/recovery/root
# clean up for 2nd-init
rm -rf data
rm -rf dev
rm -rf proc
rm -rf sys
rm -rf system
rm -rf supersu
rm -rf tmp
touch ./init.mapphone_cdma.rc
touch ./init.mapphone_umts.rc
# we're using a real taskset binary
rm -rf sbin/taskset
cp $OUT/../../../../bootable/recovery/safestrap-common/devices/motorola_omap4-common/init.rc ./init.rc
cp $OUT/../../../../external/safestrap/twrp.fstab ./etc/twrp.fstab
rm $OUT/install-files/etc/safestrap/ramdisk-recovery.img
mkbootfs $OUT/recovery/root | minigzip > $OUT/install-files/etc/safestrap/ramdisk-recovery.img
cd $OUT
rm install-files/etc/safestrap/2nd-init.zip
zip -9rj install-files/etc/safestrap/2nd-init 2nd-init-files/*
rm APP/install-files.zip
zip -9r APP/install-files install-files

