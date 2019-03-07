# Sphere function is continous, convex unimodal funtion.
# It is one of the basic functions used for optimization testing.
# More information: https://en.wikipedia.org/wiki/Test_functions_for_optimization

"""
    spherefn(X)
    
Compute the sphere function for supplied values of x and return the value.    
"""
function spherefn(X)
    n = size(X)[1]
    sum = 0
    for i in 1:n
        sum += X[i]^2
    end
    sum
end

"""
    spherepfn(X)
    
Compute the modified sphere function for supplied values of x and return the value.
"""
function spherefpn(X)
    n = size(X)[1]
    sum = 0
    for i in 1:n
        sum += X[i]^2 * 2^i
    end
    sum -= 1745
    sum = (1/899)*sum
end
