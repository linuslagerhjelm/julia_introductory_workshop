module Tickify

@enum Segment begin
    Royal
    Premium
    Basic
    Economy
end
struct Event end
struct Seat
    number::Int
    segment::Segment
    price::Float64
    taken::Bool
end
struct Order end
struct Ticket end
struct User end

end # module
