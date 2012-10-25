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
    $(DEVICE_FOLDER)/sbin/fixboot.sh:$(TARGET_RECOVERY_OUT)/root/../2nd-init-files/fixboot.sh \

# Safestrapmenu
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/res/background-blank.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-blank.png \
    $(DEVICE_FOLDER)/res/background-nonsafe.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-nonsafe.png \
    $(DEVICE_FOLDER)/res/background-safe.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-safe.png \
    $(DEVICE_FOLDER)/res/splashkeys.atmxt-i2c:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/splashkeys.atmxt-i2c \

# Hijack
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/logwrapper:$(TARGET_RECOVERY_OUT)/root/../install-files/bin/logwrapper

# App files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/app/recovery-check.sh:$(TARGET_RECOVERY_OUT)/root/../APP/recovery-check.sh \
    $(DEVICE_FOLDER)/app/recovery-install.sh:$(TARGET_RECOVERY_OUT)/root/../APP/recovery-install.sh \
    $(DEVICE_FOLDER)/app/recovery-uninstall.sh:$(TARGET_RECOVERY_OUT)/root/../APP/recovery-uninstall.sh \

$(call inherit-product, $(COMMON_FOLDER)/common.mk)

