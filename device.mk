#
# This is a generic recovery product configuration for a typical QHD OMAP4
#

DEVICE_FOLDER := device/generic/recovery

# high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Release utilities
PRODUCT_PACKAGES += \
    releaseutils-check_kernel \
    releaseutils-finalize_release \
    releaseutils-mke2fs \
    releaseutils-tune2fs \
    libpng \
    fb2png.bin

PRODUCT_PACKAGES += \
    safestrapmenu

PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/root/default.prop:$(TARGET_RECOVERY_OUT)/root/default.prop \
    $(DEVICE_FOLDER)/root/battd:$(TARGET_RECOVERY_OUT)/root/sbin/battd \
    $(DEVICE_FOLDER)/root/bbx:$(TARGET_RECOVERY_OUT)/root/sbin/bbx \
    $(DEVICE_FOLDER)/root/changeslot.sh:$(TARGET_RECOVERY_OUT)/root/sbin/changeslot.sh \
    $(DEVICE_FOLDER)/root/fixboot.sh:$(TARGET_RECOVERY_OUT)/root/sbin/fixboot.sh \
    $(DEVICE_FOLDER)/root/libhardware_legacy.so:$(TARGET_RECOVERY_OUT)/root/sbin/libhardware_legacy.so \
    $(DEVICE_FOLDER)/root/libnetutils.so:$(TARGET_RECOVERY_OUT)/root/sbin/libnetutils.so \
    $(DEVICE_FOLDER)/root/libwpa_client.so:$(TARGET_RECOVERY_OUT)/root/sbin/libwpa_client.so \
    $(DEVICE_FOLDER)/root/update-binary:$(TARGET_RECOVERY_OUT)/root/sbin/update-binary \

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# still need to set english for audio init
PRODUCT_LOCALES += en_US

