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
        
        @test Introduction.count_letters("abc") == Dict('a' => 1, 'b' => 1, 'c' => 1)
        @test Introduction.count_letters("aacbbcbbc") == Dict('a' => 2, 'b' => 4, 'c' => 3)
    end

    @testset "string to bitlist" begin
        str = "descrypt"
        
        @test Introduction.to_bit_list(str) == [0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0]
        @test Introduction.to_bit_list("123") == [0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1]
        @test Introduction.to_bit_list("\0\0\0\0\0\0\0\0") == zeros(Int, 64)
    end
end