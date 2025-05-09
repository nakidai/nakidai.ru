WEBROOT ?= root

GEN = index.html cstyle.html thoughts/000_about.txt
FILES = ${GEN} style.css plaza521.asc nakidai.asc isc 2bsd

all: ${GEN}

index.html: index.7
	mandoc -Thtml index.7 -Ostyle=style.css | sed -e '/<head>/a\
		<link rel="me" href="https://mstdn.social/@nakidai">' > index.html

cstyle.html: cstyle.7
	mandoc -Thtml cstyle.7 -Ostyle=style.css > cstyle.html

thoughts/000_about.txt: thoughts/000_about.7
	mandoc -Tascii thoughts/000_about.7 | col -b > thoughts/000_about.txt

clean:
	rm -f ${GEN}

install: ${FILES}
	install -d ${WEBROOT}
	install -Cm644 ${FILES} ${WEBROOT}

.PHONY: all clean install
