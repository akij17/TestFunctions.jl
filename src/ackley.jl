# Ackley function is a unimodal non-convex function used for testing optimization algorithms.
# More info: https://en.wikipedia.org/wiki/Ackley_function

"""
    ackley(X::Array{Float64, 1})

Compute ackley function for n-th order.
(Use ackley2d for easier plotting)
"""
function ackley(X::AbstractVector; a, b, c)
    n = size(X)[1]
    sum1 = sum2 = 0
    for i in 1:n
        sum1 = sum1 + X[i]^2
        sum2 = sum2 + cos(c * X[i])
    end
    sum1 = -a * exp(-b * sqrt(sum1/n))
    sum2 = -exp(sum2/n)
    sum1 + sum2 + a + exp(1)
end

"""
    ackley2dfn(X1, X2; a=20, b=0.2, c=2π)

Same as ackley2d but takes two input vectors and returns a vectors.
"""
function ackley2dfn(X1::AbstractVector, X2::AbstractVector; a::Number=20, b::Number=0.2, c::Number=2*pi)
    m = size(X1, 1)
    n = size(X2, 1)
    if m != n
        println("Arrays are of unequal lengths")
        return
    end
    R = eltype(X1)[]
    for i in 1:m
        push!(R, ackley([X1[i], X2[i]], a = a, b = b, c = c))
    end
    R
end

#=
using Plots
A = Array{Float64, 1}(-32.7:0.7:32.7)
B = Array{Float64, 1}(-32.7:0.7:32.7)
r = ackley2dfn(A, B)
plot(A, B, r)
=#
