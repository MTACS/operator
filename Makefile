TARGET := iphone:clang:13.0:13.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Operator

Operator_FILES = Tweak.xm
Operator_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += operatorprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall backboardd"