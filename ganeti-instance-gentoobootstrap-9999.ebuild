# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/ganeti-instance-gentoobootstrap/ganeti-instance-gentooobootstrap-9999.ebuild,v 1.0 2013/05/13 02:40:43 zorry Exp $

EAPI=2

inherit eutils git-2 autotools

DESCRIPTION="Scripts to build Ganeti VMs with Gentoo and catalyst"
HOMEPAGE="http://code.google.com/p/ganeti/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/zorry/ganeti-gentoobootstrap.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="app-arch/dump
app-emulation/ganeti
dev-util/catalyst
sys-fs/parted[device-mapper]
sys-fs/lvm2
>=sys-apps/coreutils-6.10-r1
sys-apps/util-linux
sys-fs/e2fsprogs"

src_prepare() {
	eautoreconf
	}

src_configure() {
	econf --docdir=/usr/share/doc/${PN} || die "econf failed"
	}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	insinto /etc/ganeti/instance-gentoobootstrap/hooks
	doins examples/hooks/*
	insinto /etc/ganeti/instance-gentoobootstrap/catalyst
	doins examples/catalyst/*
	insinto /etc/ganeti/instance-gentoobootstrap/portage
	doins examples/portage/*
	insinto /etc/ganeti/instance-gentoobootstrap/hooks/confdata
	doins examples/hooks/confdata/*
	dosym /etc/ganeti/instance-gentoobootstrap/variants.list /usr/share/ganeti/os/gentoobootstrap/variants.list
	}
