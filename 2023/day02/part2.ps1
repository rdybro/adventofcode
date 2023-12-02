
# Advent of Code 2023
# Rasmus Dybro Larsen
# Day 2 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$sum = 0

foreach($line in $inputContent) {

    $lineSplit = $line.Split(":")
    $sets = $lineSplit[1].Split(";")

    $cubeLimits = @{"red" = $null; "green" = $null; "blue" = $null}

    foreach($set in $sets) {

        $cubes = $set.Split(",").Trim()

        foreach($cube in $cubes) {

            $cubeSplit = $cube.Split(" ")
            [int]$cubeAmount = $cubeSplit[0]
            $cubeColor = $cubeSplit[1]

            if((-not $cubeLimits[$cubeColor]) -or ($cubeAmount -gt $cubeLimits[$cubeColor])) {

                $cubeLimits[$cubeColor] = $cubeAmount
            }
        }
    }

    $sum += (Invoke-Expression -Command ($cubeLimits.Values -join "*"))
}

Write-Host "The sum of each games power is $sum."

# The answer is 70.950