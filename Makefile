VERSION = 0.0.2
SCRIPT = check-vo-map generate-vo-map
SBINDIR = /usr/sbin
DOCDIR = /usr/share/doc/osg-vo-map

_default:
	@echo "Nothing to make. Try make install"

clean:
	

install:
	@if [ "$(DESTDIR)" = "" ]; then                                        \
		echo " ";                                                      \
		echo "ERROR: DESTDIR is required";                             \
		exit 1;                                                        \
	fi

	mkdir -p $(DESTDIR)/$(SBINDIR)
	mkdir -p $(DESTDIR)/$(DOCDIR)
	install -p -m 644 README $(DESTDIR)/$(DOCDIR)/README
	    
	mkdir -p $(DESTDIR)/$(SBINDIR)
	install -p -m 755 $(SCRIPT) $(DESTDIR)/$(SBINDIR)


dist:
	mkdir -p osg-vo-map-$(VERSION)
	cp -p $(SCRIPT) Makefile README osg-vo-map-$(VERSION)/
	tar czf osg-vo-map-$(VERSION).tar.gz osg-vo-map-$(VERSION)/

release: dist
	@if [ "$(DESTDIR)" = "" ]; then                                        \
		echo " ";                                                      \
		echo "ERROR: DESTDIR is required";                             \
		exit 1;                                                        \
	fi
	mkdir -p $(DESTDIR)/osg-vo-map/$(VERSION)
	mv -f osg-vo-map-$(VERSION).tar.gz $(DESTDIR)/osg-vo-map/$(VERSION)/
	rm -rf osg-vo-map-$(VERSION)

	
