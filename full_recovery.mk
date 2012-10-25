# Copyright (C) 2012 The Android Open Source Project

BOARD_IS_MOTOROLA_DEVICE := true

DEVICE_FOLDER := device/generic/safestrap
COMMON_FOLDER := device/generic/safestrap-common

PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/default.prop:$(TARGET_RECOVERY_OUT)/root/default.prop \
    $(DEVICE_FOLDER)/init.rc:$(TARGET_RECOVERY_OUT)/root/init.rc

$(call inherit-product, device/generic/safestrap-common/common.mk)
