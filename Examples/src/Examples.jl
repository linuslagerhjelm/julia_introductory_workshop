
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

# Note how we did not need to specify * in the previous example.
# This is because julia recognizes the math syntax and assumes 
# that we want to do multiplication. It also does neat things
# to make it easy to write math expressions:

1 ≤ 2 # function <= implemented as ≤
[1,2,3] ⊆ [1,2,3,4,5] # ⊆ defines the function, "is subset"
π # pi is defined as the symbol π (regular `pi` could also be used)
# These chars can be aquired by writing \pi <tab> into the REPL

# Not all mathematical symbols are predefined in julia, however if
# you would like to use one, julia allows unicode which means
# that you can define your own
∑ = sum 
∑(1:10)

# This also means that one can do nonsense things like
👻 = () -> "BOOOOh!"
👻()
# (Don't ever actually do this)

# As we saw earlier, Julia supports ranges using the : operator
# It also supports python like list comprehensions
doubles = [2x for x in 1:10]

# Working with lists is easy when doing vectorization
# Using . will apply the operation to all elements in an array
a = 1:10
doubles = a .* 2

# We can define some abstract type
abstract type Person end

# We can also define some concrete types that inherits from our person
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

# If we want to define a function that instantiates our new type, it can be done as follows
# Due to the fact that abstract types are also object, we can not declare the function as 
# returning a person, instead we must return a generic type and specify that it will be
# a subtype of Person
function create_person(age::Int, name::String)::T where T <: Person
    # The last statement in a function is  impicitly returned, our you could use the explicit `return` keyword
    # This is also true for if blocks, meaning that we can return a new Person instance like this
    if age > 18 Adult(age, name) else Child(age, name) end
end

# We saw how to produce lists using list comprehensions earlier but if we want, we could also
# Declare them as empty and add things to them later
v = Array{Int, 1}()

# There are no methods in julia, instead, functions are defined for working on different
# types, the method is chosen using the multiple dispatch system. Using ! at the end
# of a method name is a convention in julia to indicate that it will change one or more
# its areguments. In this case, it will append 1 to v.
push!(v, 1)

# If we wanted to produce the same list in a non mutating way, this could be done by,
# for example, using the splat operator:
v1 = [v..., 1]

# In the statement above, Array{Int, 1} we provide 1 to declare a 1-dimentional array
# This can be generalized by replacing 1 with an arbitrary value n to produce an
# n-dimentional array. However, most often in practice, only 1D and 2D arrays are
# needed and for convencience, julia provides alias for Array{Int, 1} & Array{Int, 2}
v = Vector{Int}() # Create empty 1D - array
m = Matrix{Int}(undef, 10, 10) # Creates a 10x10 matrix (2D - array)

# And if you need to pre-allocate them (for speed)

# Indexing a matrix is somewhat different in julia than other languages
# julia is column major so in order to efficiently iterate a matrix
# one need to flip the i and j loop variables
m = randn(10, 10)
msum = zeros(eltype(m), size(m, 1))
for j = 1:size(m,2) # size() returns an n-tuple with the size for each dimention of the array
    for i = 1:size(m,1)
        msum[i] += m[i,j]
    end
end

# Notice that we can reasign a variable to anything we like, this is because,
# variables does not have types, only values have a type.
a = 1
a = "some string"

# Even if we put a type anotation on the variable, we can assign whatever we
# want to it, which is a possible gotcha
function f()
    x::Int = "Some string"
end

# This is the end of the examples section, you are now officially an expert at Julia!

end # module
