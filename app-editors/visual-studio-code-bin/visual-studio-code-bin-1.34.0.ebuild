# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

MY_PN="${PN/-bin}"

DESCRIPTION="Visual Studio Code (official binary version)"
HOMEPAGE="https://code.visualstudio.com"
SRC_URI="https://update.code.visualstudio.com/${PV}/linux-x64/stable -> ${P}.tar.gz"
RESTRICT="mirror strip bindist"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	!app-editors/visual-studio-code
	x11-libs/gtk+
	x11-libs/cairo
	x11-libs/libXtst
"

RDEPEND="
	${DEPEND}
	x11-libs/libnotify
	dev-libs/nss
"

BDEPEND=""

S="${WORKDIR}/VSCode-linux-x64"

src_install(){
	insinto "/opt/${MY_PN}"

	doins -r *
	dosym "/opt/${MY_PN}/bin/code" "/usr/bin/${MY_PN}"

	fperms +x "/opt/${MY_PN}/code"
	fperms +x "/opt/${MY_PN}/bin/code"
	fperms +x "/opt/${MY_PN}/libnode.so"
	fperms +x "/opt/${MY_PN}/resources/app/node_modules.asar.unpacked/vscode-ripgrep/bin/rg"
	fperms +x "/opt/${MY_PN}/resources/app/extensions/git/dist/askpass.sh"

	make_desktop_entry "${MY_PN}" "Visual Studio Code" "${MY_PN}" "Development;IDE"
	newicon "resources/app/resources/linux/code.png" "${MY_PN}.png"
}
