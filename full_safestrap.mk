# Copyright (C) 2012 The Android Open Source Project

DEVICE_FOLDER := device/generic/safestrap
COMMON_FOLDER := device/generic/safestrap-common
HIJACK_BIN := setup_fs
#HIJACK_BIN := start_smc.sh

# Only uncomment for testing on 1stgen KFire
#USE_KFIRE_TEST := true
#USE_KFIRE_HD89 := true

PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/default.prop:$(TARGET_RECOVERY_OUT)/root/default.prop \

# Device specific recovery files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/sbin/changeslot.sh:$(TARGET_RECOVERY_OUT)/root/sbin/changeslot.sh \
    $(DEVICE_FOLDER)/sbin/build-fs.sh:$(TARGET_RECOVERY_OUT)/root/sbin/build-fs.sh \
    $(DEVICE_FOLDER)/sbin/fixboot.sh:$(TARGET_RECOVERY_OUT)/root/sbin/fixboot.sh \

# Device specific 2nd-init files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/sbin/fixboot.sh:$(TARGET_RECOVERY_OUT)/root/../2nd-init-files/fixboot.sh \

ifdef USE_KFIRE_TEST
# Safestrapmenu
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/res_1024x600/background-blank.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-blank.png \
    $(DEVICE_FOLDER)/res_1024x600/background-nonsafe.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-nonsafe.png \
    $(DEVICE_FOLDER)/res_1024x600/background-safe.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-safe.png \
    $(DEVICE_FOLDER)/res_1024x600/splashkeys.ilitek_i2c:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/splashkeys.ilitek_i2c \

# App files
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/app/omap4-amazon-$(HIJACK_BIN)/recovery-check.sh:$(TARGET_RECOVERY_OUT)/root/../APP/recovery-check.sh \
    $(COMMON_FOLDER)/app/omap4-amazon-$(HIJACK_BIN)/recovery-install.sh-otter:$(TARGET_RECOVERY_OUT)/root/../APP/recovery-install.sh \
    $(COMMON_FOLDER)/app/omap4-amazon-$(HIJACK_BIN)/recovery-uninstall.sh:$(TARGET_RECOVERY_OUT)/root/../APP/recovery-uninstall.sh
else
ifdef USE_KFIRE_HD89
# Safestrapmenu
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/res_1920x1200/background-blank.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-blank.png \
    $(DEVICE_FOLDER)/res_1920x1200/background-nonsafe.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-nonsafe.png \
    $(DEVICE_FOLDER)/res_1920x1200/background-safe.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-safe.png \
    $(DEVICE_FOLDER)/res_1920x1200/splashkeys.cyttsp4-i2c:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/splashkeys.cyttsp4-i2c \
    $(COMMON_FOLDER)/app/omap4-amazon-$(HIJACK_BIN)/recovery-install.sh-jem:$(TARGET_RECOVERY_OUT)/root/../APP/recovery-install.sh
else
# Safestrapmenu
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/res_1280x800/background-blank.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-blank.png \
    $(DEVICE_FOLDER)/res_1280x800/background-nonsafe.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-nonsafe.png \
    $(DEVICE_FOLDER)/res_1280x800/background-safe.png:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/background-safe.png \
    $(DEVICE_FOLDER)/res_1280x800/splashkeys.AtmelTouch:$(TARGET_RECOVERY_OUT)/root/../install-files/etc/safestrap/res/splashkeys.AtmelTouch \
    $(COMMON_FOLDER)/app/omap4-amazon-$(HIJACK_BIN)/recovery-install.sh-bowser:$(TARGET_RECOVERY_OUT)/root/../APP/recovery-install.sh
endif
# App files
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/app/omap4-amazon-$(HIJACK_BIN)/recovery-check.sh:$(TARGET_RECOVERY_OUT)/root/../APP/recovery-check.sh \
    $(COMMON_FOLDER)/app/omap4-amazon-$(HIJACK_BIN)/recovery-uninstall.sh:$(TARGET_RECOVERY_OUT)/root/../APP/recovery-uninstall.sh
endif


# Choose a Common Hijack
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/hijacks/$(HIJACK_BIN)-kfire:$(TARGET_RECOVERY_OUT)/root/../install-files/bin/$(HIJACK_BIN) \
    $(COMMON_FOLDER)/hijacks/$(HIJACK_BIN)-hijack-kfire:$(TARGET_RECOVERY_OUT)/root/../install-files/bin/$(HIJACK_BIN)-hijack \

$(call inherit-product, $(COMMON_FOLDER)/common.mk)

