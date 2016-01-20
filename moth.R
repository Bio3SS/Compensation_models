mothGeneration <- function(reproductiveFemales, fecundity, femaleProb, hatchProb, pupateProb, ecloseProb, repProb){
	eggs <- sum(rpois(reproductiveFemales, fecundity))
	femaleEggs <- rbinom(n=1, size=eggs, prob=femaleProb)
	femaleLarvae <- rbinom(n=1, size=femaleEggs, prob=hatchProb)
	femalePupae <- rbinom(n=1, size=femaleLarvae, prob=pupateProb)
	femaleAdults <- rbinom(n=1, size=femalePupae, prob=ecloseProb)
	newReproductiveFemales <- rbinom(n=1, size=femaleAdults, prob=repProb)

	return(c(reproductiveFemales=reproductiveFemales
		, eggs=eggs
		, femaleEggs=femaleEggs
		, femaleLarvae=femaleLarvae
		, femalePupae=femalePupae
		, femaleAdults=femaleAdults
		, newReproductiveFemales=newReproductiveFemales
	))
}

mothSimulation <- function(reproductiveFemales, fecundity, femaleProb, hatchProb, pupateProb, ecloseProb, repProb, numYears){
	years <- 1:numYears
	for (y in years){
		sim <- mothGeneration(reproductiveFemales[[y]], fecundity,
			femaleProb, hatchProb, pupateProb, ecloseProb, repProb)
		reproductiveFemales <- c(reproductiveFemales,
			sim[["newReproductiveFemales"]])
	}
	plot(c(0, years), reproductiveFemales, type="b")
}

