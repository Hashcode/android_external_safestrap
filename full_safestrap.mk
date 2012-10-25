# Copyright (C) 2012 The Android Open Source Project

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

DEVICE_FOLDER := device/generic/recovery

# high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PACKAGES += \
    updater \

PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/default.prop:$(TARGET_RECOVERY_OUT)/root/default.prop

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, device/generic/recovery-common/common.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_recovery
PRODUCT_DEVICE := recovery
PRODUCT_BRAND := generic
PRODUCT_MODEL := Generic QHD
