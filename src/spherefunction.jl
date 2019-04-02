# Sphere function is continous, convex unimodal funtion.
# It is one of the basic functions used for optimization testing.
# More information: https://en.wikipedia.org/wiki/Test_functions_for_optimization

export sphere, spherefn, spherep

"""
    sphere(x1::Float64, x2::Float64)

Compute the sphere function for supplied values of x and return the value.
Note: Please use spherefn(X, Y) for computing sphere function.
"""
function sphere(x1, x2)
    sum = x1^2 + x2^2
end

"""
    spherefn(X::ArrayVector, Y::ArrayVector)
    spherefn(X::ArrayMatrix)

Compute the sphere function for given vectors X and Y.
Return a vector containing the result.
"""
function spherefn(X::AbstractVector, Y::AbstractVector)
    m = size(X, 1)
    n = size(Y, 1)
    if m!=n
        println("Invalid input: Supplied vectors must be of same size")
        return
    end
    R = eltype(X)[]
    for i in 1:m
        val = sphere(X[i], Y[i])
        push!(R, val)
    end
    R
end

function spherefn(X::AbstractMatrix)
    m = size(X, 1)
    return spherefn(X[:,1], X[:,2])
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


using Plots

A = Array{Float64, 1}(-5.12:0.12:5.12)
B = Array{Float64, 1}(-5.12:0.12:5.12)
@show r = spherefn(A, B)

plot(A, B, r)
