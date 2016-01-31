Template files
==============

I realized there is usually some kind of structure
in my makefiles and man-pages, these are just some little
files I use as templates.

The makefiles in this repo have one advantage over lots of other makefile:
they include an uninstall option.

Files
=====

* config.mk: template for makefile configuration
*	makefile_all: depends on config.mk, template
	for one single program, created from C program files
	has the possible targets all, clean, install and uninstall
*	makefile_inst: also depends on config.mk, but installs the target
	to $(PREFIX), has the targets install and uninstall
* template.1: man-page template file

License
=======

MIT license, more details in ./COPYING.
