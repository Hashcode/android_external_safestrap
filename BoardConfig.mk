# inherit from common
-include device/generic/safestrap-common/BoardConfigCommon.mk

# Custom includes for kernel and frameworks
PRODUCT_VENDOR_KERNEL_HEADERS := device/generic/safestrap/kernel-headers
TARGET_SPECIFIC_HEADER_PATH := device/generic/safestrap/include

# Processor
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := omap4
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon

# Kernel Build
BOARD_KERNEL_CMDLINE := root=/dev/ram0 rw mem=1023M@0x80000000 console=null vram=10300K omapfb.vram=0:8256K,1:4K,2:2040K init=/init ip=off mmcparts=mmcblk1:p7(pds),p8(utags),p14(boot),p15(recovery),p16(cdrom),p17(misc),p18(cid),p19(kpanic),p20(system),p21(cache),p22(preinstall),p23(webtop),p24(userdata),p25(emstorage) mot_sst=1 androidboot.bootloader=0x0A74
BOARD_KERNEL_BASE := 0x80000000
BOARD_PAGE_SIZE := 0x4096
TARGET_KERNEL_SOURCE := kernel/motorola/omap4-kexec-common
TARGET_KERNEL_CONFIG := mapphone_spyder_defconfig

# TWRP
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
DEVICE_RESOLUTION := 540x960
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/sdcard-ext"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard-ext"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_ALWAYS_RMRF := true
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_INITRC := device/generic/safestrap-common/init/init-motorola-battd.rc
BOARD_USE_NEW_LOOPBACK := true
BOARD_DEFAULT_VIRT_SYSTEM_SIZE := 640
BOARD_DEFAULT_VIRT_CACHE_SIZE := 260

# MOTOROLA
TW_CUSTOM_BATTERY_CAPACITY_FIELD := charge_counter

BOARD_USE_MOTOROLA_DEV_ALIAS := true
ifdef BOARD_USE_MOTOROLA_DEV_ALIAS
COMMON_GLOBAL_CFLAGS += -DBOARD_USE_MOTOROLA_DEV_ALIAS
endif

USE_MOTOROLA_CODE := true
ifdef USE_MOTOROLA_CODE
COMMON_GLOBAL_CFLAGS += -DUSE_MOTOROLA_CODE
endif

