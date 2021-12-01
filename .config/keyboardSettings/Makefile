PREFIX := /usr/local

all: install

install:
	cp kbset $(DESTDIR)$(PREFIX)/bin/kbset
	chmod 0755 $(DESTDIR)$(PREFIX)/bin/kbset

uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/bin/kbset

.PHONY: all install uninstall
