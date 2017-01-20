options(device.ask.default=grDevices::dev.interactive(orNone = TRUE))

ffun <- function(N, f0, Nc){
	if(is.null(Nc)) return(0*N+f0)
	return(f0*exp(-N/Nc))
}

pfun <- function(N, p0, Nc){
	if(is.null(Nc)) return(0*N+p0)
	return(p0*exp(-N/Nc))
}

ratePlot <- function(N, f, mu,
	legendSize, title="", eps=0.1, lpos="topright"
){
	if (title==""){title <- "Rates"}
	plot(N, f
		, xaxs="i", yaxs="i"
		, ylim=c(0, max(max(f), min(mu+eps)))
		, xlab = "Population size"
		, ylab = "Per capita values"
		, type = "l", lwd=2, col="blue", main=title
		, cex=3
	)
	lines(N, mu, lty=2)
	legend(lpos, cex=legendSize,
		legend = c("Fecundity", "Mortality"),
		col = c("blue", "black"),
		lty = c(1, 2)
	)
}

stepPlot <- function(N, f, p, title=""){
	if (title==""){title <- "Step-forward"}
	Np <- (f+p)*N
	plot(N, Np, xaxs="i", yaxs="i",
		ylim=c(0, max(Np)),
		xlab = expression(N[T]),
		ylab = expression(N[T+1]),
		type = "l", lwd=2, col="blue", main=title
	)
	abline (a=0, b=1, lty=3, lwd=2)
}

lamPlot <- function(N, f, p, title=""){
	if (title==""){title <- "Rate of increase"}
	lam <- (f+p)
	plot(N, lam, xaxs="i", yaxs="i",
		ylim=c(0, max(lam)),
		xlab = expression(N[T]),
		ylab = expression(lambda),
		type = "l", lwd=2, col="blue", main=title
	)
	abline (h=1, lty=3, lwd=2)
}

simPlot <- function(N=1, f0, fDD, p0, pDD, timeSteps=40, title=""){
	t = 0:timeSteps
	for (i in 1:timeSteps){
		N[i+1] <- N[i]*(ffun(N[i], f0, fDD) + pfun(N[i], p0, pDD))
	}
	if (title==""){title <- "Time series"}
	plot(t, N,
		type = "l", lwd=2,
		xlab = "Time steps", ylab="Population", main=title
	)
}

discrete_pop <- function(N0=1, Nmax=100,
	f0=4, fDD=50,
	p0=0, pDD=NULL,
	legendSize=1, timeSteps=40, title=""
){
	N <- 0:Nmax
	f <- ffun(N, f0, fDD)
	p <- pfun(N, p0, pDD)
	mu <- 1 - p
	ratePlot(N, f, mu, legendSize=legendSize, title=title)
	if(!is.null(N0)) {
		simPlot (N0, f0, fDD, p0, pDD, timeSteps, title=title)
	}

	lamPlot(N, f, p, title=title)
	stepPlot(N, f, p, title=title)

}
