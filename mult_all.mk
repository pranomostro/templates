include config.mk

.SUFFIXES:
.SUFFIXES: .o .c

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

BIN=\
	a\
	b\
	c\
	d

LIBAOBJ=$(LIBASRC:.c=.o)
LIBBOBJ=$(LIBBSRC:.c=.o)
OBJ=$(BIN:=.o) $(LIBAOBJ) $(LIBBOBJ)
SRC=$(BIN:=.c)
MAN=$(BIN:=.1)

all: $(BIN)

$(BIN): $(LIB) $(@:=.o)
$(OBJ): $(HDR) config.mk

.o:
	$(CC) $(LDFLAGS) -o $@ $< $(LIB)

.o.c:
	$(CC) $(CFLAGS) -c $<

$(LIBA): $(LIBAOBJ)
	$(AR) rc $@ $?
$(LIBB): $(LIBBOBJ)
	$(AR) rc $@ $?

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
