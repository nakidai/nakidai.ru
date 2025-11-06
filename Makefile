WEBROOT ?= root

THINDEX = thoughts/index.html
THOUGHTS = thoughts/000_about.txt thoughts/001_cla.pdf
GEN = index.html cstyle.html
FILES = ${GEN} style.css plaza521.asc nakidai.asc isc 2bsd

RM ?= rm -f
CP ?= cp -a

all: ${GEN} ${THOUGHTS} ${THINDEX}

index.html: index.7
	mandoc -Thtml index.7 -Ostyle=style.css | sed -e '/<head>/a\
		<link rel="me" href="https://mstdn.social/@nakidai">' > index.html

cstyle.html: cstyle.7
	mandoc -Thtml cstyle.7 -Ostyle=style.css > cstyle.html

thoughts/000_about.txt: thoughts/000_about.7
	mandoc -Tascii thoughts/000_about.7 | col -b > thoughts/000_about.txt

${THINDEX}: ${THOUGHTS} thoughts/index.sh
	thoughts/index.sh ${THOUGHTS} > thoughts/index.html

clean:
	${RM} ${GEN}
	${RM} ${THOUGHTS}
	${RM} ${THINDEX}

install: ${FILES} ${THOUGHTS} ${THINDEX}
	install -dm755 ${WEBROOT}
	install -Cm644 ${FILES} ${WEBROOT}
	install -dm755 ${WEBROOT}/thoughts
	install -Cm644 ${THOUGHTS} ${WEBROOT}/thoughts
	install -Cm644 ${THINDEX} ${WEBROOT}/thoughts

.PHONY: all clean install
