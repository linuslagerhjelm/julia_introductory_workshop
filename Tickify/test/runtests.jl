using Test
using Tickify

# include("../src/types.jl")

@testset "Basics" begin
    @testset "User" begin
        function unique_ids()
            users = [[Visitor(i) for i in 1:100]..., [Organizer("") for i in 1:100]...]
            ids = Set{String}()
            [push!(ids, id) for id in map(u -> u.uuid, users)]
            length(ids) == length(users)
        end

        @test unique_ids()
        @test Visitor("abc", UInt(10), Set{Ticket}()) == Visitor("abc", UInt(10), Set{Ticket}())
        @test Organizer("abc", "omegapoint", Set{Event}()) == Organizer("abc", "omegapoint", Set{Event}())
    end

    @testset "Create Event" begin
        organizer = Organizer("omegapoint")
        event = create_event("OpKoKo", true, organizer, standard=100)
        
        @test length(event.seats) == 100
        @test event.adult
        @test event.seats[1].segment == Standard
        @test event.organizer == organizer.uuid
    end

    @testset "Buy Tickets" begin
        visitor = Visitor(23)
        organizer = Organizer("omegapoint")
        event = create_event("OpKoKo", true, organizer, premium=50, standard=100)

        function bought_seats_are_unavailable()
            local_event = create_event("OpKoKo", true, organizer, premium=50, standard=100)
            buy_ticket!(local_event, Standard, visitor)
            free = filter(seat -> !seat.taken, local_event.seats)
            length(free) == 149
        end

        function all_sold()
            local_event = create_event("OpKoKo", true, organizer, premium=50, standard=100)
            for seat in local_event.seats seat.taken = true end

            ticket = buy_ticket!(local_event, Standard, visitor)
            ismissing(ticket)
        end

        function all_sold_segment()
            local_event = create_event("OpKoKo", true, organizer, premium=50, standard=100)
            for seat in local_event.seats
                if seat.segment == Standard
                    seat.taken = true
                end
            end
            ticket = buy_ticket!(local_event, Standard, visitor)
            ticket == Ticket(1, 900.0, "OpKoKo")
        end

        @test buy_ticket!(event, Standard, visitor) == Ticket(51, 200.0, "OpKoKo")
        @test buy_ticket!(event, Premium, visitor) == Ticket(1, 300.0, "OpKoKo")
        @test all_sold()
        @test all_sold_segment()
        @test bought_seats_are_unavailable()
    end
end