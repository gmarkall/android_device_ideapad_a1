#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, device/lenovo/A107/full_A107.mk)

PRODUCT_RELEASE_NAME := IdeaPadA1
TARGET_BOOTANIMATION_NAME := vertical-540x960

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=A107 BUILD_ID=IMM76I BUILD_DISPLAY_ID=IMM76I BUILD_FINGERPRINT="lenovo/lenovo_A107/A107:4.0.4/IMM76I/228551:user/release-keys" PRIVATE_BUILD_DESC="A107-user 4.0.4 IMM76I 228551 release-keys"

PRODUCT_NAME := cm_A107
PRODUCT_DEVICE := A107