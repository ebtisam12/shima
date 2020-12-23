# Uncomment if you havn't already installed the package
# install.packages("lpSolve")
library(lpSolve)

?lp

# Objective function coefficients
obj_coeff <- c(13,23,30)

# Constraint coefficients
constraints <- matrix(c(5,15,10, #CO2
                        4,4,4, #Water
                        35,20,15, #Flavor
                        5,10,20 #hours
                        
), 
nrow = 4, byrow = TRUE)

# Direction of logical operators
direction <- c("<=", 
               "<=",
               "<=",
               "<="
)

# Resources (Right hand side constraints)
resources <- c(480,
               160,
               1190,
               200  # 5*8=40 then 40*5=200, 20 working days for hours of labor to make and we have only 5 employees full-time.
)

# Create the lp
sol<-lp(
  "max", 
  obj_coeff, 
  constraints, 
  direction, 
  resources)

# Max Profit
sol$objval

# Best values for objective function
sol$solution