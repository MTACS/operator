TARGET := iphone:clang:13.0:13.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = OperatorPrefs

OperatorPrefs_FILES = OperatorRootListController.m
OperatorPrefs_FRAMEWORKS = UIKit
OperatorPrefs_PRIVATE_FRAMEWORKS = Preferences
OperatorPrefs_INSTALL_PATH = /Library/PreferenceBundles
OperatorPrefs_CFLAGS = -fobjc-arc -Wdeprecated-declarations -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/bundle.mk
