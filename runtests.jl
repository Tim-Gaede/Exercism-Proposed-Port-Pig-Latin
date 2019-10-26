using Test

include("pig_latin.jl")

# Tests adapted from `problem-specifications//canonical-data.json` @ v1.2.0

println("\n"^2, "-"^60, "\n"^3)

@testset "word beginning with \"a\"" begin
    @test translate("apple") == "appleay"
end
println()

@testset "word beginning with \"e\"" begin
    @test translate("ear") == "earay"
end
println()

@testset "word beginning with \"i\"" begin
    @test translate("igloo") == "iglooay"
end
println()

@testset "word beginning with \"o\"" begin
    @test translate("object") == "objectay"
end
println()

@testset "word beginning with \"u\"" begin
    @test translate("under") == "underay"
end
println()

@testset "word beginning with a vowel and followed by \"qu\"" begin
    @test translate("equal") == "equalay"
end
println()

@testset "word beginning with \"p\"" begin
    @test translate("pig") == "igpay"
end
println()
