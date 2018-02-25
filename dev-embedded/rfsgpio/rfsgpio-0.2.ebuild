# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Library to interact with GPIO and PWM ports (using sysfs)"
HOMEPAGE="https://github.com/aserranoh/rfsgpio"
SRC_URI="https://github.com/aserranoh/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="static-libs"
RESTRICT="mirror"

src_configure() {
    econf $(use_enable static-libs static)
}

