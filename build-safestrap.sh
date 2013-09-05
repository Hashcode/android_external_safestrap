#!/usr/bin/env bash
cd $OUT/../../../../external/safestrap
mkdir -p $OUT/recovery/root/sbin
mkdir -p $OUT/APP
mkdir -p $OUT/2nd-init-files
mkdir -p $OUT/install-files/etc/safestrap/res/
cp -fr ./sbin/* $OUT/recovery/root/sbin/
cp -fr ./2nd-init-files/* $OUT/2nd-init-files/
cp -fr ./res/* $OUT/install-files/etc/safestrap/res/
cd $OUT/../../../../bootable/recovery/safestrap-common/devices/motorola_msm8960-common
cp -fr ./recovery-check.sh $OUT/APP/
cp -fr ./recovery-install.sh $OUT/APP/
cp -fr ./recovery-uninstall.sh $OUT/APP/
cp -fr ./recovery-reboot.sh $OUT/APP/
cp -fr ./hijack $OUT/install-files/etc/init.qcom.modem_links.sh
cp -fr ./backup-ss.sh $OUT/recovery/root/sbin/backup-ss.sh
cp -fr ./restore-ss.sh $OUT/recovery/root/sbin/restore-ss.sh
cd ../../../gui
