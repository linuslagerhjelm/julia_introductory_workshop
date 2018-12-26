using AutoHashEquals

@enum Segment begin
    Economy
    Standard
    Premium
    Royal
end
@auto_hash_equals mutable struct Seat
    number::Int
    segment::Segment
    taken::Bool
end
@auto_hash_equals struct Event
    name::String
    adult::Bool
    organizer::String
    seats::Vector{Seat}
end
Base.deepcopy(e::Event)::Event = deepcopy_event(e)
function deepcopy_event(e::Event)::Event
    seats = Vector{Seat}(undef, length(e.seats))
    for i in 1:length(e.seats)
        seat = e.seats[i]
        seats[i] = Seat(seat.number, seat.segment, seat.taken)
    end
    Event(e.name, e.adult, e.organizer, seats)
end

@auto_hash_equals struct Ticket
    seat::Int
    price::Float64
    event::String
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
