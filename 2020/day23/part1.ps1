
# Advent of Code 2020
# Day 23 - Part 1

$inputContent = "643719258"
# $inputContent = "389125467" #Example input

$moves = 100
$currentMove = 1
$currentCup = $inputContent.Substring(0,1)
$lastCup = $cups.Keys | Sort-Object -Descending | Select-Object -First 1

$circle = $inputContent + $currentCup
$cups = @{}

$i = 0

while($i -lt ($circle.Length) - 1) {

    $substring = $circle.Substring($i,2)
    $cups.Add($substring.Substring(0,1),$substring.Substring(1,1))
    $i++
}

while($currentMove -le $moves) {

    $collectedCupOne = $cups[$currentCup]
    $collectedCupTwo = $cups[$collectedCupOne]
    $collectedCupThree = $cups[$collectedCupTwo]

    $destinationCup = [int]$currentCup
    $destinationCupTest = $false

    while(!$destinationCupTest) {

        $destinationCup--
        if($destinationCup -eq 0) { $destinationCup = [int]$lastCup }
        if(($destinationCup -ne $collectedCupOne) -and ($destinationCup -ne $collectedCupTwo) -and ($destinationCup -ne $collectedCupThree)) { $destinationCupTest = $true }
    }

    $cups[$currentCup] = $cups[$collectedCupThree]
    $cups[$collectedCupThree] = $cups[[string]$destinationCup]
    $cups[[string]$destinationCup] = $collectedCupOne

    $currentCup = $cups[$currentCup]

    $currentMove++
}

$cupOrder = ""
$nextCup = "1"

while($cups[$nextCup] -ne "1") {
    
    $cupOrder += $cups[$nextCup]
    $nextCup = $cups[$nextCup]
}

# Part 1 result = 54896723
Write-Host "The order of the cups are: $cupOrder"
