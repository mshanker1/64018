
a <- read.csv("./names.csv", sep="", stringsAsFactors=FALSE)
names <- as.matrix(a) # so dealing with a character array
gs = 3 # group size


myfun <- function(ln, ss) {
  fs1 <- sample(ln,ss,replace=F)
  fs1
}

while (length(names) > gs) {
  ns <- myfun(names, gs)
  print(ns)
  names <- setdiff(names,ns);
 }

print(names)
