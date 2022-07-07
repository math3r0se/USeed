VERSION = 0
PATCHLEVEL = 0
SUBLEVEL = 0
EXTRAVERSION = 2
NAME = useed

ifeq ($(OS),Windows_NT)
    CCFLAGS += -D WIN32
	OUTPUT_FILE = $(NAME).exe
    ifeq ($(PROCESSOR_ARCHITEW6432),AMD64)
        CCFLAGS += -D AMD64
    else
        ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
            CCFLAGS += -D AMD64
        endif
        ifeq ($(PROCESSOR_ARCHITECTURE),x86)
            CCFLAGS += -D IA32
        endif
    endif
else
	OUTPUT_FILE = $(NAME)
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        CCFLAGS += -D LINUX
    endif
    ifeq ($(UNAME_S),Darwin)
        CCFLAGS += -D OSX
    endif
    UNAME_P := $(shell uname -p)
    ifeq ($(UNAME_P),x86_64)
        CCFLAGS += -D AMD64
    endif
    ifneq ($(filter %86,$(UNAME_P)),)
        CCFLAGS += -D IA32
    endif
    ifneq ($(filter arm%,$(UNAME_P)),)
        CCFLAGS += -D ARM
    endif
endif


CC = gcc
STANDARD = gnu89
LIBRARY = -Ilib
CFLAGS = -Wall -Wextra -Werror --std=$(STANDARD) $(LIBRARY) -pedantic -O2 -g -o $(OUTPUT_FILE)
MAIN_SRC = main.c

build:
	- $(CC) $(MAIN_SRC) $(CFLAGS)

extraversion_release:
	- @git add .
	- @git commit -m "Build $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)-rc$(EXTRAVERSION)"
	- @git push
	- @git tag -a $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)-rc$(EXTRAVERSION) -m "Build $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)-rc$(EXTRAVERSION)"
	- @git push --tags

subversion_release:
	- @git add .
	- @git commit -m "Build $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)
	- @git push
	- @git tag -a "v$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)" -m "Build $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)"
	- @git push --tags

patch_release:
	- @git add .
	- @git commit -m "Build $(VERSION).$(PATCHLEVEL)
	- @git push
	- @git tag -a "v$(VERSION).$(PATCHLEVEL)" -m "Build $(VERSION).$(PATCHLEVEL)"
	- @git push --tags

major_release:
	- @git add .
	- @git commit -m "Build $(VERSION)
	- @git push
	- @git tag -a "v$(VERSION)" -m "Build $(VERSION)"
	- @git push --tags