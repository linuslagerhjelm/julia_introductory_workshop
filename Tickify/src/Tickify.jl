
module Tickify

include("types.jl")
export Visitor, Organizer, Ticket, Event, Standard, create_event

function create_event(adult::Bool, organizer::Organizer; royal = 0, premium = 0, standard = 0, economy = 0)::Event
    seats = Vector{Seat}(undef, royal + premium + standard + economy)
    number = 0
    for i in 1:royal seats[number] = Seat(number += 1, Royal, false) end
    for i in 1:premium seats[number] = Seat(number += 1, Premium, false) end
    for i in 1:standard seats[number] = Seat(number += 1, Standard, false) end
    for i in 1:economy seats[number] = Seat(number += 1, Economy, false) end
    Event(adult, organizer.uuid, seats)
end

function buy_ticket(event::Event, segment::Segment, user::User)::Ticket
    # The price is computed as "# of seats" / "# of available seats" * segment type * 100
end

end # module
