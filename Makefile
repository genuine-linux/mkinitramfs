#!/usr/bin/make -f

INITRAMFS=initramfs
PROG=mk$(INITRAMFS)

PREFIX=
datadir=$(PREFIX)/usr/share/$(PROG)
mandir=$(PREFIX)/usr/share/man/man8
sbindir=$(PREFIX)/sbin
etcdir=$(PREFIX)/etc

install:
	@install -v -m 0755 -d $(DESTDIR)$(datadir)/bashrc $(DESTDIR)$(mandir) \
		$(DESTDIR)$(sbindir) $(DESTDIR)$(etcdir) && \
	install -v -m 0755 $(PROG) $(DESTDIR)$(sbindir)/$(PROG) && \
	install -v -m 0755 $(PROG)-modules $(DESTDIR)$(sbindir)/$(PROG)-modules && \
	install -v -m 0755 ls$(INITRAMFS) $(DESTDIR)$(sbindir)/ls$(INITRAMFS) && \
	install -v -m 0644 ls$(INITRAMFS).8 $(DESTDIR)$(mandir)/ls$(INITRAMFS).8 && \
	install -v -m 0755 un$(PROG) $(DESTDIR)$(sbindir)/un$(PROG) && \
	install -v -m 0644 un$(PROG).8 $(DESTDIR)$(mandir)/un$(PROG).8 && \
	install -v init.in $(DESTDIR)$(datadir)/init.in && \
	install -v -m 0755 bashrc/bashrc-root $(DESTDIR)$(datadir)/bashrc/bashrc-root && \
	install -v -m 0755 bashrc/profile-root $(DESTDIR)$(datadir)/bashrc/profile-root && \
	install -v -m 0755 bashrc/bash-profile-root $(DESTDIR)$(datadir)/bashrc/bash-profile-root && \
	install -v -m 0755 bashrc/bash-history-root $(DESTDIR)$(datadir)/bashrc/bash-history-root && \
	install -v -m 0755 bashrc/bash-logout-root $(DESTDIR)$(datadir)/bashrc/bash-logout-root && \
	install -v -m 0775 bashrc/bashrc-system $(DESTDIR)$(datadir)/bashrc/bashrc-system && \
	install -v -m 0775 bashrc/profile-system $(DESTDIR)$(datadir)/bashrc/profile-system && \
	install -v -m 0775 bashrc/profile.env $(DESTDIR)$(datadir)/bashrc/profile.env && \
	install -v -m 0775 -d $(DESTDIR)$(datadir)/bashrc/profile.d && \
	install -v -m 0775 bashrc/profile.d/* $(DESTDIR)$(datadir)/bashrc/profile.d/ && \
	install -v -m 0644 $(PROG).conf $(DESTDIR)$(etcdir)/$(PROG).conf

all: install
