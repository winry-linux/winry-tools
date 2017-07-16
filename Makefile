VERSION = 0.1
NAME = winry-buildtools

PREFIX ?= /usr
BINDIR = $(PREFIX)/bin

BIN = \
	bin/winry-build-testing \
	bin/signfile \
	bin/signpkgs
	
LIBS = \
	lib/util \
	lib/util-msg \
	lib/util-pkg

RM = rm -f
Q = @

edit = sed -e "s|@version@|${Version}|g" \
	-e "s|@libdir[@]|$(DESTDIR)$(PREFIX)/lib/winry-tools|g"

all: $(BIN) $(LIBS)

%: %.in Makefile
	$(Q)echo "GEN $@"
	$(RM) "$@"
	m4 -P $@.in | $(edit) >$@
	chmod a-w "$@"
	chmod +x "$@"

install-base: 
	install -dm0755 $(DESTDIR)$(BINDIR)
	install -m0755 ${BIN} $(DESTDIR)$(BINDIR)
	
	install -dm0755 $(DESTDIR)$(PREFIX)/lib/winry-tools
	install -m0644 ${LIBS} $(DESTDIR)$(PREFIX)/lib/winry-tools
	
uninstall-base:
	for f in ${BIN}; do $(RM) $(DESTDIR)/$$f; done
	for f in ${LIBS}; do $(RM) $(DESTDIR)$(PREFIX)/lib/winry-tools/$$f; done
	
install: install-base
uninstall: uninstall-base

clean:
	$(RM) ${BIN}
	$(RM) ${LIBS}

.PHONY: install-base uninstall-base install uninstall clean
