# Copyright (C) 2012 The Android Open Source Project

BOARD_IS_MOTOROLA_DEVICE := true

DEVICE_FOLDER := device/generic/safestrap
COMMON_FOLDER := device/generic/safestrap-common

PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/default.prop:$(TARGET_RECOVERY_OUT)/root/default.prop \

# Device specific recovery files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/sbin/changeslot.sh:$(TARGET_RECOVERY_OUT)/root/sbin/changeslot.sh \
    $(DEVICE_FOLDER)/sbin/fixboot.sh:$(TARGET_RECOVERY_OUT)/root/sbin/fixboot.sh \

# Device specific 2nd-init files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/sbin/fixboot-taskset.sh:$(TARGET_RECOVERY_OUT)/root/../2nd-init-files/fixboot.sh \

# Kexec files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/kexec/arm_kexec.ko:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/kexec/arm_kexec.ko \
    $(DEVICE_FOLDER)/kexec/atags:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/kexec/atags \
    $(DEVICE_FOLDER)/kexec/devtree:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/kexec/devtree \
    $(DEVICE_FOLDER)/kexec/kexec:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/kexec/kexec \
    $(DEVICE_FOLDER)/kexec/kexec.ko:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/kexec/kexec.ko \
    $(DEVICE_FOLDER)/kexec/uart.ko:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/kexec/uart.ko \
    $(DEVICE_FOLDER)/kernel:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/kexec/kernel \

# Safestrapmenu
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/safestrapmenu:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/safestrapmenu \
    $(DEVICE_FOLDER)/res/background-blank.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-blank.png \
    $(DEVICE_FOLDER)/res/background-nonsafe.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-nonsafe.png \
    $(DEVICE_FOLDER)/res/background-safe.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-safe.png \
    $(DEVICE_FOLDER)/res/background-recovery.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-recovery.png \
    $(DEVICE_FOLDER)/res/background-start.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-start.png \
    $(DEVICE_FOLDER)/res/indeterminate1.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/indeterminate1.png \
    $(DEVICE_FOLDER)/res/indeterminate2.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/indeterminate2.png \
    $(DEVICE_FOLDER)/res/indeterminate3.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/indeterminate3.png \
    $(DEVICE_FOLDER)/res/indeterminate4.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/indeterminate4.png \
    $(DEVICE_FOLDER)/res/indeterminate5.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/indeterminate5.png \
    $(DEVICE_FOLDER)/res/indeterminate6.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/indeterminate6.png \
    $(DEVICE_FOLDER)/res/progress_empty.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/progress_empty.png \
    $(DEVICE_FOLDER)/res/progress_fill.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/progress_fill.png \

# App files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/app/recovery-check.sh:$(TARGET_RECOVERY_OUT)/root/../APP/recovery-check.sh \
    $(DEVICE_FOLDER)/app/recovery-install.sh:$(TARGET_RECOVERY_OUT)/root/../APP/recovery-install.sh \
    $(DEVICE_FOLDER)/app/recovery-uninstall.sh:$(TARGET_RECOVERY_OUT)/root/../APP/recovery-uninstall.sh \

# Choose a Common Hijack
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/hijacks/logwrapper-omap4-kexec:$(TARGET_RECOVERY_OUT)/root/../install-files/bin/logwrapper

$(call inherit-product, $(COMMON_FOLDER)/common.mk)

