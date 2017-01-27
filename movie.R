Nc <- 40
for(R in seq(1.1, 4.0, by=0.02)){
	simPlot(N=Nc, f0=exp(R), fDD=2*Nc, p0=0, pDD=NULL)
}
