using AutoHashEquals

@enum Segment begin
    Royal
    Premium
    Standard
    Economy
end
@auto_hash_equals struct Seat
    number::UInt
    segment::Segment
    price::Float64
    taken::Bool
end
@auto_hash_equals struct Event
    adult::Bool
    seats::Set{Seat}
end
@auto_hash_equals struct Order
    event::Event
end
@auto_hash_equals struct Ticket
    seat::Seat
    event::Event
end

abstract type User end

random_id(n=32)::String = join([Char(i) for i in rand(32:126, n)])
@auto_hash_equals struct Visitor
    uuid::String
    age::UInt
    tickets::Set{Ticket}
end
Visitor(age::Int) = Visitor(random_id(), age, Set{Ticket}())

@auto_hash_equals struct Organizer
    uuid::String
    organization::String
    events::Set{Event}
end
Organizer(org::String) = Organizer(random_id(), org, Set{Event}())
