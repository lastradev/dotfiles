PREFIX := /usr/local

all: install

install:
	cp monitor $(DESTDIR)$(PREFIX)/bin/monitor
	chmod 0755 $(DESTDIR)$(PREFIX)/bin/monitor

uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/bin/monitor

.PHONY: all install uninstall
