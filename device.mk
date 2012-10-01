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
    releaseutils-tune2fs

PRODUCT_PACKAGES += \
    safestrapmenu

PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/root/default.prop:$(TARGET_RECOVERY_OUT)/root/default.prop

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# still need to set english for audio init
PRODUCT_LOCALES += en_US

