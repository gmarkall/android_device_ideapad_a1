# inherit from the proprietary version
-include vendor/lenovo/a107/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_BOOTLOADER_BOARD_NAME := a107

BOARD_KERNEL_CMDLINE := no_console_suspend=1 msmsdcc_sdioirq=1 wire.search_count=5
BOARD_KERNEL_BASE := 0x80008000
BOARD_PAGE_SIZE := 0x00000800

BOARD_RECOVERYIMAGE_PARTITION_SIZE := 4718592 # 0x00480000
BOARD_SYSTEMIMAGE_PARTITION_SIZE :=    299999232 # 0x08c60000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1999998976 # 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072 # check this

TARGET_PREBUILT_KERNEL := device/lenovo/a107/prebuilt/kernel

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_STA_PATH     := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_AP_PATH      := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "iface_name=wlan firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/vendor/firmware/nvram.txt"
WIFI_DRIVER_MODULE_NAME     := "dhd"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p5
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/mmcblk0p5
BOARD_VOLD_MAX_PARTITIONS := 5
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun0"

BOARD_USES_UBOOT := true
BOARD_HAS_LARGE_FILESYSTEM := true
#BOARD_RECOVERY_IGNORE_BOOTABLES := true
#BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/lenovo/a107/recovery/recovery_ui.c
TARGET_RECOVERY_PRE_COMMAND := "echo 2 > /proc/upgrade_mem/update_flag"

# Modem
TARGET_NO_RADIOIMAGE := true

# HW Graphics
#OMAP3_GL := true
#USE_OPENGL_RENDERER := true
#COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS

# Workaround for eglconfig error
BOARD_NO_RGBX_8888 := true

# Camera
USE_CAMERA_STUB := false
ifeq ($(USE_CAMERA_STUB),false)
BOARD_CAMERA_LIBRARIES := libcamera
#BOARD_USES_TI_CAMERA_HAL := true
#BOARD_OMAP3_WITH_FFC := true
#BOARD_USES_OVERLAY := true
#BOARD_V4L2_DEVICE := /dev/video1
endif

# Vibrator
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/lenovo/a107/vibrator.c

BOARD_USES_AUDIO_LEGACY := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true
ALSA_DEFAULT_SAMPLE_RATE := 44100
BOARD_USES_TI_OMAP_MODEM_AUDIO := false
BOARD_HAS_NO_MISC_PARTITION := true

#HARDWARE_OMX := true
#BUILD_WITH_TI_AUDIO := 1
#BUILD_PV_VIDEO_ENCODERS := 1
#BUILD_WITHOUT_PV := true

BOARD_EGL_CFG := device/lenovo/a107/prebuilt/egl.cfg

# override overlay buffers
COMMON_GLOBAL_CFLAGS += -DOVERLAY_NUM_REQBUFFERS=6

OMAP_ENHANCEMENT := true
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP3

ifdef HARDWARE_OMX
OMX_JPEG := true
OMX_VENDOR := ti
OMX_VENDOR_INCLUDES := \
  hardware/ti/omx/system/src/openmax_il/omx_core/inc \
  hardware/ti/omx/image/src/openmax_il/jpeg_enc/inc
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
endif

BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_USES_SECURE_SERVICES := true

#adb has root
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

BOARD_CUSTOM_BOOTIMG_MK := device/lenovo/a107/releasetools/uboot-bootimg.mk
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/lenovo/a107/releasetools/a107_img_from_target_files
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/lenovo/a107/releasetools/a107_ota_from_target_files
