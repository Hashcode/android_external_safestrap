# Copyright (C) 2012 The Android Open Source Project

PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/default.prop:$(TARGET_RECOVERY_OUT)/root/default.prop

$(call inherit-product, device/generic/recovery-common/common.mk)
