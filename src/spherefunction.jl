# Sphere function is continous, convex unimodal funtion.
# It is one of the basic functions used for optimization testing.
# More information: https://en.wikipedia.org/wiki/Test_functions_for_optimization

"""
    spherefn(x1, x2)
    
Compute the sphere function for supplied values of x and return the value.
Note: Please use sphere(X, Y) for computing sphere function.    
"""
function spherefn(x1::Float64, x2::Float64)
    sum = x1^2 + x2^2
end

"""
    sphere(X, Y)

Compute the sphere function for given vectors X and Y.
Return a vector containing the result. 
"""
function sphere(X::Array{Float64, 1}, Y::Float64{Float64, 1})
    m = size(X)[1]
    n = size(Y)[1]
    if m!=n
        println("Invalid input: Supplied vectors must be of same size")
        return
    end
    R = Array{Float64, 1}
    for i in 1:m
        push!(R, spherefn(X[i], Y[i]))
    end
    R
end

"""
    spherep(X)
    
Compute the modified sphere function for supplied values of x and return the value.
"""
function spherep(X::Array{Float64, 1})
    n = size(X)[1]
    sum = 0
    for i in 1:n
        sum += X[i]^2 * 2^i
    end
    sum -= 1745
    sum = (1/899)*sum
end
