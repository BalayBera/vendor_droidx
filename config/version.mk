PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 7

# versioning
DROIDX_CODENAME := LongTermSupport
DROIDX_BUILD_TYPE ?= UNOFFICIAL
DROIDX_VARIANT := $(DROIDX_ZIP_TYPE)
DROIDX_DATE_YEAR := $(shell date -u +%Y)
DROIDX_DATE_MONTH := $(shell date -u +%m)
DROIDX_DATE_DAY := $(shell date -u +%d)
DROIDX_DATE_HOUR := $(shell date -u +%H)
DROIDX_DATE_MINUTE := $(shell date -u +%M)
DROIDX_BUILD_DATE := $(DROIDX_DATE_YEAR)$(DROIDX_DATE_MONTH)$(DROIDX_DATE_DAY)-$(DROIDX_DATE_HOUR)$(DROIDX_DATE_MINUTE)

# Check Official
ifeq ($(DROIDX_BUILD_TYPE), OFFICIAL)
  LIST = $(shell cat vendor/droidx/droidx.devices)
    ifeq ($(filter $(DROIDX_BUILD), $(LIST)), $(DROIDX_BUILD))
      DROIDX_BUILD_TYPE := OFFICIAL
    else 
      DROIDX_BUILD_TYPE := UNOFFICIAL
    endif
endif

DROIDX_VERSION_SUFFIX := $(DROIDX_BUILD_DATE)-$(DROIDX_BUILD_TYPE)-$(DROIDX_BUILD)

# Internal version
DROIDX_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(DROIDX_VERSION_SUFFIX)

# Display version
DROIDX_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(DROIDX_VERSION_SUFFIX)

# Codename version
DROIDX_DISPLAY_VERSION_CODENAME := 13-LongTermSupport

# Props
PRODUCT_PRODUCT_PROPERTIES += \
  ro.droidx.version=$(DROIDX_DISPLAY_VERSION_CODENAME) \
  ro.droidx.codename=$(DROIDX_CODENAME) \
  ro.droidx.build.date=$(DROIDX_BUILD_DATE) \
  ro.droidx.releasevarient=$(DROIDX_ZIP_TYPE) \
  ro.droidx.releasetype=$(DROIDX_BUILD_TYPE) \
  ro.droidx.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
