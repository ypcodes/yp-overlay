# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="one for all free music in china (Windows, Mac, Linux desktop)"
HOMEPAGE="http://listen1.github.io/listen1"
SRC_URI="https://github.com/listen1/listen1_desktop/releases/download/v2.21.6/listen1_2.21.6_linux_x86_64.AppImage"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
	mkdir listen1desktop-bin-2.21.6
}

src_install() {
	cat > Makefile << "EOF"
DEST ?= /usr/bin

all:
		@echo Run \'make install\' to install kunst on your device

install:
		@mkdir -p $(DESTDIR)/$(DEST)
		@cp ../../distdir/listen1_2.21.6_linux_x86_64.AppImage $(DESTDIR)/$(DEST)/listen1
		@chmod 755 $(DESTDIR)/$(DEST)/listen1
		@echo Listen1 has been installed on your device

uninstall:
		@rm -rf $(DEST)/kunst
		@echo Listen1 has been removed from your device
EOF
	emake DESTDIR="${D}" PREFIX=/usr install
}
