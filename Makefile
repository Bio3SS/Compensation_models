## This is Compensation_models, a project directory under Bio3SS
## makestuff/project.Makefile

current: target
-include target.mk

# include makestuff/perl.def

######################################################################

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

Sources += Makefile

## Sources += content.mk
## include content.mk

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

export ms = makestuff
-include makestuff/os.mk

-include makestuff/wrapR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
