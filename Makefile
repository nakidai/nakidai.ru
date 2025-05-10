WEBROOT ?= root

THOUGHTS = thoughts/000_about.txt
GEN = index.html cstyle.html
FILES = ${GEN} style.css plaza521.asc nakidai.asc isc 2bsd

RM ?= rm -f
CP ?= cp -a

all: ${GEN} ${THOUGHTS}

index.html: index.7
	mandoc -Thtml index.7 -Ostyle=style.css | sed -e '/<head>/a\
		<link rel="me" href="https://mstdn.social/@nakidai">' > index.html

cstyle.html: cstyle.7
	mandoc -Thtml cstyle.7 -Ostyle=style.css > cstyle.html

thoughts/000_about.txt: thoughts/000_about.7
	mandoc -Tascii thoughts/000_about.7 | col -b > thoughts/000_about.txt

clean:
	${RM} ${GEN}
	${RM} thoughts/*.txt

install: ${FILES} ${THOUGHTS}
	install -dm755 ${WEBROOT}
	install -Cm644 ${FILES} ${WEBROOT}
	install -dm755 ${WEBROOT}/thoughts
	install -Cm644 ${THOUGHTS} ${WEBROOT}/thoughts

.PHONY: all clean install
