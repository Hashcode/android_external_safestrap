# inherit from common
-include device/generic/safestrap-common/BoardConfigCommon.mk

# Processor
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := omap4
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
NEEDS_ARM_ERRATA_754319_754320 := true
TARGET_GLOBAL_CFLAGS += -DNEEDS_ARM_ERRATA_754319_754320

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := mem=512M console=ttyO2,115200n8
TARGET_BOARD_PLATFORM := omap4
TARGET_BOOTLOADER_BOARD_NAME := otter
TARGET_OTA_ASSERT_DEVICE := blaze
BOARD_HAS_SDCARD_INTERNAL := true

# Build init which doesn't remount /dev, /proc and /sys for 2nd-init
BOARD_HAS_LOCKED_BOOTLOADER := true

# This needs to be a build.prop
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"

# TWRP/Recovery
TARGET_RECOVERY_INITRC := device/generic/safestrap-common/init/init-kfire.rc
TARGET_PROVIDES_INIT_RC := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
DEVICE_RESOLUTION := 1024x600
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_ALWAYS_RMRF := true
TARGET_USERIMAGES_USE_EXT4 := true
RECOVERY_TOUCHSCREEN_SWAP_XY := true
RECOVERY_TOUCHSCREEN_FLIP_Y := true

