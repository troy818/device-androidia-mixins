DEVICE_PACKAGE_OVERLAYS += ${TARGET_DEVICE_DIR}/overlay

BOARD_KERNEL_CMDLINE += \
	no_timer_check \
	noxsaves \
	reboot_panic=p,w \
	i915.hpd_sense_invert=0x7 \
	intel_iommu=off \
	i915.enable_pvmmio=0 \
	loop.max_part=7

BOARD_FLASHFILES += ${TARGET_DEVICE_DIR}/bldr_utils.img:bldr_utils.img
BOARD_FLASHFILES += $(PRODUCT_OUT)/LICENSE
BOARD_FLASHFILES += $(PRODUCT_OUT)/scripts/README_cvmb:README_cvmb

# for USB OTG WA
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/bxt_usb

# i915_async
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/i915_async

#for clipboard agent
PRODUCT_PRIVATE_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/clipboard_agent/private

#add vendor property
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/vendor/

TARGET_USES_HWC2 := true
BOARD_USES_GENERIC_AUDIO := false

DEVICE_MANIFEST_FILE := ${TARGET_DEVICE_DIR}/manifest.xml
DEVICE_MATRIX_FILE   := ${TARGET_DEVICE_DIR}/compatibility_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE := ${TARGET_DEVICE_DIR}/framework_manifest.xml
BUILD_BROKEN_USES_BUILD_HOST_STATIC_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_SHARED_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_EXECUTABLE := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
# PRODUCT_COPY_FILES directives.
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Release compressed gpt image: caas_cvmb.img.gz
BUILD_GPTIMAGE := true