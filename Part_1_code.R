##Statistical Inference - Course Project Part 1

# choosing a baseline seed for replicability


set.seed(2021)

lambda <- 0.2

number_of_exponentials <- 40

simulations_number <- 1000

running_simulation <-
  replicate(simulations_number, rexp(number_of_exponentials, lambda))
#replicate(n, expr, simplify = "array")// replicate is a wrapper for the common use of sapply
#for repeated evaluation of an expression (which will usually involve random number generation).

means_of_simulation_exponential <- sapply(running_simulation, mean)

means_of_simulation_exponential_apply <- apply(running_simulation, 2, mean) 
#a vector giving the subscripts which the function will be applied over. E.g., for a matrix 1 indicates rows, 2 indicates columns, 
#c(1, 2) indicates rows and columns. Where X has named dimnames, it can be a character vector 
#selecting dimension names.


hist(means_of_simulation_exponential,breaks = 100)
hist(means_of_simulation_exponential_apply, breaks = 400,xlim = c(1.5,8.99), ylim = c(0,20), col = "red", main = "Histogram of the Simulated Means of the Exponential Function", xlab = "Means of the Exponential Simulation")


#The mean of the exponential distribution is 1/lambda

mean_of_exponential_distribution <- 1/lambda


hist(means_of_simulation_exponential_apply, breaks = 400,xlim = c(1.5,8.99), ylim = c(0,20), col = "red", main = "Theoretical Mean vs. Actual Mean", xlab = "Means of the Exponential Simulation")

abline(v=mean(means_of_simulation_exponential_apply), lwd="2", col="green")


abline(v=mean(mean_of_exponential_distribution), lwd="2", col="purple")

print(mean(means_of_simulation_exponential_apply))

print(mean_of_exponential_distribution)

#the sample mean is almost identical to the mean of the theoretical distribution
