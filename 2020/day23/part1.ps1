
# Advent of Code 2020
# Day 23 - Part 1

$inputContent = "643719258"
# $inputContent = "389125467" #Example input

$moves = 100
$currentMove = 1
$currentCircle = $inputContent
$currentCupIndex = 0

while($currentMove -le $moves) {

    Write-Host "Run $currentMove : $currentCircle " -NoNewline

    $cups = New-Object -TypeName "System.Collections.ArrayList"
    foreach($char in $currentCircle.ToCharArray()) { $null = $cups.Add([System.Int32]::Parse($char)) }

    $currentCup = $cups.Item($currentCupIndex)
    $collectedCups = @()

    while($collectedCups.Count -lt 3) {

        if($collectedCups.Count -eq 0) { $collectedIndex = $currentCupIndex }
        else { $collectedIndex = $cups.IndexOf($collectedCups[-1]) }

        $collectedIndex++        
        if($collectedIndex -ge $cups.Count) { $collectedIndex = 0 }

        $collectedCups += $cups.Item($collectedIndex)
    }

    $remainingCups = $cups | Where-Object { $_ -notin $collectedCups }
    $destinationCup = $currentCup
    $destinationCupIndex = $null

    while($null -eq $destinationCupIndex) {

        $destinationCup--
        if($destinationCup -eq 0) { $destinationCup = 9 }
        if($remainingCups.Contains($destinationCup)) { $destinationCupIndex = $remainingCups.IndexOf($destinationCup) }
    }
    
    $currentCircle = ""

    foreach($char in $remainingCups) {

        $currentCircle += $char
        if($char -eq $destinationCup) { $currentCircle += $collectedCups }
    }

    $currentCircle = $currentCircle.Replace(" ","")
    $currentCupIndex = $currentCircle.IndexOf("$currentCup") + 1
    if($currentCupIndex -ge $cups.Count) { $currentCupIndex = 0 }

    $currentMove++

    Write-Host "// Collected $collectedCups // Current cup $currentCup // Destination cup $destinationCup"
}

$currentCircleSplit = $currentCircle.Split("1")
$cupOrder = $currentCircleSplit[1] + $currentCircleSplit[0]

Write-Host "The order of the cups are: $cupOrder"
