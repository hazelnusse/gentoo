# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.3.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Binding to libxml2"
HOMEPAGE="http://hackage.haskell.org/package/libxml"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~alpha amd64 ~ia64 ~ppc ~ppc64 ~sparc x86"
IUSE=""

RDEPEND="dev-haskell/mtl:=[profile?]
	>=dev-lang/ghc-6.10.4:=
	dev-libs/libxml2
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6.0.3
	virtual/pkgconfig
"

src_prepare() {
	sed -e 's@includes: libxml/xmlIO.h libxml/xmlmemory.h@pkgconfig-depends: libxml-2.0@' \
		-i "${S}/${PN}.cabal" \
		|| die "Could not patch libxml2 configuration in ${PN}.cabal"
}
