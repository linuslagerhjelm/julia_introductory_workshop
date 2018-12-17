module Tickify

using AutoHashEquals

@enum Segment begin
    Royal
    Premium
    Standard
    Economy
end
@auto_hash_equals struct Event
    seats::Set{Seat}
end
@auto_hash_equals struct Seat
    number::Int
    segment::Segment
    price::Float64
    taken::Bool
end
@auto_hash_equals struct Order end
@auto_hash_equals struct Ticket end
@auto_hash_equals struct User end

end # module
