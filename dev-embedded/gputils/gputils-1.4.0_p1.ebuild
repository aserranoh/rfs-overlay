# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit toolchain-funcs

MY_PV="${PV/_p/-}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Collection of tools including assembler, linker and librarian for PIC microcontrollers"
HOMEPAGE="http://gputils.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~arm"
IUSE="doc"
RESTRICT="mirror"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	# Patch the doc directory
	sed -i s@\(PACKAGE_VERSION\)/html@\(PACKAGE_VERSION\)_p1/html@ configure
}

src_configure() {
	tc-ld-disable-gold #369291
	econf $(use_enable doc html-doc ) --htmldir=/usr/share/doc/${PF}
}

src_install() {
	if use doc; then
		dodoc doc/gputils.pdf
	else
		DOCS=""
	fi
	default
}
