# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The heroku command-line interface (CLI)."
HOMEPAGE="https://devcenter.heroku.com/categories/command-line"
SRC_URI="https://cli-assets.heroku.com/heroku-linux-x64.tar.xz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/xz-utils"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	unpack "${A}"
	mv "${PN}" "${P}"
}

src_install() {
	dodir "/opt/${PN}"
	cp -ar . "${D}/opt/${PN}"
	dosym "../../opt/${PN}/bin/heroku" /usr/bin/heroku
}
