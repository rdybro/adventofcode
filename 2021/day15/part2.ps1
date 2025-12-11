
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 15 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$sizeVertical = -1
$sizeHorizontal = -1
$locationIndex = -1

$cave = @{}

while($line = $inputReader.ReadLine()) {
    
    $sizeVertical++
    $sizeHorizontal = -1

    foreach($char in $line.ToCharArray()) {

        $sizeHorizontal++
        $locationIndex++

        $cave["$sizeVertical-$sizeHorizontal"] = @{
            Index = $locationIndex
            Vertical = $sizeVertical
            Horizontal = $sizeHorizontal
            LocationString = "$sizeVertical-$sizeHorizontal"
            Risk = [System.Int32]::Parse($char)
            Total = 2147483647
            Visited = $false
        }
    }
}

$inputReader.Close()
$inputReader.Dispose()

$newMaxVertical = (($sizeVertical + 1) * 5) - 1
$newMaxHorizontal = (($sizeHorizontal + 1) * 5) - 1

for($v = 0; $v -le $newMaxVertical; $v++) {

    for($h = 0; $h -le $newMaxHorizontal; $h++) {

        if(-not $cave["$v-$h"]) {
            
            $locationIndex++

            if($v -le $sizeVertical) { $newRisk = $cave["$v-$($h - $sizeHorizontal - 1)"].Risk + 1 }
            else { $newRisk = $cave["$($v - $sizeVertical - 1)-$h"].Risk + 1 }

            if($newRisk -gt 9) { $newRisk = 1 }
        
            $cave["$v-$h"] = @{
                Index = $locationIndex
                Vertical = $v
                Horizontal = $h
                LocationString = "$v-$h"
                Risk = $newRisk
                Total = 2147483647
                Visited = $false
            }
        }
    }
}

$cave["0-0"].Risk = 0
$cave["0-0"].Total = 0

$queue = [System.Collections.Generic.List[string]]@("0-0")

while($queue) {

    $nextPosition = $null
    $nextPositionTotalRisk = 2147483647
    
    foreach($item in $queue) {
        
        $queueItem = $cave[$item]
        
        if($queueItem.Total -lt $nextPositionTotalRisk) {
            
            $nextPosition = $queueItem.LocationString
            $nextPositionTotalRisk = $cave[$item].Total
        }
    }

    $currentLocation = $cave[$nextPosition]
    
    $locationDown = $cave["$($currentLocation.Vertical + 1)-$($currentLocation.Horizontal)"]
    $locationRight = $cave["$($currentLocation.Vertical)-$($currentLocation.Horizontal + 1)"]

    $locationUp = $cave["$($currentLocation.Vertical - 1)-$($currentLocation.Horizontal)"]
    $locationLeft = $cave["$($currentLocation.Vertical)-$($currentLocation.Horizontal - 1)"]

    if($locationDown -and ($currentLocation.Total + $locationDown.Risk -lt $locationDown.Total) -and ($locationDown.Visited -eq $false)) {

        $locationDown.Total = $currentLocation.Total + $locationDown.Risk
        $queue.Add($locationDown.LocationString)
    }

    if($locationRight -and ($currentLocation.Total + $locationRight.Risk -lt $locationRight.Total) -and ($locationRight.Visited -eq $false)) {
        
        $locationRight.Total = $currentLocation.Total + $locationRight.Risk
        $queue.Add($locationRight.LocationString)
    }

    if($locationUp -and ($currentLocation.Total + $locationUp.Risk -lt $locationUp.Total) -and ($locationUp.Visited -eq $false)) {

        $locationUp.Total = $currentLocation.Total + $locationUp.Risk
        $queue.Add($locationUp.LocationString)
    }

    if($locationLeft -and ($currentLocation.Total + $locationLeft.Risk -lt $locationLeft.Total) -and ($locationLeft.Visited -eq $false)) {

        $locationLeft.Total = $currentLocation.Total + $locationLeft.Risk
        $queue.Add($locationLeft.LocationString)
    }

    $currentLocation.Visited = $true
    $null = $queue.Remove($nextPosition)
}

Write-Host "The lowest total risk of any path from the top left to the bottom right is $($cave["$newMaxVertical-$newMaxHorizontal"].Total)."

# Answer is 2901
