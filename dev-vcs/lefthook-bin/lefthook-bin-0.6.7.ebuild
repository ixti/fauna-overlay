# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Fast and powerful Git hooks manager for any type of projects."
HOMEPAGE="https://github.com/Arkweid/lefthook"
SRC_URI="https://github.com/Arkweid/lefthook/releases/download/v${PV}/lefthook_${PV}_Linux_x86_64.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	if [ "${A}" != "" ]; then
		mkdir "${S}" && cd "${S}"
		unpack ${A}
	fi
}

src_install() {
	newbin lefthook_${PV}_Linux_x86_64 lefthook
}
