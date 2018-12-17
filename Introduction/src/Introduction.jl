
"A module to be implemented by the attendees of the Julia workshop"
module Introduction

export Node
struct Node
    id::Int
    x::Float64
    y::Float64
end

"Adds a one to the provided argument"
# Implementation:
add1(x::Number) = x + 1 # Example solution

"Performs the division between x and why where x is numerator and y is 
denominator but returns the answer truncated to 0 decimals"
# Implementation:

"Accepts a value and an upper and lower bound, checks wether the value is within the range.
This function is lower inclusive and upper exclusive. If no lower bound is specified, 0 is assumed"
# Implementation:

"Finds the largest value in the provided container using the provided function
This function assumes that the provided container contains at least one element"
# Implementation:

"This function implements part of the classical problem  FizzBuzz (https://en.wikipedia.org/wiki/Fizz_buzz). 
Provided a number, it returns the correct string for the problem."
# Implementation:

"Converts a string to an array of characters"
# Implementation:

"Produces a string that consists of the provided string concattenated on itself n times.
Note that char is just a special case of a string and should be accepted as well"
# Implementation:

"Concatenates s1, s2, ..., sn into s1s2...sn"
# Implementation:

"Returns the unique characters of the provided string as a new string, in order of occurrence"
# Implementation:

"Converts a string that uses space separator to a string that uses _ separator"
# Implementation:

"Returns a map where each letter of the string as key and occurrencies in map as value"
# Implementation:

"Turns a string into a list of the corresponding bits"
# Implementation:

"Fetches the nodes file at the specific url and parses it into a list of nodes which is returned
Hint: https://github.com/JuliaWeb/HTTP.jl"
# Implementation:

"Computes the euclidian distance between two nodes"
# Implementation:

"Finds the maximum distance between two nodes and returns a tuple containing 
the distance and the two nodes in question"
# Implementation:


"Reads the CSV file into a dataframe.
Hint: https://github.com/JuliaData/CSV.jl
Hint: https://github.com/JuliaData/DataFrames.jl"
# Implementation:

"Returns a dictionary containing the fraction of males and femails respectively"
# Implementation:

"Computes which group from the group column that, on average, has the highest math score"
# Implementation:

"Turns a categorical vector into its one hot encoded correspondance
see: https://www.quora.com/What-is-one-hot-encoding-and-when-is-it-used-in-data-science"
# Implementation:


end # module
