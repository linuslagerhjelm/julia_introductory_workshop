
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
    seats = Vector{Seat}(undef, royal + premium + standard + economy)
    number = 0
    
    for i in 1:royal seats[number] = Seat(number += 1, Royal, false) end
    for i in 1:premium seats[number] = Seat(number += 1, Premium, false) end
    for i in 1:standard seats[number] = Seat(number += 1, Standard, false) end
    for i in 1:economy seats[number] = Seat(number += 1, Economy, false) end

    Event(name, adult, organizer.uuid, seats)
end

function split_seats(seats::Vector{Seat})::Tuple{Vector{Seat}, Vector{Seat}}
    free = Vector{Seat}()
    taken = Vector{Seat}()
    
    for seat in seats
        if seat.taken push!(taken, seat) else push!(free, seat) end
    end
    
    (free, taken)
end
get_segment(seats::Vector{Seat}, segment::Segment) = filter(seat -> seat.segment == segment, seats)
function get_best_segment(seats::Vector{Seat}, segment::Segment)
    free = get_segment(seats, segment)
    if length(free) == 0
        
    end
    return free
end
function buy_ticket!(event::Event, segment::Segment, visitor::Visitor)::Optional{Ticket}
    # The price is computed as "# of seats" / "# of available seats" * (segment type) + 1 * 100
    # The seat is selected as the first available seat that matches the segment preference
    # If there are no tickets left in the specified segment, it will try to match the closest
    # segment above until the top. If all that fails it matches the most expensive segment downwards
    # E.g., if Premium is specified it will match: Royal, Standard, Economy.
    free, taken = split_seats(event.seats)
    price = (length(event.seats) / length(free)) * (Int(segment) + 1) * 100
    free_in_segment = get_best_segment(free, segment)
    
    ticket = if length(free) > 0
        free_in_segment[1].taken = true
        Ticket(free_in_segment[1].number, price, event.name) 
    else missing end
end

end # module
