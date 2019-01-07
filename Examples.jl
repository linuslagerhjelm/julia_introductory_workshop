
# This document is intended to introduce basic concepts in Julia using examples
# The code could be copy and pasted into the REPL to display the result
# and allow for experimentation.

# This is how we define a module
module Examples

# Functions can be one-liners
say(s) = println("Hello $(s)")

# Or they can span multiple rows
function say_numbers(n)
    # Loops are written much like in MATLAB
    for i in 1:n
        println(i)
    end # Blocks ends with the end keyword
end

# Functions can also be anonymous and passed around as values
double = x -> 2x
map(double, 1:10)

# The return value of a function can also be piped to other functions
map(double, 1:10) |> println

# Note how we did not need to specify * in the previous example.

# This is because julia recognizes the math syntax and assumes 
# that we want to do multiplication. It also does neat things
# to make it easy to write math expressions:

1 ≤ 2 # function <= implemented as ≤
[1,2,3] ⊆ [1,2,3,4,5] # ⊆ defines the function, "is subset"
π # pi is defined as the symbol π (regular `pi` could also be used)
# These chars can be aquired by typing \pi <tab> into the REPL

# Not all mathematical symbols are predefined in julia. However if
# you would like to use one that is not, julia allows unicode 
# which means that you can define the functionality of whatever
# symbol you want
∑ = sum 
∑(1:10)

# This also means that one can do nonsense things like
👻 = () -> "BOOOOh!"
👻()
# (Don't ever actually do this)

# As we saw earlier, Julia supports ranges using the : operator.
# It also supports python like list comprehensions:
doubles = [2x for x in 1:10]

# Working with lists is easy when doing vectorization.
# Using . will apply the operation to all elements in an array.
a = 1:10
doubles = a .* 2

# We can define some abstract type
abstract type Person end

# We can also define some concrete types that subtypes our person.
# Note that only concrete types can have fields and that we can only
# inherit from abstract types.
struct Child <: Person
    age::Int
    name::String
end
struct Adult <: Person
    age::Int
    name::String
end

# If we want to define a function that instantiates our new type, it can be done as follows.
# Due to the fact that abstract types are also objects, we can not declare the function as 
# returning a person, instead we must return a generic type and specify that it will be
# a subtype of Person.
function create_person(age::Int, name::String)::T where T <: Person
    # The last statement in a function is  impicitly returned, our you could use the explicit `return` keyword.
    # This is also true for if blocks, meaning that we can return a new Person instance like this.
    if age > 18 Adult(age, name) else Child(age, name) end
end

# We saw how to produce lists using list comprehensions earlier but if we want, we could also
# declare them as empty and add things to them later.
v = Array{Int, 1}()

# There are no methods in julia, instead, functions are defined as operating on different
# types. The exact function is chosen using the multiple dispatch system. Using ! at the end
# of a method name is a convention in julia to indicate that it will change one or more
# its areguments. In this case, it will append 1 to v.
push!(v, 1)

# If we wanted to produce the same list in a non mutating way, it could be done by
# using the splat operator:
v1 = [v..., 1]

# In the statement above, Array{Int, 1}, we provide 1 to declare a 1-dimentional array.
# This is generalized and by replacing 1 with an arbitrary value n we can produce an
# n-dimentional array. However, most often in practice, only 1D and 2D arrays are
# needed and for convencience, julia provides alias for Array{Int, 1} & Array{Int, 2}
v = Vector{Int}() # Create empty 1D - array
m = Matrix{Int}(undef, 10, 10) # Creates a 10x10 matrix (2D - array)

# Indexing a matrix in julia is more similar to MATLAB than other languages.
# Julia is column major so in order to efficiently iterate a matrix,
# one need to flip the i and j loop variables
m = randn(10, 10)
msum = zeros(eltype(m), size(m, 1))
for j = 1:size(m,2) # size() returns an n-tuple with the size for each dimention of the array
    for i = 1:size(m,1)
        msum[i] += m[i,j]
    end
end

# Oh and by the way, Julia, like most other reasonable languages, start indexing at 1 and not 0.

# Notice that we can reasign a variable to anything we like, this is because,
# variables does not have types, only values have a type.
a = 1
a = "some string"

# If we really really want a variable to be of a specific type, we can make the type explicit
function f()
    x::String = "Some string"
end

# The do syntax is an interesting concept of julia.
# We can pass a function as a callback to another function like:
filter(x -> x > 10, 2:2:20)

# However, if we want our function to span multiple lines, we can extract it using the do keyword:
map(2:2:20) do x
    if x > 10
        "Large"
    else
        "Small"
    end
end

# This is utilized when working with files to have them automatically close when we are done with them:
open("tmp", "w") do f
    for i in 1:10
        write(f, "Loop number: $(i)\n")
    end
end


# A powerful concept in Julia is Macros which conceptually works the same way as macros in any other
# language. The difference in Julia is that the macro is expanded before the code is sent to the backend
# compiler, meaning that we can get static checking of our expanded code and reducing the need to evaluate
# the macro at runtime. It is a quite advanced concept and more information can be found at: 
# https://en.wikibooks.org/wiki/Introducing_Julia/Metaprogramming

# A basic macro definition could be:
macro run(f)
    return :( $f() )
end
@run () -> println("Hello, world!")

# This is the end of the examples section, you are now officially an expert at Julia!

end # module
