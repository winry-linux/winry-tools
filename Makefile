VERSION = 0.1
NAME = winry-buildtools

PREFIX ?= /usr
BINDIR = $(PREFIX)/bin

BIN_BASE = \
	bin/winry-build-testing

RM = rm -f
Q = @

all:
	for f in ${BIN_BASE}; do sed 's/@VERSION@/'$(VERSION)'/' $$f.in > $$f; done

install-base:
	install -m0755 ${BIN_BASE} $(DESTDIR)$(BINDIR)
	
uninstall-base:
	for f in ${BIN_BASE}; do $(RM) $(DESTDIR)/$$f; done
	
install: install-base
uninstall: uninstall-base

clean:
	$(RM) ${BIN_BASE}

.PHONY: install-base uninstall-base install uninstall clean
