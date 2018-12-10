@testset "External data" begin
    @testset "HTTP" begin
        url = "http://elib.zib.de/pub/mp-testdata/tsp/tsplib/tsp/berlin52.tsp"
        data = Introduction.parse_nodes(url)
        
        @test length(Introduction.request(url)) == 916
        @test data[1] == Node(1, 565.0, 575.0)
        
        @test Introduction.dist(data[1], data[2]) == 666.1080993352356
        @test Introduction.dist(data[1], data[1]) == 0

        @test Introduction.max_dist(data) == (1716.049241717731, Node(2, 25.0, 185.0), Node(52, 1740.0, 245.0))
    end
end