# Copyright (C) 2012 The Android Open Source Project

DEVICE_FOLDER := device/generic/safestrap

PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/default.prop:$(TARGET_RECOVERY_OUT)/root/default.prop

$(call inherit-product, device/generic/safestrap-common/common.mk)

