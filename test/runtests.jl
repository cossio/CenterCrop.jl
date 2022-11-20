using Test: @test, @testset, @inferred
using CenterCrop: centercrop

@test size(@inferred centercrop(randn(218, 178, 100), 10, 128)) == (10, 128, 100)
@test size(@inferred centercrop(randn(218, 178, 100), 128, 128)) == (128, 128, 100)

for height in 10:20, width in 10:20, out_width in 2:8, out_heigth in 2:8
    @test size(@inferred centercrop(randn(height, width), out_heigth, out_width)) == (out_heigth, out_width)
end
