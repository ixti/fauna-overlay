# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

DESCRIPTION="Typeface carefully crafted & designed for computer screens"
HOMEPAGE="https://rsms.me/inter/"
SRC_URI="https://github.com/rsms/inter/releases/download/v${PV}/Inter-${PV}.zip -> ${p}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

FONT_SUFFIX="otf ttf"
FONT_PN="Inter"

DOCS=( LICENSE.txt )

src_unpack() {
	if [ "${A}" != "" ]; then
		mkdir "${S}" && cd "${S}"
		unpack ${A}
	fi
}

src_prepare() {
	default

	mv "${S}/Inter (OTF)"/*.otf "${S}" || die
	mv "${S}/Inter (TTF)"/*.ttf "${S}" || die

	rm "${S}"/*-BETA.otf || die
	rm "${S}"/*-BETA.ttf || die
}
