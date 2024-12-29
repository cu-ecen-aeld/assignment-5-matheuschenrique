##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = '62a090003c2ed834735f921cb257c5806fefd9c8'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-matheuschenrique.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

LDD_MODULE_SUBDIRS += scull
LDD_MODULE_SUBDIRS += misc-modules

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin

	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
