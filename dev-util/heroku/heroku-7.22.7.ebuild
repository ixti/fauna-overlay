# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The heroku command-line interface (CLI)."
HOMEPAGE="https://devcenter.heroku.com/categories/command-line"
SRC_URI="https://cli-assets.heroku.com/heroku-v${PV}/heroku-v${PV}-linux-x64.tar.xz -> ${P}.tar.xz"
RESTRICT="mirror strip bindist"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}"

src_install() {
	insinto "/opt/${PN}"
	doins -r *
	dosym "/opt/${PN}/bin/heroku" "/usr/bin/${PN}"
	fperms +x "/opt/${PN}/bin/heroku"
	fperms +x "/opt/${PN}/bin/node"
}
