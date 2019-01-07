
module Tickify

using Optionals
include("types.jl")
export 
    Visitor,
    Organizer,
    Ticket,
    Event,
    Economy,
    Standard,
    Premium,
    Royal,
    create_event,
    buy_ticket!

function create_event(name::String, adult::Bool, organizer::Organizer; royal = 0, premium = 0, standard = 0, economy = 0)::Event
    # Seats are distributed so that more expensive segments have lower numbers
end

function buy_ticket!(event::Event, segment::Segment, visitor::Visitor)::Optional{Ticket}
    # The price is computed as "# of seats" / "# of available seats" * (segment type) + 1 * 100
    # The seat is selected as the first available seat that matches the segment preference
    # If there are no tickets left in the specified segment, it will simply pick the first
    # available seat (which is at the same time the easiest to implement and a sneaky tactic
    # to earn more money by selling from the most expensive segment first).
    free, taken = split_seats(event.seats)
    price = (length(event.seats) / length(free)) * (Int(segment) + 1) * 100
    free_in_segment = get_best_segment(free, segment)
    
    ticket = if length(free) > 0
        free_in_segment[1].taken = true
        Ticket(free_in_segment[1].number, price, event.name) 
    else missing end
end

end # module
