
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 15 - Part 1

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
            Risk = if($locationIndex -eq 0) { 0 } else { [System.Int32]::Parse($char) }
            Total = if($locationIndex -eq 0) { 0 } else { 2147483647 }
            Visited = $false
        }
    }
}

$inputReader.Close()
$inputReader.Dispose()

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

Write-Host "The lowest total risk of any path from the top left to the bottom right is $($cave["$sizeVertical-$sizeHorizontal"].Total)."

# Answer is 498
