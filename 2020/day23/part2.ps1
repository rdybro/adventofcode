
# Advent of Code 2020
# Day 23 - Part 2

# $inputContent = "643719258"
$inputContent = "389125467" #Example input

$moves = 10000000
$currentMove = 1
$currentCupIndex = 0
$lastCup = 1000000 # Set this to 0 for part 1

$cups = New-Object -TypeName "System.Collections.ArrayList"
foreach($char in $inputContent.ToCharArray()) { $null = $cups.Add([System.Int32]::Parse($char)) }

if($lastCup -gt 0) { $cups.AddRange($(($cups | Sort-Object -Descending | Select-Object -First 1) + 1)..$lastCup) }
else { $lastCup = $cups | Sort-Object -Descending | Select-Object -First 1 }

while($currentMove -le $moves) {

    $currentCup = $cups.Item($currentCupIndex)
    $collectedCups = @()

    while($collectedCups.Count -lt 3) {

        if($collectedCups.Count -eq 0) { $collectedIndex = $currentCupIndex }
        else { $collectedIndex = $cups.IndexOf($collectedCups[-1]) }

        $collectedIndex++        
        if($collectedIndex -ge $cups.Count) { $collectedIndex = 0 }

        $collectedCups += $cups.Item($collectedIndex)
    }

    foreach($collectedCup in $collectedCups) { $cups.Remove($collectedCup) }

    $destinationCup = $currentCup
    $destinationCupIndex = $null

    while($null -eq $destinationCupIndex) {

        $destinationCup--
        if($destinationCup -eq 0) { $destinationCup = $lastCup }
        if($cups.Contains($destinationCup)) { $destinationCupIndex = $cups.IndexOf($destinationCup) }
    }

    $collectedCupIndex = 0
    foreach($collectedCup in $collectedCups) {
        
        $collectedCupIndex++
        $cups.Insert($destinationCupIndex + $collectedCupIndex,$collectedCup)
    }

    $currentCupIndex = $cups.IndexOf($currentCup) + 1
    if($currentCupIndex -ge $lastCup) { $currentCupIndex = 0 }

    if($currentMove -like "*000") { Write-Host "Current move: $currentMove" }
    $currentMove++
}

# Only run below if we are doing part 1
if($cups.Count -eq 9) {

    $currentCircle = ""
    foreach($cup in $cups) { $currentCircle += $cup }

    $currentCircleSplit = $currentCircle.Split("1")
    $cupOrder = $currentCircleSplit[1] + $currentCircleSplit[0]

    Write-Host "The order of the cups are: $cupOrder"

    # Part 1 result = 54896723
}

# Only run below if we are doing part 2
if($cups.Count -gt 9) {

    $cupOneIndex = $cups.IndexOf(1)

    $cupStarOneIndex = $cupOneIndex + 1
    if($cupStarOneIndex -ge $cups.Count) { $cupStarOneIndex = 0 }
    
    $cupStarTwoIndex = $cupStarTwoIndex + 1
    if($cupStarTwoIndex -ge $cups.Count) { $cupStarTwoIndex = 0 }

    Write-Host "1st cup clockwise of 1 = $($cups.Item($cupStarOneIndex))"
    Write-Host "2nd cup clockwise of 1 = $($cups.Item($cupStarTwoIndex))"
    Write-Host "Multiplying the two cups label value gives the result = $($cups.Item($cupStarOneIndex) * $cups.Item($cupStarTwoIndex))"
}

# I haven't tested this, but I expect it to work
# It is horribly efficient though and would take several hours, if not days, to complete step 2
