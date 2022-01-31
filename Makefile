MAKE = make

SUBDIRS = guide-gns3

all:
	list='$(SUBDIRS)'; for subdir in $$list; do \
	echo "Make in $$subdir"; \
	(cd $$subdir && $(MAKE) $@) \
	done;

clean:
	list='$(SUBDIRS)'; for subdir in $$list; do \
	echo "Clean in $$subdir"; \
	(cd $$subdir && $(MAKE) $@) \
	done;

rebuild:
	list='$(SUBDIRS)'; for subdir in $$list; do \
	echo "Rebuild in $$subdir"; \
	(cd $$subdir && $(MAKE) $@) \
	done;
