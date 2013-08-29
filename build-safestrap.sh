#!/usr/bin/env bash
cd $OUT/../../../../external/safestrap
mkdir -p $OUT/recovery/root/sbin
mkdir -p $OUT/APP
mkdir -p $OUT/2nd-init-files
mkdir -p $OUT/install-files/bin
mkdir -p $OUT/install-files/etc/safestrap/res/
cp -fr ./sbin/* $OUT/recovery/root/sbin/
cp -fr ./2nd-init-files/* $OUT/2nd-init-files/
cp -fr ./res/* $OUT/install-files/etc/safestrap/res/
cp -fr ./safestrapmenu $OUT/install-files/etc/safestrap/
cd $OUT/../../../../bootable/recovery/safestrap-common
cp -fr ./app/omap4-qhd/* $OUT/APP/
cp -fr ./hijacks/logwrapper-omap4-qhd $OUT/install-files/bin/logwrapper
cp -fr ./sbin/logwrapper-backup-ss.sh $OUT/recovery/root/sbin/backup-ss.sh
cp -fr ./sbin/logwrapper-restore-ss.sh $OUT/recovery/root/sbin/restore-ss.sh
cp -fr ./init/init-motorola-battd.rc $OUT/recovery/root/init.rc
cd ../gui
