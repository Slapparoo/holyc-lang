TARGET := hcc 
CC     := gcc
CFLAGS := -O0 -ggdb -Wall -DDEBUG
OUT    := ../build
OUTTMP    := $(OUT)/tmp

LIB_SRC?=./holyc-lib
SYNTAX?=./syntax-highlighting
PREFIX?=/usr/local

.PHONY: unit-test

$(OUTTMP)/%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

all: $(TARGET) 

clean:
	rm -rf $(TARGET) $(TEST_TARGET) $(OUT)
	mkdir $(OUT)
	mkdir $(OUTTMP)

format:
	clang-format -i *.c
	clang-format -i *.h

OBJS = $(OUTTMP)/main.o \
	   $(OUTTMP)/dict.o \
	   $(OUTTMP)/parser.o \
	   $(OUTTMP)/list.o \
	   $(OUTTMP)/ast.o \
	   $(OUTTMP)/prsasm.o \
	   $(OUTTMP)/prsutil.o \
	   $(OUTTMP)/prslib.o \
	   $(OUTTMP)/x86.o \
	   $(OUTTMP)/aostr.o \
	   $(OUTTMP)/cctrl.o \
	   $(OUTTMP)/compile.o \
	   $(OUTTMP)/lexer.o

$(TARGET): $(OBJS)
	$(CC) -o $(OUT)/$(TARGET) $(OBJS) -lm

install-syntax-nvim:
	cp $(SYNTAX)/hc.vim ~/.config/nvim/after/syntax/hc.vim

install:
	install -c -m 555 $(OUT)/$(TARGET) $(PREFIX)/bin
	cp $(LIB_SRC)/tos.HH $(PREFIX)/include/tos.HH
	cd ./holyc-lib && ../$(OUT)/$(TARGET) -lib tos ./all.HC

prsasm-test:
	gcc -O0 -g -DPRSASM_TEST ./prsasm.c ./cctrl.c ./dict.c ./ast.c ./aostr.c ./list.c ./lexer.c ./prsutil.c

unit-test:
	cd ../tests && $(OUT)/hcc -o test-runner ./run.HC && ./test-runner

$(OUTTMP)/dict.o: dict.c dict.h aostr.h 
$(OUTTMP)/list.o: list.c list.h aostr.h 
$(OUTTMP)/main.o: main.c dict.h lexer.h list.h aostr.h 
$(OUTTMP)/lexer.o: lexer.c lexer.h dict.h list.h aostr.h 
$(OUTTMP)/parser.o: parser.c parser.h prsutil.h prslib.h dict.h aostr.h 
$(OUTTMP)/ast.o: ast.c ast.h aostr.h 
$(OUTTMP)/aostr.o: aostr.c aostr.h 
$(OUTTMP)/prsasm.o: prsasm.c prsasm.h aostr.h lexer.h list.h dict.h cctrl.h ast.h
$(OUTTMP)/prsutil.o: prsutil.c prsutil.h aostr.h lexer.h list.h dict.h cctrl.h ast.h
$(OUTTMP)/prslib.o: prslib.c prslib.h aostr.h lexer.h list.h dict.h cctrl.h ast.h
$(OUTTMP)/x86.o: x86.c x86.h aostr.h lexer.h list.h dict.h cctrl.h ast.h
$(OUTTMP)/cctrl.o: cctrl.c cctrl.h dict.h aostr.h 
$(OUTTMP)/compile.o: compile.c dict.h lexer.h list.h aostr.h cctrl.h ast.h parser.h
