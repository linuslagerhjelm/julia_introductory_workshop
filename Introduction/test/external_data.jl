@testset "External data" begin
    @testset "HTTP" begin
        url = "http://elib.zib.de/pub/mp-testdata/tsp/tsplib/tsp/berlin52.tsp"
        @test length(Introduction.request(url)) == 916
        @test Introduction.parse_nodes(url)[1] == Node(1, 565.0, 575.0)
    end
end