SHELL=bash

SOURCES=$(wildcard src/*.sh)
$(info "$(SOURCES)")

TARGET_SUBDIRS=doc/

.PHONY: $(TARGET_SUBDIRS)
.ONESHELL:
$(TARGET_SUBDIRS):
	echo $(MAKE)
	$(MAKE) -C $@ all

.PHONY: all
.ONESHELL:
all: $(addsuffix /,$(SUBDIRS))


# Install by linking 
.PHONY: install-local-link
.ONESHELL:
install-local-link: $(SOURCES)
	config link --user

.PHONY: install-local
.ONESHELL:
install-local: $(SOURCES)
	config install --user 

.PHONY: install
.ONESHELL:
install: $(SOURCES)
	config install
