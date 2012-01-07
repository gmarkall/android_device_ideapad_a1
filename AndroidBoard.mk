LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

# FIXME: This doesn't seem to be the way it's done elsewhere
include $(CLEAR_VARS)
LOCAL_MODULE := postrecoveryboot.sh
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
LOCAL_SRC_FILES := recovery/postrecoveryboot.sh
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := mg_cal
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_CLASS := RECOVERY_EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
LOCAL_SRC_FILES := recovery/mg_cal
include $(BUILD_PREBUILT)

# This is how it's done elsewhere, but doesn't seem to do it for me
#file := $(TARGET_RECOVERY_ROOT_OUT)/sbin/postrecoveryboot.sh
#ALL_PREBUILT += $(file)
#$(file) : $(LOCAL_PATH)/recovery/postrecoveryboot.sh | $(ACP)
#        $(transform-prebuilt-to-target)

# include the non-open-source counterpart to this file
-include vendor/lenovo/a1/AndroidBoardVendor.mk
