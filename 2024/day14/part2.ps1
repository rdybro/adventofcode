
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 14 - Part 2

$inputContent = Get-Content -LiteralPath input.txt

$spaceWidth = 101
$spaceHeight = 103

[System.Collections.ArrayList]$robots = @()
[System.Collections.ArrayList]$standardDeviations = @()

foreach($robot in $inputContent) {

    $robotLocation = $robot.Split(" ")[0].Split("=")[1].Split(",")
    $robotVelocity = $robot.Split(" ")[1].Split("=")[1].Split(",")

    $object = [PSCustomObject]@{
        X = [int]$robotLocation[0]
        Y = [int]$robotLocation[1]
        VelocityX = [int]$robotVelocity[0]
        VelocityY = [int]$robotVelocity[1]
    }

    $robots.Add($object) | Out-Null
}

# Read on Reddit that the entire movements loops at $spaceWidth * $spaceHeight
# So there is no reason to check further than that

for($i = 1; $i -lt ($spaceWidth * $spaceHeight); $i++) {

    foreach($robot in $robots) {

        $robot.X += $robot.VelocityX
        $robot.Y += $robot.VelocityY

        if($robot.X -lt 0) { $robot.X += $spaceWidth }
        elseif($robot.X -ge $spaceWidth) { $robot.X -= $spaceWidth }

        if($robot.Y -lt 0) { $robot.Y += $spaceHeight }
        elseif($robot.Y -ge $spaceHeight) { $robot.Y -= $spaceHeight }
    }

    $object = [PSCustomObject]@{
        Turn = $i
        xStdDev = ($robots.X | Measure-Object -StandardDeviation).StandardDeviation
        yStdDev = ($robots.Y | Measure-Object -StandardDeviation).StandardDeviation
    }

    $standardDeviations.Add($object) | Out-Null
}

$christmasTreeTurn = ($standardDeviations | Sort-Object xStdDev,yStdDev | Select-Object -First 1).Turn

Write-Host "The picture of a Christmas tree forms at turn $christmasTreeTurn."

# The answer is 7371

# I spent so much time on this, and I couldn't figure out why it didn't work
# I ended up checking through basically all possible solutions, only to realize I had it more or less the first time, but with an off-by-one error

# The idea to use standard deviation was found on Reddit - I can't credit myself for that
# I think (based on what I read) maybe using variance would have been better - but I am not sure
# But PowerShell has built-in tools for standard deviation, so I tried that first and it worked

# When I first ran it, I only checked the first 1000 turns, and it was easy to spot a pattern
# For width, starting at turn 98 (offset), the standard deviation was low at each $SpaceWidth turn
# And for height, the same applied on each $spaceHeight turn, with an offset of 57 turns
# So with that knowledge we could solve it much faster by just figuring out where they "meet"
# I actually also tried this - and it worked - but I was thrown off by the same off-by-one error