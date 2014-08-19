#!/usr/bin/make -f

package = $(shell grep ^Name: *.spec | awk '{print $$2}')
version = $(shell grep ^Version: *.spec | awk '{print $$2}')

all:

install:
	install -m755 -D rpm/racket.req ${DESTDIR}/usr/lib/rpm/racket.req
	install -m755 -D rpm/racket.prov ${DESTDIR}/usr/lib/rpm/racket.prov
	install -m644 -D rpm/racket.attr ${DESTDIR}/usr/lib/rpm/fileattrs/racket.attr

clean:

dist:
	git clone --depth=1 .git ${package}-${version}
	rm -rf ${package}-${version}/.git
	tar -cvpzf ${package}-${version}.tar.gz ${package}-${version}
	rm -rf ${package}-${version}

# EOF
