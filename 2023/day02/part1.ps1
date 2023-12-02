
# Advent of Code 2023
# Rasmus Dybro Larsen
# Day 2 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$sum = 0

$cubeLimits = @{"red" = 12; "green" = 13; "blue" = 14}

foreach($line in $inputContent) {

    $lineSplit = $line.Split(":")
    [int]$gameId = $lineSplit[0].Split(" ")[1]
    $sets = $lineSplit[1].Split(";")

    $gamePossible = $true

    foreach($set in $sets) {

        $cubes = $set.Split(",").Trim()

        foreach($cube in $cubes) {

            $cubeSplit = $cube.Split(" ")
            [int]$cubeAmount = $cubeSplit[0]
            $cubeColor = $cubeSplit[1]

            if($cubeAmount -gt $cubeLimits[$cubeColor]) { $gamePossible = $false }
        }
    }

    if($gamePossible) { $sum += $gameId }
}

Write-Host "The sum of game IDs of all possible games is $sum."

# The answer is 2.076