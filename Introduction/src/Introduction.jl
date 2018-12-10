
"A module to be implemented by the attendees of the Julia workshop"
module Introduction

using HTTP
export Node

"Adds a one to the provided argument"
# Implementation
add1(x::Number) = x + 1
add1(x::Array{T}) where T <: Number = x .+ 1

"Performs the division between x and why where x is numerator and y is 
denominator but returns the answer truncated to 0 decimals"
# Implementation
int_div(x::Number, y::Number)::Int64 = x ÷ y

"Accepts a value and an upper and lower bound, checks wether the value is within the range.
This function is lower inclusive and upper exclusive. If no lower bound is specified, 0 is assumed"
# Implementation
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

"Finds the largest value in the provided container using the provided function
This function assumes that the provided container contains at least one element"
# Implementation
function max(f::Function, x::T) where T <: AbstractArray
    largest = x[1]
    for v in x
        largest = if f(v, largest) v else largest end
    end
    return largest
end

"This function implements part of the classical problem  FizzBuzz (https://en.wikipedia.org/wiki/Fizz_buzz). 
Provided a number, it returns the correct string for the problem."
# Implementation
fizzbuzz(n::Integer)::String = if (n % 3 == 0 && n % 5 == 0) "FizzBuzz" elseif n % 3 == 0 "Fizz" elseif n % 5 == 0 "Buzz" else "$(n)" end

"Converts a string to an array of characters"
# Implementation
to_char_array(s::String)::Vector{Char} = [s...]

"Produces a string that consists of the provided string concattenated on itself n times.
Note that char is just a special case of a string and should be accepted as well"
# Implementation
self_concat(c, n::Int64)::String = c ^ n

"Concatenates s1, s2, ..., sn into s1s2...sn"
# Implementation
concatenate(s...)::String = join([s...])

"Returns the unique characters of the provided string as a new string, in order of occurrence"
# Implementation
uniq(s::String) = join(Set(s))

"Converts a string that uses space separator to a string that uses _ separator"
# Implementation
snake_case(s::String) = join(split(s), '_')

"Returns a map where each letter of the string as key and occurrencies in map as value"
# Implementation
function count_letters(s::String)::Dict{Char, Int64}
    Dict(i => count(x-> x == i, s) for i in unique(s))
end


struct Node
    id::Int
    x::Float64
    y::Float64
end
Node(s::AbstractString) = Node(parse(Int, split(s, " ")[1]), parse(Float64, split(s, " ")[2]), parse(Float64, split(s, " ")[3]))

"Fetches the nodes file at the specific url and parses it into a list of nodes which is returned
Hint: https://github.com/JuliaWeb/HTTP.jl"
# Implementation
request(url::String) = String(HTTP.request("GET", url).body)
function parse_nodes(url::String)
    lines = split(request(url), "\n")[7:end-3]
    [Node(line) for line in lines]
end

"Computes the euclidian distance between two nodes"
dist(n1::Node, n2::Node)::Float64 = sqrt((n1.x - n2.x)^2 + (n1.y - n2.y)^2)

"Finds the maximum distance between two nodes and returns a tuple containing 
the distance and the two nodes in question"
function max_dist(nodes::Vector{})::Tuple{Float64, Node, Node}
    max = 0
    n1::Node = nodes[1]
    n2::Node = nodes[2]
    for i in 1:length(nodes)
        for j in i:length(nodes)
            d = dist(nodes[i], nodes[j])
            if d > max
                max = d
                n1 = nodes[i]
                n2 = nodes[j]
            end
        end
    end
    (max, n1, n2)
end

end # module
