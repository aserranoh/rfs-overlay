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
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${MY_P}"

DOCS="${MY_PV/-*/}/doc/*.pdf"
HTML_DOCS="${MY_PV/-*/}/doc/html/*"

src_compile() {
    g++ -Wall -O2 -o ${PN}-${MY_PV/-*/} *.cpp || die
}

src_install() {
	dobin "${PN}-${MY_PV/-*/}"
	dosym "${PN}-${MY_PV/-*/}" "/usr/bin/${PN}"
	dodoc ${DOCS}
	dohtml ${HTML_DOCS}
	rm -r ${MY_PV/-*/}/doc
	dodir /usr/share/${PN}
	insinto /usr/share/${PN}
	doins -r ${MY_PV/-*/}
}

