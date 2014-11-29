osname=$(subst ganeti-instance-,,$(PACKAGE))

osdir=$(OS_DIR)/$(osname)
variantsdir=$(DESTDIR)$(sysconfdir)/ganeti/instance-gentoobootstrap/variants
defaultsdir=$(DESTDIR)$(sysconfdir)/ganeti

dist_os_SCRIPTS = create import export rename verify
dist_os_DATA = ganeti_api_version parameters.list
os_DATA = common.sh

dist_doc_DATA = COPYING NEWS README

exampledir = $(docdir)/examples
exampleconfdir = $(exampledir)/confdata
exampleportagedir = $(exampledir)/portage
examplecatalystdir = $(exampledir)/catalyst

dist_exampleconf_DATA = \
	examples/hooks/confdata/defaultpasswords \
	examples/hooks/confdata/timezone

dist_example_DATA = \
	examples/hooks/defaultpasswords \
	examples/hooks/grub \
	examples/hooks/hosts \
	examples/hooks/interfaces \
	examples/hooks/ssh-keys \
	examples/hooks/timezone

dist_exampleportage_DATA = \
	examples/portage/make.conf \
	examples/portage/package.use

dist_examplecatalyst_DATA = \
	examples/catalyst/linux-3.16.5-gentoo.config \
	examples/catalyst/stage4-amd64-default-stable.spec

EXTRA_DIST = \
	common.sh.in \
	defaults \
	ganeti-instance-gentoobootstrap

do_subst = sed \
	-e 's,[@]sysconfdir[@],$(sysconfdir),g' \
	-e 's,[@]localstatedir[@],$(localstatedir),g'

common.sh: common.sh.in Makefile
	$(do_subst) < $< > $@
	chmod +x $@

install-exec-local:
	@mkdir_p@ $(defaultsdir)
	@mkdir_p@ $(variantsdir)
	$(INSTALL_DATA) $(top_srcdir)/defaults \
		$(variantsdir)/default
	$(INSTALL_DATA) $(top_srcdir)/ganeti-instance-gentoobootstrap \
		$(defaultsdir)/ganeti-instance-gentoobootstrap
	$(INSTALL_DATA) $(top_srcdir)/variants.list \
		$(defaultsdir)/instance-gentoobootstrap/variants.list

uninstall-local:
	rm -f $(variantsdir)/default.conf
	rm -f $(defaultsdir)/ganeti-instance-gentoobootstrap

CLEANFILES = common.sh
