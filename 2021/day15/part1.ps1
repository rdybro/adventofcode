
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 15 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$sizeVertical = -1
$sizeHorizontal = -1
$locationIndex = -1

$cave = [System.Collections.Generic.List[PSCustomObject]]::new()

foreach($line in $inputContent) {
    
    $sizeVertical++
    $sizeHorizontal = -1

    foreach($char in $line.ToCharArray()) {

        $sizeHorizontal++
        $locationIndex++

        $cave.Add([PSCustomObject]@{
            Index = $locationIndex
            Vertical = $sizeVertical
            Horizontal = $sizeHorizontal
            Risk = if($locationIndex -eq 0) { 0 } else { [System.Int32]::Parse($char) }
            Total = if($locationIndex -eq 0) { 0 } else { 2147483647 }
            Visited = $false
        })
    }
}

while($cave | Where-Object { $_.Visited -eq $false }) {

    $currentLocation = $cave | Where-Object { ($_.Visited -eq $false) -and ($_.Total -lt 2147483647) } | Sort-Object Total | Select-Object -First 1

    $locationDown = $cave | Where-Object { ($_.Vertical -eq $currentLocation.Vertical + 1) -and ($_.Horizontal -eq $currentLocation.Horizontal) }
    $locationRight = $cave | Where-Object { ($_.Vertical -eq $currentLocation.Vertical) -and ($_.Horizontal -eq $currentLocation.Horizontal + 1) }

    $locationUp = $cave | Where-Object { ($_.Vertical -eq $currentLocation.Vertical - 1) -and ($_.Horizontal -eq $currentLocation.Horizontal) }
    $locationLeft = $cave | Where-Object { ($_.Vertical -eq $currentLocation.Vertical) -and ($_.Horizontal -eq $currentLocation.Horizontal - 1) }

    if($locationDown -and ($currentLocation.Total + $locationDown.Risk -lt $locationDown.Total) -and ($locationDown.Visited -eq $false)) {

        $locationDown.Total = $currentLocation.Total + $locationDown.Risk
    }

    if($locationRight -and ($currentLocation.Total + $locationRight.Risk -lt $locationRight.Total) -and ($locationRight.Visited -eq $false)) {
        
        $locationRight.Total = $currentLocation.Total + $locationRight.Risk
    }

    if($locationUp -and ($currentLocation.Total + $locationUp.Risk -lt $locationUp.Total) -and ($locationUp.Visited -eq $false)) {

        $locationUp.Total = $currentLocation.Total + $locationUp.Risk
    }

    if($locationLeft -and ($currentLocation.Total + $locationLeft.Risk -lt $locationLeft.Total) -and ($locationLeft.Visited -eq $false)) {

        $locationLeft.Total = $currentLocation.Total + $locationLeft.Risk
    }

    $currentLocation.Visited = $true
}

Write-Host "The lowest total risk of any path from the top left to the bottom right is $(($cave[$locationIndex]).Total)."

# Answer is 498
# This took 2h5m to run
