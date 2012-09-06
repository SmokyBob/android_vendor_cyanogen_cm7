# Inherit AOSP device configuration for janice.
$(call inherit-product, device/samsung/janice/full_janice.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_janice
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := janice
PRODUCT_MODEL := GT-I9070
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I9070 TARGET_DEVICE=GT-I9070 BUILD_ID=GRJ22 BUILD_FINGERPRINT=samsung/GT-I9070/GT-I9070:2.3.7/GINGERBREAD/XXLD1:user/release-keys PRIVATE_BUILD_DESC="GT-I9070-user 2.3.7 GINGERBREAD XXLD1 release-keys"

# Extra captivate overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/janice

# Add FM and Torch Apps
PRODUCT_PACKAGES += \
    Torch \
    FM

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

# Add additional mounts
PRODUCT_PROPERTY_OVERRIDES += \
    ro.additionalmounts=/mnt/emmc;/mnt/usbdisk \
    ro.vold.switchablepair=/mnt/sdcard,/mnt/emmc

# Release name and versioning
PRODUCT_RELEASE_NAME := Janice
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk

#
# Copy captivate specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
