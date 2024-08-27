WEBROOT ?= root

GEN = index.html cstyle.html
FILES = ${GEN} style.css pubkey.asc

all: ${GEN}

index.html: index.7
	mandoc -Thtml index.7 -Ostyle=style.css > index.html

cstyle.html: cstyle.7
	mandoc -Thtml cstyle.7 -Ostyle=style.css > cstyle.html

clean:
	rm -f ${GEN}

install: ${FILES}
	install -d ${WEBROOT}
	install -Cm644 ${FILES} ${WEBROOT}

.PHONY: all clean install
