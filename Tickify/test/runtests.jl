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
        @test Organizer("abc", UInt(10), Set{Ticket}()) == Organizer("abc", UInt(10), Set{Ticket}())
    end

    @testset "Create Event" begin
    end

    @testset "Buy Tickets" begin
    end
end