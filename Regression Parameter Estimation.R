library("GA")
library("GenSA")
library(ggplot2)

x <- c(61, 63, 67, 69, 70, 74, 76, 81, 86, 91, 95, 97)
y <- c(4.28, 4.08, 4.42, 4.17, 4.48, 4.3, 4.82, 4.7, 5.11, 5.13, 5.64, 5.56)

m <- data.frame(x,y)

obj <- function(a,b) {
  r <- y - (a+b*x)
  out <- sum(r^2)
}

objx <- function(c) {
  r <- y - (c[1]+c[2]*x)
  out <- sum(r^2)
}

# GA only does maximization, so convert objective to minimization
objGA <- function(z) {
  -obj(z[1],z[2])
}

# SA does minimization
objSA <- function(z) {
  obj(z[1],z[2])
}

lower <- c(0,0)
upper<- c(5,2)
par <- c(1,0)

outGA <- ga(type="real-valued",fitness=objGA,lower=lower,upper=upper)

summary(outGA)


out <- GenSA(par=par,lower=lower,upper=upper,fn= objx)
out[c("value","par","counts")]

p <- ggplot(data=m,aes(x,y)) + geom_point() + stat_smooth(aes(color="Linear Regression"),method="lm",se=F) + 
  geom_abline(aes(intercept=out$par[1],slope=out$par[2],color="Simulated Annealing"),linetype="dotted") +
  geom_abline(aes(color="Genetic Algorithm",intercept=outGA@solution[1],slope=outGA@solution[2]),linetype="dashed")  + ggtitle("Line Plots") + scale_color_manual(name="Legend",values = c('Linear Regression'="Black",'Simulated Annealing'="Red","Genetic Algorithm"="Green"))
p + guides(color=guide_legend(override.aes = list(size=1, linetype=c(1,1,1))))


