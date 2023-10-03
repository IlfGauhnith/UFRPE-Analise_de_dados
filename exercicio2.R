334+456
900/45

x <- 133
y <- 36

z <- x + y
z

sqrt_z <- sqrt(z)
sqrt_z

round(log(sqrt_z), digits=0)

help(demo)

demo()
demo(graphics)
demo(plotmath)

rm(list=ls())

sum((10:20)^2)

fibonacci <- function(n) {
  fib_seq <- list(0, 1)
  for (i in 3:n) {
    fib_seq[i] <- fib_seq[[i - 1]] + fib_seq[[i - 2]] 
  } 
  
  return(fib_seq)
}


fib_seq <- fibonacci(5)
sumup <- sum(unlist(fib_seq))
log_sumup <- log(sumup)

help(round)
rounded <- round(log_sumup, digits=3)
rounded



help(deriv)
example(deriv)

dx <- deriv(~ sin(x) + x, "x")
dx

mode(dx)
x <- 2
dx_value <- eval(dx)
round(attr(dx_value, "gradient"), digits=3)

fact <- factorial(10)
round(log(fact, 10), digits=2)


light_speed <- 300000000 
energy = 10 * (light_speed^2)
round(energy, digits=2)


v <- c(2,5,7,8,9)
f_values = lapply(v, function(x) {x^3 + x^2 + x})
f_values_mean = mean(unlist(f_values))
f_values_mean
