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
*	all.mk: template for one single program, created from C
	program files has the possible targets all, clean,
	install and uninstall
*	inst.mk: installs the target to $(PREFIX), has the targets
	install and uninstall
*	mult.mk: makefile that installs and uninstalls multiple
	targets and their man-pages.
*	mult_all.mk: makefile template for a project with two
	libraries. Can of course be expanded to more libraries.
* template.1: man-page template file

But, in fact, every file in this project is somewhat a template,
look for example at the README.md and the license file.

License
=======

MIT license, more details in ./LICENSE.
