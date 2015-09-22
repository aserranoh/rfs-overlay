# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MY_PV="${PV/_p/-}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="C compiler for PIC18 devices"
HOMEPAGE="http://pikdev.free.fr/"
SRC_URI="http://pikdev.free.fr/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="doc deprecated"
RESTRICT="mirror"

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${MY_P}"

VS=${MY_PV/-*/}
DOCS="${VS}/doc/*.pdf"
HTML_DOCS="${VS}/doc/html/*"
SHAREDIR="/usr/share/${PN}/${VS}"

inherit toolchain-funcs

src_compile() {
	$(tc-getCXX) ${LDFLAGS} ${CFLAGS} -o ${PN}-${VS} *.cpp || die
}

src_install() {
	dobin "${PN}-${VS}"
	dosym "${PN}-${VS}" "/usr/bin/${PN}"
	insinto ${SHAREDIR}
	doins -r ${VS}/src
	doins -r ${VS}/lib
	doins -r ${VS}/lkr
	insinto ${SHAREDIR}/include
	doins ${VS}/include/*.h
	doins -r ${VS}/include/sys
	doins -r ${VS}/include/device
	use deprecated && doins -r ${VS}/include/device_obsolete
	if use doc; then
		dodoc ${DOCS}
		dohtml ${HTML_DOCS}
	fi
}

