# inherit from the proprietary version
-include vendor/lenovo/a1/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_BOOTLOADER_BOARD_NAME := a1

BOARD_KERNEL_CMDLINE := no_console_suspend=1 msmsdcc_sdioirq=1 wire.search_count=5
BOARD_KERNEL_BASE := 0x80008000
BOARD_PAGE_SIZE := 0x00000800

BOARD_RECOVERY_IGNORE_BOOTABLES := true

BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/lenovo/a1/recovery/recovery_ui.c

# fix this up by examining /proc/mtd on a running device
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00480000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x08c60000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_PREBUILT_KERNEL := device/lenovo/a1/kernel

BOARD_HAS_NO_SELECT_BUTTON := true
# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true

BOARD_USES_UBOOT := true
