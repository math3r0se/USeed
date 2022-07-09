VERSION = 0
PATCHLEVEL = 1
SUBLEVEL = 1
EXTRAVERSION = 2
NAME = useed

CC = gcc
STANDARD = gnu89
LIBRARY = -Ilib
CFLAGS = -Wall -Wextra -Werror --std=$(STANDARD) $(LIBRARY) -pedantic -O2 -g -o useed
MAIN_SRC = src/main.c

build:
	- $(CC) $(MAIN_SRC) $(CFLAGS)

extraversion_release:
	- @git add .
	- @git commit -m "Build $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)-rc$(EXTRAVERSION)"
	- @git push
	- @git tag -a "v$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)-rc$(EXTRAVERSION)" -m "Build $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)-rc$(EXTRAVERSION)"
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