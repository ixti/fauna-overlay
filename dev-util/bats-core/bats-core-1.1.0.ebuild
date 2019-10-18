# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Bash Automated Testing System"
HOMEPAGE="https://github.com/bats-core/bats-core"
SRC_URI="https://github.com/bats-core/bats-core/archive/v${PV}.tar.gz -> ${P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-shells/bash"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	./install.sh "${D}"
}
