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
rm -rf tmp
touch init.mapphone_cdma.rc
touch init.mapphone_umts.rc
cp $ANDROID_BUILD_TOP/device/generic/safestrap/default.prop default.prop
rm $OUT/install-files/etc/safestrap/recovery.zip
zip -9r $OUT/install-files/etc/safestrap/recovery .
mkdir $OUT/install-files/etc/safestrap/rootfs
rm $OUT/install-files/etc/safestrap/rootfs/init
cp $OUT/recovery/root/init $OUT/install-files/etc/safestrap/rootfs/
chmod 755 $OUT/install-files/etc/safestrap/rootfs/init
cp $ANDROID_BUILD_TOP/device/generic/safestrap/init.rc $OUT/install-files/etc/safestrap/rootfs/
cd $OUT
zip -9r APP/install-files install-files

