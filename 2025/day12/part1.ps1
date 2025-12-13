
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 12 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$result = 0
$areaTooSmall = 0
$inconclusive = 0

# Reading past the 6 present shapes
while($line = $inputReader.ReadLine()) {}
while($line = $inputReader.ReadLine()) {}
while($line = $inputReader.ReadLine()) {}
while($line = $inputReader.ReadLine()) {}
while($line = $inputReader.ReadLine()) {}
while($line = $inputReader.ReadLine()) {}

while($line = $inputReader.ReadLine()) {
    
    $lineSplit = $line.Split(":")
    $areaSplit = [int[]]$lineSplit[0].Split("x")
    
    $area = $areaSplit[0] * $areaSplit[1]

    $presentShape = 7 # All present shapes are 7 units
    $presentSquare = 9 # All present squares are 3x3 = 9 units
    
    $totalPresentShapeSize = ([int[]]$lineSplit[1].Trim().Split(" ") | Measure-Object -Sum).Sum * $presentShape
    $totalPresentSquareSize = ([int[]]$lineSplit[1].Trim().Split(" ") | Measure-Object -Sum).Sum * $presentSquare
    
    if($area -ge $totalPresentSquareSize) { $result++ } 
    elseif($area -lt $totalPresentShapeSize) { $areaTooSmall++ }
    else { $inconclusive++ }
}

Write-Host "$result regions can fit all of the listed presents."
Write-Host "$areaTooSmall regions are too small to fit all the listed presents."
Write-Host "$inconclusive regions are inconclusive."

# The answer is 437 (the solution doesn't work for example)

# Reading this problem, I really had no idea how to solve this, so I went to r/adventofcode for inspiration.
# It was quite obvious from the comments there, that actual input was more simple, than the problem and example input suggested.
# So I went ahead and tried whether it really was as simple as just checking if the sum of the presents area could fit in the total area.
# I've since built a few additional checks, that maybe complicates it a bit, but is a bit prettier as well.

# I think there are more nice improvements there could be made, without over-complicating, but again they aren't really necessary.
# For example, I am checking if the full present square area (9 units) fits in the region, but I think (but I'm not 100% sure) we could come in a situation where 9 units will fit, but not in 3x3 shape.
# This could be in a 2x5 region for example.