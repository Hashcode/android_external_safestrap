#TWRP
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
DEVICE_RESOLUTION := 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/datamedia/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "datamedia"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
BOARD_HAS_NO_REAL_SDCARD := true

#HASH: disable CRYPTO for now in recovery
#TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_CRYPTO_SAMSUNG := true
#TW_CRYPTO_FS_TYPE := "ext4"
#TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p29"
#TW_CRYPTO_MNT_POINT := "/data"
#TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,noauto_da_alloc,discard,journal_async_commit,errors=panic wait,check,encryptable=footer"
#TW_CRYPTO_FS_FLAGS := "0x00000406"
#TW_CRYPTO_KEY_LOC := "footer"

TW_BRIGHTNESS_PATH := /sys/class/backlight/panel/brightness
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file

TW_INCLUDE_SPLASHMENU := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TARGET_USERIMAGES_USE_EXT4 := true

# Logging
TWRP_EVENT_LOGGING := true

# Virtual partition size default (in mb)
BOARD_DEFAULT_VIRT_SYSTEM_SIZE := 1024
BOARD_DEFAULT_VIRT_CACHE_SIZE := 300

BOARD_USE_NO_DEVFS_SETUP := true
BOARD_SUPPRESS_EMMC_WIPE := true
HAVE_SELINUX := true
