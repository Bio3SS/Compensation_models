pdf("RTARGET.pdf", width=10, height=7)
par(mfrow=c(1, 2))
for(R in seq(0.8, 4.0, by=0.02)){
	discrete_pop(R=R, statplots="p")
}
