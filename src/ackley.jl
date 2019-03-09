# Ackley function is a unimodal non-convex function used for testing optimization algorithms.
# More info: https://en.wikipedia.org/wiki/Ackley_function

"""
    ackley(X::Array{Float64, 1})

Compute ackley function for n-th order. 
(Use ackley2d or ackley3d for easier plotting)
"""
function ackley(X::Array{Float64, 1})
    n = size(X)[1]
    sum1 = sum2 = 0
    for i in 1:n
        sum1 = sum1 + X[i]^2
        sum2 = sum2 + cos(c * X[i])
    end
    sum1 = -a * exp(-b * sqrt(sum1/n))
    sum 2 = -exp(sum2/n)
    sum1 + sum2 + a + exp(1)
end

"""
    ackley2d(x1, x2; a = 20, b = 0.2, c = 2*pi)

Compute 2-dimensional ackley function.
(All input in Float64)
"""
function ackley2d(x1::Float64, x2::Float64; a::Float64=20, b::Float64=0.2, c::Float64=2*pi)
    ackley([x1, x2])
end
"""
    ackley2dfn(X1, X2, ...)

Same as ackley2d but takes two input vectors and returns a vectors.
"""
function ackley2dfn(X1::Array{Float64, 1}, X2::Array{Float64, 1}; a::Float64=20, b::Float64=0.2, c::Float64=2*pi)
    m = size(X1)[1]
    n = size(X2)[1]
    if m != n
        println("Arrays are of unequal lengths")
        return
    end
    R = Float64[]
    for i in 1:m
        push!(R, ackley2d(X1[i], X2[i]))
    end
    R
end

"""
    ackley3d(x1, x2, x3; a = 20, b = 0.2, c = 2*pi)

Compute 3D ackley function.
(All input in Float64)
"""
function ackley3d(x1::Float64, x2::Float64, x3::Float64 a::Float64=20, b::Float64=0.2, c::Float64=2*pi)
    ackley([x1, x2, x3])
end
