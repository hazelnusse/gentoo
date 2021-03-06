# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_6} )

inherit python-any-r1

DESCRIPTION="Mock hardware devices for creating unit tests"
HOMEPAGE="https://github.com/martinpitt/umockdev/"
SRC_URI="https://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.xz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs test"

RDEPEND="dev-libs/libgudev:=
	virtual/libudev:=
	>=dev-libs/glib-2.32:2"
DEPEND="${RDEPEND}
	test? ( ${PYTHON_DEPS} )
	app-arch/xz-utils
	virtual/pkgconfig"

RESTRICT="test"

PATCHES=(
	"${FILESDIR}"/${P}-sysmacros.patch #579988
)

src_configure() {
	econf $(use_enable static-libs static)
}
