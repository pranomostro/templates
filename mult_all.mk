include config.mk

HDR=\
	a.h\
	b.h

LIBA=liba.a
LIBASRC=\
	liba/aa.c\
	liba/ab.c

LIBB=libb.a
LIBBSRC=\
	libb/ba.c\
	libb/bb.c\
	libb/bc.c

LIB=$(LIBA) $(LIBB)

LIBAOBJ=$(LIBASRC:.c=.o)
LIBBOBJ=$(LIBBSRC:.c=.o)
OBJ=$(BIN:=.o) $(LIBAOBJ) $(LIBBOBJ)

all: $(BIN)

$(BIN): $(LIB) $(@:=.o)
$(OBJ): $(HDR) $(CONF)

.o:
	$(CC) $(LDFLAGS) -o $@ $< $(LIB)

.c.o:
	$(CC) $(CFLAGS) -o $@ -c $<

$(LIBA): $(LIBAOBJ)
	$(AR) rc $@ $?
	$(RANLIB) $@
$(LIBB): $(LIBBOBJ)
	$(AR) rc $@ $?
	$(RANLIB) $@

clean:
	rm -f $(BIN) $(OBJ) $(LIB)

install: all
	mkdir -p $(PREFIX)/bin/
	cp $(BIN) $(PREFIX)/bin/
	cp $(MAN) $(PREFIX)/share/man/man1/
	cd $(PREFIX)/bin/ && chmod 755 $(BIN)
	cd $(PREFIX)/share/man/man1/ && chmod 644 $(MAN)

uninstall:
	cd $(PREFIX)/bin/ && rm -f $(BIN)
	cd $(PREFIX)/share/man/man1/ && rm -f $(MAN)

.PHONY: all clean install uninstall
