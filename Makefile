CFLAGS = -Wall -Wextra -std=c99 -g
CPPFLAGS =
LDFLAGS =

EXEC = example
SOURCES = main.c second.c
OBJS = $(SOURCES:.c=.$(LANG).o)
LANG ?= cs

.SUFFIXES:

all: $(EXEC).$(LANG)

$(EXEC).$(LANG): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)

%.$(LANG).o: %.c %.$(LANG).h
	$(CC) $(CPPFLAGS) $(CFLAGS) -DLANG=$(LANG) -include $*.$(LANG).h -c $< -o $@

# keep intermediate files
.SECONDARY: $(SOURCES:.c=.$(LANG).h)

%.$(LANG).h: %.c po/$(LANG)/LC_MESSAGES/$(EXEC).mo
	gcc $< -E -DGETTEXT_PREPARE=1 | python3 gen_header.py $(EXEC) $(LANG) > $@

po/%/LC_MESSAGES/$(EXEC).mo: po/%/$(EXEC).po
	mkdir -p $(@D)
	msgfmt --output-file=$@ $<

po/%/$(EXEC).po: po/$(EXEC).pot
	mkdir -p $(@D)
	touch $@
	msgmerge --update $@ $<

po/$(EXEC).pot: $(SOURCES)
	xgettext --keyword=_ --package-name=$(EXEC) -C -c -s -o po/$(EXEC).pot $(SOURCES)

.PHONY: clean
clean:
	rm -f $(EXEC) $(OBJS) $(SOURCES:.c=.??.h) po/*/LC_MESSAGES/$(EXEC).mo

