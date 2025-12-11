
# Advent of Code 2020
# Day 22 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$playerOne = New-Object -TypeName "System.Collections.ArrayList"
$playerTwo = New-Object -TypeName "System.Collections.ArrayList"

$currentLine = 1

while($inputContent[$currentLine] -ne "") {

    $null = $playerOne.Add([int]$inputContent[$currentLine])
    $currentLine++
}

$currentLine += 2

while($inputContent[$currentLine]) {

    $null = $playerTwo.Add([int]$inputContent[$currentLine])
    $currentLine++
}

while(($playerOne.Count -ne 0) -and ($playerTwo.Count -ne 0)) {

    if($playerOne[0] -gt $playerTwo[0]) {

        $null = $playerOne.Add($playerOne[0])
        $null = $playerOne.Add($playerTwo[0])
        $playerOne.RemoveAt(0)
        $playerTwo.RemoveAt(0)
    }
    else {

        $null = $playerTwo.Add($playerTwo[0])
        $null = $playerTwo.Add($playerOne[0])
        $playerOne.RemoveAt(0)
        $playerTwo.RemoveAt(0)
    }
}

if($playerOne.Count -gt 0) { $winner = $playerOne }
else { $winner = $playerTwo }

$score = 0
$count = $winner.Count

foreach($card in $winner) {
    
    $score += $card * $count
    $count--
}

Write-Host "The winning score is $score."
