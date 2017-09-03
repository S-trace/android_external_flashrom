# Copyright (C) 2011-2014 The Android-x86 Open Source Project

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := flashrom

LOCAL_C_INCLUDES += \
    external/libusb/libusb

LOCAL_FORCE_STATIC_EXECUTABLE := 1
LOCAL_STATIC_LIBRARIES := libusb1.0 liblog
# LOCAL_SHARED_LIBRARIES := libusb1.0

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
    82802ab.c \
    at45db.c \
    bitbang_spi.c \
    buspirate_spi.c \
    ch341a_spi.c \
    cli_classic.c \
    cli_common.c \
    cli_output.c \
    dediprog.c \
    dummyflasher.c \
    en29lv640b.c \
    flashchips.c \
    flashrom.c \
    ft2232_spi.c \
    helpers.c \
    hwaccess.c \
    jedec.c \
    layout.c \
    linux_spi.c \
    opaque.c \
    physmap.c \
    pony_spi.c \
    print.c \
    programmer.c \
    serial.c \
    serprog.c \
    sfdp.c \
    spi25.c \
    spi25_statusreg.c \
    spi.c \
    sst28sf040.c \
    sst49lfxxxc.c \
    sst_fwhub.c \
    stm50.c \
    udelay.c \
    usbblaster_spi.c \
    w29ee011.c \
    w39.c

LOCAL_CFLAGS += \
    -MMD \
    -Os \
    -Wall \
    -Wshadow \
    -I/usr/include/libusb-1.0 \
    -D'CONFIG_DEFAULT_PROGRAMMER=PROGRAMMER_CH341A_SPI' \
    -D'CONFIG_DEFAULT_PROGRAMMER_ARGS="''"' \
    -D'CONFIG_SERPROG=1' \
    -D'CONFIG_PONY_SPI=1' \
    -D'CONFIG_BITBANG_SPI=1' \
    -D'CONFIG_DUMMY=1' \
    -D'CONFIG_BUSPIRATE_SPI=1' \
    -D'CONFIG_DEDIPROG=1' \
    -D'CONFIG_LINUX_SPI=1' \
    -D'CONFIG_CH341A_SPI=1' \
    -D'NEED_RAW_ACCESS=1' \
    -D'NEED_LIBUSB0=1' \
    -D'NEED_LIBUSB1=1' \
    -D'HAVE_UTSNAME=1' \
    -D'FLASHROM_VERSION="0.9.9-r1955"'

include $(BUILD_EXECUTABLE)
