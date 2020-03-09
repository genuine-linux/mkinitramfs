#!/usr/bin/make -f

PREFIX=
datadir=$(PREFIX)/usr/share/mkinitramfs
mandir=$(PREFIX)/usr/share/man/man8
sbindir=$(PREFIX)/sbin
etcdir=$(PREFIX)/etc

install:
	@mkdir -pv $(DESTDIR)$(datadir) $(DESTDIR)$(mandir) \
		$(DESTDIR)$(sbindir) $(DESTDIR)$(etcdir) && \
	install -m 0755 mkinitramfs $(DESTDIR)$(sbindir)/mkinitramfs && \
	install -m 0755 lsinitramfs $(DESTDIR)$(sbindir)/lsinitramfs && \
	install -m 0644 lsinitramfs.8 $(DESTDIR)$(mandir)/lsinitramfs.8 && \
	install -m 0755 unmkinitramfs $(DESTDIR)$(sbindir)/unmkinitramfs && \
	install -m 0644 unmkinitramfs.8 $(DESTDIR)$(mandir)/unmkinitramfs.8 && \
	install init.in $(DESTDIR)$(datadir)/init.in && \
	install mkinitramfs.conf $(DESTDIR)$(etcdir)/mkinitramfs.conf

all: install
