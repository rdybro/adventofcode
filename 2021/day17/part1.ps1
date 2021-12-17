
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 17 - Part 1

$inputContent = "target area: x=14..50, y=-267..-225"
#$inputContent = "target area: x=20..30, y=-10..-5" #Example

$targetX = $inputContent.Split(" ")[-2].Split("=")[-1].Split(",")[0].Split("..")
$targetY = $inputContent.Split(" ")[-1].Split("=")[-1].Split("..")

$possibleX = @(1..[int]$targetX[1])
$possibleY = @(1..$([int]$targetY[0] * -1))

$peakInitialVelocity = $null
$peakY = 0

foreach($x in $possibleX) {
    
    foreach($y in $possibleY) {

        $velocityX = $x
        $velocityY = $y
        $positionX = 0
        $positionY = 0

        $currentPeakY = 0
        $hitTargetArea = $false
        
        while(($positionX -le [int]$targetX[1]) -and ($positionY -ge [int]$targetY[1])) {

            $positionX += $velocityX
            $positionY += $velocityY
        
            if($velocityX -gt 0) { $velocityX-- }
            elseif($velocityX -lt 0) { $velocityX++ }
        
            $velocityY--

            if($positionY -gt $currentPeakY) { $currentPeakY = $positionY }
            if(($positionX -ge $targetX[0]) -and ($positionX -le $targetX[1]) -and ($positionY -ge $targetY[0]) -and ($positionY -le $targetY[1])) { $hitTargetArea = $true }
        }

        if($hitTargetArea -and ($currentPeakY -gt $peakY)) { $peakInitialVelocity = "$x,$y"; $peakY = $currentPeakY }
    }
}

Write-Host "The peak X is $peakY, reached by an initial velocity of $peakInitialVelocity."

# Answer is 35511