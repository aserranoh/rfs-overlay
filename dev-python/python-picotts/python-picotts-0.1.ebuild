# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Python wrappers for the text-to-speech library ttspico"
HOMEPAGE="https://github.com/aserranoh/python-picotts"
SRC_URI="https://github.com/aserranoh/python-picotts/releases/download/${PV}/${PF}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
RESTRICT="mirror"

RDEPEND="app-accessibility/picotts"

