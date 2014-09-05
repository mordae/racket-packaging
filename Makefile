#!/usr/bin/make -f

package = $(shell grep ^Name: *.spec | awk '{print $$2}')
version = $(shell grep ^Version: *.spec | awk '{print $$2}')

prefix = /usr
rpmdir = ${prefix}/lib/rpm
libexecdir = ${prefix}/libexec

all:

install:
	install -m755 -D rpm/racket.req ${DESTDIR}${rpmdir}/racket.req
	install -m755 -D rpm/racket.prov ${DESTDIR}${rpmdir}/racket.prov
	install -m644 -D rpm/racket.attr ${DESTDIR}${rpmdir}/fileattrs/racket.attr
	install -m755 -D libexec/racket-build ${DESTDIR}${libexecdir}/racket-build
	install -m755 -D libexec/racket-install ${DESTDIR}${libexecdir}/racket-install

clean:

dist:
	git clone --depth=1 .git ${package}-${version}
	rm -rf ${package}-${version}/.git
	tar -cvpzf ${package}-${version}.tar.gz ${package}-${version}
	rm -rf ${package}-${version}

# EOF
