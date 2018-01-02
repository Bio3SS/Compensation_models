# Compensation_models
### Hooks for the editor to set the default target
current: target
-include $(ms)/target.mk

##################################################################


# make files

Sources = Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.R)

stable.plots.Rout: stable.R

%.plots.Rout: discrete_pop.Rout par.R %.R
	$(run-R)

movie.Rout: discrete_pop.Rout movie.R

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
