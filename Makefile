CONVERT=strfile

SRC=aristotle ayn_rand dumb grammar_rules one_liners oxy_morons \
	philosophy physics_warnings programming proverbs quotes ruminitions \
	scientists steven_wright thomas_jefferson

OBJ=aristotle.dat ayn_rand.dat dumb.dat grammar_rules.dat \
	one_liners.dat oxy_morons.dat philosophy.dat \
	physics_warnings.dat programming.dat proverbs.dat quotes.dat \
	ruminitions.dat scientists.dat steven_wright.dat \
	thomas_jefferson.dat

PREFIX=${DESTDIR}/usr/share/games/fortune
VERSION=0.2
TARNAME=fortunes-psqrd-${VERSION}

%.dat: %
	${CONVERT} $< $@

all: ${OBJ}

${TARNAME}.tar.gz: ${SRC} Makefile
	 tar -c -z -f ${TARNAME}.tar.gz --transform='s,^,${TARNAME}/,' ${SRC} Makefile

tarball: ${TARNAME}.tar.gz

install: ${OBJ}
	mkdir -p ${PREFIX}
	for filename in ${SRC} ${OBJ} ; do \
	install -m 644 $$filename ${PREFIX}/psqrd-$$filename ; \
	done

.PHONY: clean

clean:
	rm -f *.dat *.tar.gz
