using Boh, Test, Luxor

mktempdir() do tmpdir
    cd(tmpdir) do
        Drawing(200, 200, "boh.svg")
        origin()
        boh()
        @test finish() == true
    end
end
