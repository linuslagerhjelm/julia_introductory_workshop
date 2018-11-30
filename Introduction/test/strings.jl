@testset "Strings" begin
    @testset "CharArray" begin
        @test Introduction.to_char_array("hello") == ['h', 'e', 'l', 'l', 'o']
        @test Introduction.to_char_array("😃😃😃😃") == ['😃', '😃', '😃', '😃']
    end
    @testset "concat" begin
        @test Introduction.concatenate('a', 'b') == "ab"
        @test Introduction.concatenate('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l') == "abcdefghijkl"
        @test Introduction.concatenate("ha", "ha") == "haha"

        @test Introduction.self_concat('a', 5) == "aaaaa"
        @test Introduction.self_concat("abc", 3) == "abcabcabc"
    end

    @testset "miscellaneous string operations" begin
        str = "this is a string"
        @test Introduction.uniq(str) == "nhsitarg "

        @test Introduction.snake_case(str) == "this_is_a_string"
        @test Introduction.snake_case("  this is a string ") == "this_is_a_string"
        
        # @test Introduction.count_letters(str) == {""}
    end
end