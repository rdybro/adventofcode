
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 14 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$spaceWidth = 101
$spaceHeight = 103

#$spaceWidth = 11 # Example input
#$spaceHeight = 7 # Example input

$secondsToRun = 100
$quadrants = @(0,0,0,0)

foreach($robot in $inputContent) {

    $robotLocation = $robot.Split(" ")[0].Split("=")[1].Split(",")
    $robotVelocity = $robot.Split(" ")[1].Split("=")[1].Split(",")

    $movedX = ([int]$robotLocation[0] + $secondsToRun * [int]$robotVelocity[0]) % $spaceWidth
    $movedY = ([int]$robotLocation[1] + $secondsToRun * [int]$robotVelocity[1]) % $spaceHeight

    if($movedX -lt 0) { $movedX += $spaceWidth }
    if($movedY -lt 0) { $movedY += $spaceHeight }

    if(($movedX -ne ($spaceWidth-1)/2) -and ($movedY -ne ($spaceHeight-1)/2)) {

        if($movedX -lt $spaceWidth/2) {

            if($movedY -lt $spaceHeight/2) { $quadrants[0]++ }
            else { $quadrants[2]++ }
        }
        else {

            if($movedY -lt $spaceHeight/2) { $quadrants[1]++ }
            else { $quadrants[3]++ }
        }
    }
}

Write-Host "After $secondsToRun seconds the safety factor is $($quadrants[0] * $quadrants[1] * $quadrants[2] * $quadrants[3])."

# The answer is 225.552.000