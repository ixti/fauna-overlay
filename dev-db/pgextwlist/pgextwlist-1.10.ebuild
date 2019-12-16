# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="PostgreSQL Extension Whitelisting"
HOMEPAGE="https://github.com/dimitri/pgextwlist"
SRC_URI="https://github.com/dimitri/pgextwlist/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="POSTGRESQL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-db/postgresql"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake DESTDIR="${D}" install
	dosym ../pgextwlist.so $(pg_config --pkglibdir)/plugins/pgextwlist.so
	einstalldocs
}

pkg_postinst() {
	einfo "Add 'pgextwlist' to the 'local_preload_libraries' setting."
	einfo "See https://github.com/dimitri/pgextwlist/tree/v${PV}#setup"
}
