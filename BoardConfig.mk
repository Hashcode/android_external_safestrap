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
#BOARD_KERNEL_CMDLINE := ttyO2,115200n8 rootdelay=2 mem=1G init=/init vmalloc=256M vram=32M omapfb.vram=0:20M androidboot.console=ttyO2 androidboot.hardware=bowser
TARGET_BOARD_PLATFORM := omap4
TARGET_BOOTLOADER_BOARD_NAME := bowser
#TARGET_OTA_ASSERT_DEVICE := omap4blazeboard
BOARD_HAS_SDCARD_INTERNAL := true

# Build init which doesn't remount /dev, /proc and /sys for 2nd-init
BOARD_HAS_LOCKED_BOOTLOADER := true

# This needs to be a build.prop
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"

# TWRP/Recovery
TARGET_RECOVERY_INITRC := device/generic/safestrap-common/init/init-kfire.rc
TARGET_PROVIDES_INIT_RC := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
ifdef USE_KFIRE_TEST
DEVICE_RESOLUTION := 1024x600
RECOVERY_TOUCHSCREEN_SWAP_XY := true
RECOVERY_TOUCHSCREEN_FLIP_Y := true
else
DEVICE_RESOLUTION := 800x1280
endif
TW_INTERNAL_STORAGE_PATH := "/datamedia/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_ALWAYS_RMRF := true
TARGET_USERIMAGES_USE_EXT4 := true

