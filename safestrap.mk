# Copyright (C) 2012 The Android Open Source Project

BOARD_IS_MOTOROLA_DEVICE := true

# Device specific recovery files
PRODUCT_COPY_FILES += \
    $(SS_DEVICE_FOLDER)/build-fs.sh:/root/sbin/build-fs.sh \
    $(SS_DEVICE_FOLDER)/changeslot.sh:/root/sbin/changeslot.sh \
    $(SS_DEVICE_FOLDER)/fixboot.sh:/root/sbin/fixboot.sh \
    $(SS_COMMON_FOLDER)/sbin/bbx:/root/sbin/bbx

# Setup target files
PRODUCT_COPY_FILES += \
    $(OUT)/root/init.target.rc:/root/init.recovery.mapphone_cdma.rc \
    $(OUT)/root/init.target.rc:/root/init.recovery.mapphone_umts.rc

# Device specific 2nd-init files
PRODUCT_COPY_FILES += \
    $(SS_DEVICE_FOLDER)/fixboot-taskset.sh:/root/../2nd-init-files/fixboot.sh \

# Kexec files
PRODUCT_COPY_FILES += \
    $(OUT)/system/etc/kexec/arm_kexec.ko:/root/../install-files/etc/safestrap/kexec/arm_kexec.ko \
    $(OUT)/system/etc/kexec/atags:/root/../install-files/etc/safestrap/kexec/atags \
    $(OUT)/system/etc/kexec/devtree:/root/../install-files/etc/safestrap/kexec/devtree \
    $(OUT)/system/etc/kexec/kexec:/root/../install-files/etc/safestrap/kexec/kexec \
    $(OUT)/system/etc/kexec/kexec.ko:/root/../install-files/etc/safestrap/kexec/kexec.ko \
    $(OUT)/system/etc/kexec/uart.ko:/root/../install-files/etc/safestrap/kexec/uart.ko \
    $(OUT)/kernel:/root/../install-files/etc/safestrap/kexec/kernel \
    $(OUT)/ramdisk-recovery.img:/root/../install-files/etc/safestrap/kexec/ramdisk-recovery.img

# Safestrapmenu
PRODUCT_COPY_FILES += \
    $(SS_DEVICE_FOLDER)/res/background-blank.png:/root/../install-files/etc/safestrap/res/background-blank.png \
    $(SS_DEVICE_FOLDER)/res/background-nonsafe.png:/root/../install-files/etc/safestrap/res/background-nonsafe.png \
    $(SS_DEVICE_FOLDER)/res/background-safe.png:/root/../install-files/etc/safestrap/res/background-safe.png \
    $(SS_DEVICE_FOLDER)/res/splashkeys.atmxt-i2c:/root/../install-files/etc/safestrap/res/splashkeys.atmxt-i2c \
    $(SS_DEVICE_FOLDER)/safestrapmenu:/root/../install-files/etc/safestrap/safestrapmenu

# App files
PRODUCT_COPY_FILES += \
    $(SS_COMMON_FOLDER)/app/omap4-qhd/recovery-check.sh:/root/../APP/recovery-check.sh \
    $(SS_COMMON_FOLDER)/app/omap4-qhd/recovery-install.sh:/root/../APP/recovery-install.sh \
    $(SS_COMMON_FOLDER)/app/omap4-qhd/recovery-uninstall.sh:/root/../APP/recovery-uninstall.sh \

# Choose a Common Hijack
PRODUCT_COPY_FILES += \
    $(SS_COMMON_FOLDER)/hijacks/logwrapper-omap4-qhd-kexec:/root/../install-files/bin/logwrapper

# Choose a Common backup/restore method
PRODUCT_COPY_FILES += \
    $(SS_COMMON_FOLDER)/sbin/logwrapper-backup-ss.sh:/root/sbin/backup-ss.sh \
    $(SS_COMMON_FOLDER)/sbin/logwrapper-restore-ss.sh:/root/sbin/restore-ss.
