# Copyright (C) 2011-2014 The Android-x86 Open Source Project

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := flashrom

LOCAL_C_INCLUDES += \
    external/libusb/libusb

# Build statically linked binaries - change BUILD_SHARED_LIBRARY to BUILD_STATIC_LIBRARY in external/libusb/android/jni/libusb.mk to make this work
LOCAL_FORCE_STATIC_EXECUTABLE := 1
LOCAL_STATIC_LIBRARIES := libusb liblog

# Uncomment this and comment out 2 lines above to build dynamically linked binaries
# LOCAL_SHARED_LIBRARIES := libusb

LOCAL_MODULE_TAGS := optional

# Build 32bit and 64bit binaries
LOCAL_MULTILIB := both

# Buld binaries to bin xbin (32bit) and (64bit)
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_EXECUTABLES)

LOCAL_SRC_FILES := \
    82802ab.c \
    amd_imc.c \
    at45db.c \
    bitbang_spi.c \
    buspirate_spi.c \
    ch341a_spi.c \
    cli_classic.c \
    cli_common.c \
    cli_output.c \
    custom_baud.c \
    dediprog.c \
    developerbox_spi.c \
    digilent_spi.c \
    dummyflasher.c \
    edi.c \
    en29lv640b.c \
    flashchips.c \
    flashrom.c \
    fmap.c \
    helpers.c \
    hwaccess.c \
    i2c_helper_linux.c \
    ich_descriptors.c \
    ichspi.c \
    it85spi.c \
    it87spi.c \
    jedec.c \
    layout.c \
    libflashrom.c \
    linux_mtd.c \
    linux_spi.c \
    mcp6x_spi.c \
    opaque.c \
    physmap.c \
    pickit2_spi.c \
    pony_spi.c \
    print.c \
    programmer.c \
    raiden_debug_spi.c \
    sb600spi.c \
    serial.c \
    serprog.c \
    sfdp.c \
    spi25.c \
    spi25_statusreg.c \
    spi95.c \
    spi.c \
    sst28sf040.c \
    sst49lfxxxc.c \
    sst_fwhub.c \
    stlinkv3_spi.c \
    stm50.c \
    udelay.c \
    usbdev.c \
    usb_device.c \
    w29ee011.c \
    w39.c \
    wbsio_spi.c

LOCAL_CFLAGS += \
    -MMD \
    -Os \
    -Wall \
    -Wextra \
    -Werror \
    -Wmissing-prototypes \
    -Wshadow \
    -Wwrite-strings \
    -Wno-pointer-arith \
    -Wno-unused-parameter \
    -D'CONFIG_BITBANG_SPI=1' \
    -D'CONFIG_BUSPIRATE_SPI=1' \
    -D'CONFIG_CH341A_SPI=1' \
    -D'CONFIG_DEDIPROG=1' \
    -D'CONFIG_DEFAULT_PROGRAMMER_ARGS="''"' \
    -D'CONFIG_DEFAULT_PROGRAMMER=PROGRAMMER_CH341A_SPI' \
    -D'CONFIG_DEVELOPERBOX_SPI=1' \
    -D'CONFIG_DIGILENT_SPI=1' \
    -D'CONFIG_DUMMY=1' \
    -D'CONFIG_I2C_SUPPORT=1' \
    -D'CONFIG_INTERNAL_DMI=1' \
    -D'CONFIG_LINUX_MTD=1' \
    -D'CONFIG_LINUX_SPI=1' \
    -D'CONFIG_PICKIT2_SPI=1' \
    -D'CONFIG_PONY_SPI=1' \
    -D'CONFIG_RAIDEN=1' \
    -D'CONFIG_SERPROG=1' \
    -D'CONFIG_STLINKV3_SPI=1' \
    -D'NEED_RAW_ACCESS=1' \
    -D'NEED_LIBUSB1=1' \
    -D'HAVE_UTSNAME=1' \
    -D'HAVE_CLOCK_GETTIME=1' \
    -D'FLASHROM_VERSION="v1.2-53-gb07c53d"'

include $(BUILD_EXECUTABLE)
