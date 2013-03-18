#!/usr/bin/env bash
cd $OUT
rm APP/install-files.zip
rm install-files/etc/safestrap/2nd-init.zip
zip -9rj install-files/etc/safestrap/2nd-init 2nd-init-files/*
cp $OUT/system/bin/updater $OUT/recovery/root/sbin/update-binary
cp $OUT/ramdisk-recovery.img $OUT/install-files/etc/safestrap/kexec
zip -9r APP/install-files install-files

