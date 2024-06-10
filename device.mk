#
# Copyright (C) 2022 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \
    hardware/qcom-caf/bootctrl

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc

# Casefolding
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Props for a Successful Casefold Format 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.metadata.method=dm-default-key \
    ro.crypto.volume.options=::v2 

# Display
TARGET_SCREEN_HEIGHT := 1560
TARGET_SCREEN_WIDTH := 720

PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display
    
# SHIPPING API
PRODUCT_SHIPPING_API_LEVEL := 30

# Assert
TARGET_OTA_ASSERT_DEVICE := laurel_sprout

# BootHal
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service \
    bootctrl.trinket \
    bootctrl.trinket.recovery

PRODUCT_PACKAGES += \
    libgptutils.trinket

PRODUCT_PACKAGES_DEBUG += \
    bootctl \
    update_engine_client

PRODUCT_PACKAGES += \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# Default FS type
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# Crypto
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# EROFS-utils
PRODUCT_PACKAGES += \
    erofs-utils

# Fastbootd
TW_INCLUDE_FASTBOOTD := true
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd 

# Recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libxml2 \
	vendor.display.config@1.0 \
	vendor.display.config@2.0 \
	libdisplayconfig.qti

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so

# Vibrator
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
