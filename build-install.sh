#!/usr/bin/env bash
cd $OUT
rm APP/install-files.zip
rm install-files/etc/safestrap/2nd-init.zip
zip -9rj install-files/etc/safestrap/2nd-init 2nd-init-files/*
cd $OUT/recovery/root
zip -9r $OUT/install-files/etc/safestrap/recovery .
cd $OUT
zip -9r APP/install-files install-files
