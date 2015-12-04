CONVERT=strfile

SRC=*.txt
OBJ=aristotle.dat ayn_rand.dat dumb.dat grammar_rules.dat one_liners.dat \
	oxy_morons.dat philosophy.dat physics_warn.dat proverbs.dat \
	quotes.dat ruminitions.dat scientists.dat steven_wright.dat \
	thomas_jefferson.dat

PREFIX=${DESTDIR}/usr/share/games/fortune
VERSION=0.1
TARNAME=fortunes-psqrd-${VERSION}

%.dat: %.txt
	${CONVERT} $< $@

${TARNAME}.tar.gz: ${SRC} Makefile
	 tar -c -z -f ${TARNAME}.tar.gz --transform='s,^,${TARNAME}/,' ${SRC} Makefile

tarball: ${TARNAME}.tar.gz

install: ${OBJ}
	mkdir -p ${PREFIX}/psqrd
	install -m 644 ${SRC} ${PREFIX}/psqrd
	install -m 644 ${OBJ} ${PREFIX}/psqrd

all: ${OBJ}

.PHONY: clean

clean:
	rm -f *.dat
