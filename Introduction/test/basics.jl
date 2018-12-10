@testset "Basics" begin
    @testset "Multiple dispatch" begin
        @test Introduction.add1(1) == 2
        @test Introduction.add1(1.5) == 2.5
        @test Introduction.add1([1, 2, 3]) == [2, 3, 4]
        @test Introduction.add1([1.1, 2.2, 3.3]) == [2.1, 3.2, 4.3]
        @test Introduction.add1([1 2 3; 1 2 3]) == [2 3 4; 2 3 4]
    end

    @testset "Floating points" begin
        @test Introduction.int_div(3, 5) == 0
        @test Introduction.int_div(4, 4) == 1
        @test Introduction.int_div(4.5, 4.5) == 1
        @test Introduction.int_div(-3.5, 1) == -3
    end

    @testset "Arguments" begin
        @test Introduction.in_range(1, 0, 1) == false
        @test Introduction.in_range(1, 0, 2)
        @test Introduction.in_range([0, 1, 2], 2, 3) == [false, false, true]
        @test Introduction.in_range(0, 1) == true
    end

    @testset "Misc" begin
        @test Introduction.fizzbuzz(1) == "1"
        @test Introduction.fizzbuzz(3) == "Fizz"
        @test Introduction.fizzbuzz(5) == "Buzz"
        @test Introduction.fizzbuzz(15) == "FizzBuzz"
        @test Introduction.fizzbuzz(39873498537492378438953498541) == "Fizz"
    end
end