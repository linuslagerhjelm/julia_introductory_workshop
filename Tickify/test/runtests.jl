using Test
using Tickify

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
        event = create_event(true, organizer, standard=100)
        
        @test length(event.seats) == 100
        @test event.adult
        @test event.seats[1].segment == Standard
        @test event.organizer == organizer.uuid
    end

    @testset "Buy Tickets" begin
        organizer = Organizer("omegapoint")
        event = create_event(true, organizer, premium=50, standard=100)
    end
end