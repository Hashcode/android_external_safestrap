#!/usr/bin/env bash
cd $OUT
rm install-files/etc/safestrap/2nd-init.zip
zip -9rj install-files/etc/safestrap/2nd-init 2nd-init-files/*
rm APP/install-files.zip
zip -9r APP/install-files install-files

