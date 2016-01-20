# Compensation_models
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: mothtest.Rout 

##################################################################


# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.R)

%.plots.Rout: discrete_pop.Rout par.R %.R
	$(run-R)

movie.Rout: discrete_models.Rout movie.R
movie.pdf: movie.Rout ;
movie-%.png: movie.pdf
	convert $< movie.png

### Moths
mothtest.Rout: moth_params.Rout moth.Rout mothtest.R

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
