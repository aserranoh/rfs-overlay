# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Utilities for the project Robots From Scratch!"
HOMEPAGE="https://github.com/aserranoh/rfsutils"
SRC_URI="https://github.com/aserranoh/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
RESTRICT="mirror"

DEPEND="dev-embedded/rfsgpio"
RDEPEND="${DEPEND}"

src_install() {
	default
	newinitd "${FILESDIR}"/buttonsd buttonsd
}

