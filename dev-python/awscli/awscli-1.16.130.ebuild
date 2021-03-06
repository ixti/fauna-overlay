# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit bash-completion-r1 distutils-r1

DESCRIPTION="Universal Command Line Environment for AWS"
HOMEPAGE="https://aws.amazon.com/cli/"
SRC_URI="https://github.com/aws/aws-cli/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

# requires network access
RESTRICT="test"

RDEPEND="
	>=dev-python/docutils-0.10[${PYTHON_USEDEP}]
	>=dev-python/botocore-1.12.71[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.2.5[${PYTHON_USEDEP}]
	<=dev-python/colorama-0.3.9[${PYTHON_USEDEP}]
	>=dev-python/rsa-3.1.2[${PYTHON_USEDEP}]
	<=dev-python/rsa-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/s3transfer-0.1.12[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	<=dev-python/pyyaml-3.13[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		=dev-python/mock-1.3.0[${PYTHON_USEDEP}]
		=dev-python/nose-1.3.7[${PYTHON_USEDEP}]
	)
"

S="${WORKDIR}/aws-cli-${PV}"

python_test() {
	nosetests -vv || die
}

python_install_all() {
	newbashcomp bin/aws_bash_completer aws

	insinto /usr/share/zsh/site-functions
	newins bin/aws_zsh_completer.sh _aws

	distutils-r1_python_install_all

	rm "${ED%/}"/usr/bin/{aws.cmd,aws_bash_completer,aws_zsh_completer.sh} || die
}
