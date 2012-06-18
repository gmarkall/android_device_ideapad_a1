#
# Copyright (C) 2012 gmarkall, milaq
#
# GooManager specific stuff
#

PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.developerid=milaq \
        ro.goo.rom=cm9_a107 \
        ro.goo.version=$(shell date +%s)

# include goo manager
PRODUCT_COPY_FILES += \
       device/lenovo/a107/prebuilt/GooManager.apk:system/app/GooManager.apk
