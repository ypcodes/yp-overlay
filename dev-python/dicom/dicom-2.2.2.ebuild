# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9,3_10} )

inherit distutils-r1

DESCRIPTION="Read, modify and write DICOM files with python code"
HOMEPAGE="https://pydicom.github.io/pydicom/dev/"
SRC_URI="https://github.com/pydicom/pydicom/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# Upstream bug: https://github.com/pydicom/pydicom/issues/663
RESTRICT="test"

DEPEND="test? ( dev-python/pytest[${PYTHON_USEDEP}] )"

python_test() {
	distutils-r1_install_for_testing
	py.test --cov=pydicom -r sx --pyargs pydicom --verbose || die
}
