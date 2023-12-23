#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#


LOCAL_PATH := device/xiaomi/laurel_sprout

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/bootctrl

# A/B
AB_OTA_PARTITIONS += \
    boot \
    odm \
    system \
    vendor \
    vbmeta \
    dtbo

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-service \
    android.hardware.boot@1.1-impl-qti.recovery \
    bootctrl.trinket.recovery

PRODUCT_PACKAGES += \
    libgptutils.trinket

PRODUCT_PACKAGES_DEBUG += \
    bootctl \
    update_engine_client

# Fastbootd
TW_INCLUDE_FASTBOOTD := true
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

PRODUCT_PROPERTY_OVERRIDES += \
	ro.fastbootd.available=true

# Health Hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl.recovery

PRODUCT_PACKAGES += \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# Retrofit Dynamic Partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true

PRODUCT_PROPERTY_OVERRIDES += \
	ro.boot.dynamic_partitions=true \
	ro.boot.dynamic_partitions_retrofit=true

# crypto
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# additional
TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libnetutils

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/laurel_sprout/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

