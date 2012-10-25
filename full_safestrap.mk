# Copyright (C) 2012 The Android Open Source Project

BOARD_IS_MOTOROLA_DEVICE := true

DEVICE_FOLDER := device/safestrap
COMMON_FOLDER := device/safestrap-common

PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/default.prop:$(TARGET_RECOVERY_OUT)/root/default.prop \
    $(DEVICE_FOLDER)/root/changeslot.sh:$(TARGET_RECOVERY_OUT)/root/sbin/changeslot.sh \
    $(DEVICE_FOLDER)/root/fixboot.sh:$(TARGET_RECOVERY_OUT)/root/sbin/fixboot.sh \

PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/prebuilt/sbin/battd:$(TARGET_RECOVERY_OUT)/root/sbin/battd \
    $(COMMON_FOLDER)/prebuilt/sbin/bbx:$(TARGET_RECOVERY_OUT)/root/sbin/bbx \
    $(COMMON_FOLDER)/prebuilt/sbin/libhardware_legacy.so:$(TARGET_RECOVERY_OUT)/root/sbin/libhardware_legacy.so \
    $(COMMON_FOLDER)/prebuilt/sbin/libnetutils.so:$(TARGET_RECOVERY_OUT)/root/sbin/libnetutils.so \
    $(COMMON_FOLDER)/prebuilt/sbin/libwpa_client.so:$(TARGET_RECOVERY_OUT)/root/sbin/libwpa_client.so \
    $(COMMON_FOLDER)/prebuilt/sbin/update-binary:$(TARGET_RECOVERY_OUT)/root/sbin/update-binary \

$(call inherit-product, device/safestrap-common/common.mk)
