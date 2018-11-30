"A module to be implemented by the attendees of the Julia workshop"
module Introduction

"Adds a one to the provided argument"
add1(x::Number) = x + 1
add1(x::Array{T}) where T <: Number = x .+ 1

"Performs the division between x and why where x is numerator and y is 
denominator but returns the answer truncated to 0 decimals"
int_div(x::Number, y::Number)::Int64 = x ÷ y

"Accepts a value and an upper and lower bound, checks wether the value is within the range.
This function is lower inclusive and upper exclusive. If no lower bound is specified, 0 is assumed"
function in_range(x::Number, bounds...)
    lower = length(bounds) < 2 ? 0 : bounds[1]
    upper = bounds[end]
    lower <= x < upper
end
function in_range(x::Array{Int64}, bounds...)
    lower = length(bounds) < 2 ? 0 : bounds[1]
    upper = bounds[end]
    lower .<= x .< upper
end

end # module
