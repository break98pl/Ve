export ARCHS = arm64 arm64e
export TARGET = iphone:clang:14.3:14.0

INSTALL_TARGET_PROCESSES = SpringBoard Preferences
SUBPROJECTS = Tweak/Core Tweak/Target Preferences

export FINALPACKAGE=1
export THEOS_DEVICE_IP=172.16.100.46

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
