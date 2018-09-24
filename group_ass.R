library(lpSolveAPI)
x <-read.lp("ga.lp")
x
solve(x)
get.objective(x)


student <- get.variables(x)
get.constraints(x)

snames <- as.matrix(read.csv("./snames.txt"))
library(mefa)
snames <- rep(snames,length(student)/length(username))

Solution <- cbind(student,username)
View(Solution)
