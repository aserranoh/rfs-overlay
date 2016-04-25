# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="PIC microcontrollers linker"
HOMEPAGE="https://github.com/aserranoh/picc"
SRC_URI="https://github.com/aserranoh/picc/releases/download/${PV}/${PF}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
RESTRICT="mirror"

RDEPEND="dev-python/intelhex"

