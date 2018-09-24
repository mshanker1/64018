library(lpSolveAPI)
# Demonstrate IP Branch-and-Bound
sp1 <- make.lp(0, 2) # number of constraints, number of decision variables
#Defaults to Minimize objective function
set.objfn(sp1, c(-8, -5))
add.constraint(sp1, c(1, 1), "<=", 6)
add.constraint(sp1, c(9, 5), "<=", 45)
RowNames <- c("Labor", "Wood")
ColNames <- c("Tables", "Chairs")
dimnames(sp1) <- list(RowNames, ColNames)
sp1
# Alternatively, write your model in lp format
write.lp(sp1,'IP_BB.lp',type='lp') # we will use this format soon
solve(sp1)
get.objective(sp1) * -1
get.variables(sp1)

# Now, we have a choice. We will consider values for x1 <=3 (subproblem 3), and x1 >= 4 (sp 2)

# Subproblem 2 = SP1 +  x1 >= 4
sp2 <- make.lp(0, 2) # number of constraints, number of decision variables
set.objfn(sp2, c(-8, -5))
add.constraint(sp2, c(1, 1), "<=", 6)
add.constraint(sp2, c(9, 5), "<=", 45)
add.constraint(sp2,c(1,0),">=",4)
solve(sp2)
get.objective(sp2) * -1
get.variables(sp2)

# SP 4 = SP 2 + x2 >= 2
sp4 <- make.lp(0, 2) # number of constraints, number of decision variables
set.objfn(sp4, c(-8, -5))
add.constraint(sp4, c(1, 1), "<=", 6)
add.constraint(sp4, c(9, 5), "<=", 45)
add.constraint(sp4,c(1,0),">=",4)
add.constraint(sp4,c(0,1),">=",2)
solve(sp4)
get.objective(sp4) * -1 # This solution is infeasible
get.variables(sp4)

# SP 5 = SP 2 + x2 <= 1
sp5 <- make.lp(0, 2) # number of constraints, number of decision variables
set.objfn(sp5, c(-8, -5))
add.constraint(sp5, c(1, 1), "<=", 6)
add.constraint(sp5, c(9, 5), "<=", 45)
add.constraint(sp5,c(1,0),">=",4)
add.constraint(sp5,c(0,1),"<=",1)
solve(sp5)
get.objective(sp5) * -1 
get.variables(sp5)

# SP 6 = SP 5 + x1 >= 5
sp6 <- make.lp(0, 2) # number of constraints, number of decision variables
set.objfn(sp6, c(-8, -5))
add.constraint(sp6, c(1, 1), "<=", 6)
add.constraint(sp6, c(9, 5), "<=", 45)
add.constraint(sp6,c(1,0),">=",5)
add.constraint(sp6,c(0,1),"<=",1)
solve(sp6)
get.objective(sp6) * -1 
get.variables(sp6) # This is a feasible solution

# SP 7 = SP 5 + x1 <= 4
sp7 <- make.lp(0, 2) # number of constraints, number of decision variables
set.objfn(sp7, c(-8, -5))
add.constraint(sp7, c(1, 1), "<=", 6)
add.constraint(sp7, c(9, 5), "<=", 45)
add.constraint(sp7,c(1,0),"=",4)
add.constraint(sp7,c(0,1),"<=",1)
solve(sp7)
get.objective(sp7) * -1 
get.variables(sp7) # This is also feasbile, but lower than SP6

# Our best solution is so far SP6 with objective of 40.
# Now, we explore the other branch, SP 3

# Subproblem 3 = SP1 +  x1 <= 3
sp3 <- make.lp(0, 2) # number of constraints, number of decision variables
set.objfn(sp3, c(-8, -5))
add.constraint(sp3, c(1, 1), "<=", 6)
add.constraint(sp3, c(9, 5), "<=", 45)
add.constraint(sp3,c(1,0),"<=",3)
solve(sp3)
get.objective(sp3) * -1
get.variables(sp3)
# The solution to SP3 gives an objective of 39 < SP6 of 40. Further, you will not get a better IP solution
# from SP3 branch. Hence our optimal solution is SP6.
