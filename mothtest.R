
library(shellpipes)

loadEnvironments()
startGraphics()

set.seed(seed)

print(mothGeneration(reproductiveFemales=startFemales
	, fecundity=fecundity
	, femaleProb=femaleProb
	, hatchProb=hatchProb
	, pupateProb=pupateProb
	, ecloseProb=ecloseProb
	, repProb=repProb
))

print(mothGeneration(reproductiveFemales=startFemales
	, fecundity=fecundity
	, femaleProb=femaleProb
	, hatchProb=hatchProb
	, pupateProb=pupateProb
	, ecloseProb=ecloseProb
	, repProb=repProb
))

print(mothGeneration(reproductiveFemales=startFemales
	, fecundity=fecundity
	, femaleProb=femaleProb
	, hatchProb=hatchProb
	, pupateProb=pupateProb
	, ecloseProb=ecloseProb
	, repProb=repProb
))

mothSimulation(reproductiveFemales=startFemales
	, fecundity=fecundity
	, femaleProb=femaleProb
	, hatchProb=hatchProb
	, pupateProb=pupateProb
	, ecloseProb=ecloseProb
	, repProb=repProb
	, numYears=numYears
)

mothSimulation(reproductiveFemales=startFemales
	, fecundity=fecundity
	, femaleProb=femaleProb
	, hatchProb=hatchProb
	, pupateProb=pupateProb
	, ecloseProb=ecloseProb
	, repProb=repProb
	, numYears=numYears
)

mothSimulation(reproductiveFemales=startFemales
	, fecundity=fecundity
	, femaleProb=femaleProb
	, hatchProb=hatchProb
	, pupateProb=pupateProb
	, ecloseProb=ecloseProb
	, repProb=repProb
	, numYears=numYears
)

