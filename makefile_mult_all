include config.mk

.SUFFIXES:
.SUFFIXES: .o .c

all: $(TARGET)

deps/lib1/lib1.a:
	make -C deps/lib1/

deps/lib2/lib2.a:
	make -C deps/lib2/

p1: p1_1.o p1_2.o
	$(CC) $(LDFLAGS) -o $@ $<

p2: p2_1.o p2_2.o $(LIB)
	$(CC) $(LDFLAGS) -o $@ $(LIB) $<

.o.c:
	$(CC) $(CFLAGS) -c $<

clean:
	make -C deps/lib1/ clean
	make -C deps/lib2/ clean
	rm -rf *.o $(TARGET)

install: $(TARGET)
	mkdir -p $(PREFIX)/bin/
	cp $(TARGET) $(PREFIX)/bin/
	cp $(TARGET:=.1) $(PREFIX)/share/man/man1/
	cd $(PREFIX)/bin/ && chmod 755 $(TARGET)
	cd $(PREFIX)/share/man/man1/ && chmod 644 $(TARGET)

uninstall:
	cd $(PREFIX)/bin/ && rm -f $(TARGET)
	cd $(PREFIX)/share/man/man1/ && rm -f $(TARGET:=.1)

.PHONY: all clean install uninstall
