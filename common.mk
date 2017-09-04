#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL aries devices, and
# are also specific to aries devices
#
# Everything in this directory will become public
# Common QCOM configuration tools
$(call inherit-product, device/qcom/common/Android.mk)

COMMON_PATH := device/xiaomi/msm8960-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_LOCALES := zh_CN

# Apache Hack
PRODUCT_COPY_FILES += \
    prebuilts/sdk/org.apache.http.legacy/org.apache.http.legacy.jar:/system/framework/org.apache.http.legacy.jar

# Ramdisk
PRODUCT_PACKAGES += \
    init.aries.rc  \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    ueventd.aries.rc \
    init.class_main.sh \
    init.qcom.class_core.sh \
    init.qcom.early_boot.sh \
    init.qcom.sh \
    init.qcom.syspart_fixup.sh \
    init.target.rc

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
    $(COMMON_PATH)/rootdir/etc/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
    $(COMMON_PATH)/rootdir/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    $(COMMON_PATH)/rootdir/etc/sec_config:system/etc/sec_config

# Sid Nid Mapping
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/sidnid-conf.xml:system/etc/sidnid-conf.xml

# Charger
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/ramdisk/chargeonlymode:root/sbin/chargeonlymode

# WIFI
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(COMMON_PATH)/rootdir/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(COMMON_PATH)/rootdir/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(COMMON_PATH)/rootdir/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Hostapd
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(COMMON_PATH)/rootdir/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(COMMON_PATH)/rootdir/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Audio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/audio_policy.conf:system/etc/audio_policy.conf

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(COMMON_PATH)/rootdir/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(COMMON_PATH)/rootdir/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_PATH)/rootdir/etc/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

# BT
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    $(COMMON_PATH)/rootdir/etc/init.qcom.btdun.sh:system/etc/init.qcom.btdun.sh

# FM
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh

# Boot
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

# GPS configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/gps.conf:system/etc/gps.conf

# mpdecision configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/thermald-8064.conf:system/etc/thermald-8064.conf \
    $(COMMON_PATH)/rootdir/etc/thermald-8064ab.conf:system/etc/thermald-8064ab.conf \
    $(COMMON_PATH)/rootdir/etc/thermald-8960.conf:system/etc/thermald-8960.conf \
    $(COMMON_PATH)/rootdir/etc/thermald-8960ab.conf:system/etc/thermald-8960ab.conf \
    $(COMMON_PATH)/rootdir/etc/thermal-engine-8064.conf:system/etc/thermal-engine-8064.conf \
    $(COMMON_PATH)/rootdir/etc/thermal-engine-8064ab.conf:system/etc/thermal-engine-8064ab.conf \
    $(COMMON_PATH)/rootdir/etc/thermal-engine-8960.conf:system/etc/thermal-engine-8960.conf

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(COMMON_PATH)/rootdir/keylayout/cyttsp-i2c.kl:system/usr/keylayout/cyttsp-i2c.kl \
    $(COMMON_PATH)/rootdir/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/rootdir/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    $(COMMON_PATH)/rootdir/keylayout/keypad_8960_liquid.kl:system/usr/keylayout/keypad_8960_liquid.kl \
    $(COMMON_PATH)/rootdir/keylayout/philips_remote_ir.kl:system/usr/keylayout/philips_remote_ir.kl \
    $(COMMON_PATH)/rootdir/keylayout/samsung_remote_ir.kl:system/usr/keylayout/samsung_remote_ir.kl \
    $(COMMON_PATH)/rootdir/keylayout/sensor00fn1a.kl:system/usr/keylayout/sensor00fn1a.kl \
    $(COMMON_PATH)/rootdir/keylayout/ue_rf4ce_remote.kl:system/usr/keylayout/ue_rf4ce_remote.kl \
    $(COMMON_PATH)/rootdir/keylayout/ft5x06.kl:system/usr/keylayout/ft5x06.kl

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

# MIDI feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

# Light
PRODUCT_PACKAGES += \
    lights.msm8960 \
    android.hardware.light@2.0-impl

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice=0 \
    ril.subscription.types=RUIM \
    persist.radio.apm_sim_not_pwdn=0 \
    ro.telephony.call_ring.multiple=0

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Wi-Fi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    wlan.driver.ath=0

PRODUCT_PACKAGES += \
    wcnss_service

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so
    com.qc.hardware=true \
    ro.qc.sdk.sensors.gestures=false \
    ro.qc.sensors.wl_dis=true

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    persist.audio.fluence.mode=endfire \
    persist.audio.vr.enable=false \
    persist.audio.handset.mic=digital \
    persist.audio.lowlatency.rec=false \
    ro.qc.sdk.audio.fluencetype=none \
    af.resampler.quality=255 \
    lpa.use-stagefright=true \
    qcom.hw.aac.encoder=true \
    mm.enable.qcom_parser=33395 \
    media.aac_51_output_enabled=true

# BT
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd \
    ro.bluetooth.request.master=true \
    ro.bluetooth.remote.autoconnect=true \
    bluetooth.a2dp.sink.enabled=false

# transmitter isn't supported
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fm.transmitter=false

# netmgrd
PRODUCT_PROPERTY_OVERRIDES += \
    ro.use_data_netmgrd=true \
    persist.data.netmgrd.qos.enable=true \
    persist.rmnet.mux=disabled

# OpenGL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608 \
    debug.egl.recordable.rgba8888=1

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    debug.composition.type=dyn \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0 \
    ro.sf.lcd_density=320

# Power Profile
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.aries.power_profile=middle

# Bluetooth HAL
PRODUCT_PACKAGES += \
    libbt-vendor \
    android.hardware.bluetooth@1.0-impl

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=50

# Gatekeeper HAL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl

#GNSS HAL
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl

# Gps
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qmienabled=true

PRODUCT_PACKAGES += \
    Stk \
    MiSettings \
    FileExplorer \
    Updater

# App
PRODUCT_PACKAGES += \
    Launcher3 \
    busybox \
    CellBroadcastReceiver

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g \
    mkntfs \
    dumpe2fs \
    resize2fs \
    e2fsck_static \
    mke2fs_static \
    resize2fs_static \
    mkfs.f2fs

# QCOM Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer \
    libI420colorconvert \
    hwcomposer.msm8960 \
    gralloc.msm8960 \
    copybit.msm8960 \
    memtrack.msm8960 \
    libemoji \
    libgenlock \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.graphics.composer@2.1-impl

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.broadcastradio@1.0-impl \
    android.hardware.soundtrigger@2.0-impl \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    tinymix

# Camera
PRODUCT_PACKAGES += \
    camera.msm8960 \
    camera.device@3.2-impl \
    android.hardware.camera.provider@2.4-impl

PRODUCT_PACKAGES += \
    libstlport

# Keystore
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# Omx
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libc2dcolorconvert \
    libdashplayer \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libextmedia_jni \
    libOmxVidcCommon \
    libstagefrighthw \
    qcmediaplayer \
    libqcmediaplayer \
    libextmedia_jni \
    android.hardware.drm@1.0-impl
    
# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# fmradio support
PRODUCT_PACKAGES += \
    libfmjni \
    FMRadio

# CodeAurora
PRODUCT_PACKAGES += \
    qcmediaplayer \
    BluetoothExt \
    javax.btobex \
    libattrib_static \
    libQWiFiSoftApCfg \
    libqsap_sdk \
    QualcommSoftAP \
    libgestures \
    gestures.msm8960 \
    libxml2 \
    libcnefeatureconfig \
    services-ext \
    services \
    ethernet-service \
    wifi-service \
    wificond \
    tcmiface

# Qualcomm random numbers generated
PRODUCT_PACKAGES += \
    qrngd

PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf \
    dhcpcd.conf \
    wcnss-service \
    libwifi-hal

PRODUCT_PACKAGES += \
    telresources \
    libexsurfaceflinger

PRODUCT_PACKAGES += \
    AudioFX

PRODUCT_PACKAGES += \
    ExactCalculator \
    messaging

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

# Shims
#PRODUCT_PACKAGES += \
#    libshim_camera

# Snap
PRODUCT_PACKAGES += \
    Snap

# Sensors
PRODUCT_PACKAGES += \
    context_hub.default \
    android.hardware.sensors@1.0-impl \
    android.hardware.contexthub@1.0-impl

# Thermal HAL
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl

# HIDL
PRODUCT_COPY_FILES += \
    device/xiaomi/msm8960-common/manifest.xml:system/vendor/manifest.xml
