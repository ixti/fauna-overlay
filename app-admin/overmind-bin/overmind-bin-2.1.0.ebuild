# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Process manager for Procfile-based applications and tmux."
HOMEPAGE="https://evilmartians.com/chronicles/introducing-overmind-and-hivemind"
SRC_URI="https://github.com/DarthSim/overmind/releases/download/v${PV}/overmind-v${PV}-linux-amd64.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND} app-misc/tmux"
BDEPEND=""

QA_PRESTRIPPED="/usr/bin/overmind"

src_unpack() {
	if [ "${A}" != "" ]; then
		mkdir "${S}" && cd "${S}"
		unpack ${A}
	fi
}

src_install() {
	newbin overmind-v${PV}-linux-amd64 overmind
}
