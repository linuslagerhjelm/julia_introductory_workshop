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
function in_range(x::Array{T}, bounds...) where T <: Number
    lower = length(bounds) < 2 ? 0 : bounds[1]
    upper = bounds[end]
    lower .<= x .< upper
end

"This function implements part of the classical problem  FizzBuzz (https://en.wikipedia.org/wiki/Fizz_buzz). 
Provided a number, it returns the correct string for the problem."
fizzbuzz(n::Integer)::String = if (n % 3 == 0 && n % 5 == 0) "FizzBuzz" elseif n % 3 == 0 "Fizz" elseif n % 5 == 0 "Buzz" else "$(n)" end

"Converts a string to an array of characters"
to_char_array(s::String)::Vector{Char} = [s...]

"Produces a string that consists of the provided string concattenated on itself n times.
Note that char is just a special case of a string and should be accepted as well"
self_concat(c, n::Int64)::String = c ^ n

"Concatenates s1, s2, ..., sn into s1s2...sn"
concatenate(s...)::String = join([s...])

"Returns the unique characters of the provided string as a new string, in order of occurrence"
uniq(s::String) = join(Set(s))

"Converts a string that uses space separator to a string that uses _ separator"
snake_case(s::String) = join(split(s), '_')

"Returns a map where each letter of the string as key and occurrencies in map as value"
function count_letters(s::String)::Dict{Char, Int64}
    Dict(i => count(x-> x == i, s) for i in unique(s))
end


end # module
