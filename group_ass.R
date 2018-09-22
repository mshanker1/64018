library(lpSolveAPI)
x <-read.lp("group_ass.lp")
x
solve(x)
get.objective(x)
get.variables(x)
get.constraints(x)
