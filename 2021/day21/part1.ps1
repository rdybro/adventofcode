
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 21 - Part 1

$inputContent = @(5,8)
#$inputContent = @(4,8) #Example

$playerOnePosition = $inputContent[0]
$playerOneScore = 0

$playerTwoPosition = $inputContent[1]
$playerTwoScore = 0

$dieFace = 1
$dieMax = 100
$dieRolls = 0

$playerTurn = 1
$targetScore = 1000

while(($playerOneScore -lt $targetScore) -and ($playerTwoScore -lt $targetScore)) {

    if($dieFace -eq $dieMax) { $dieSum = $dieFace + 1 + 2; $dieFace = 3 }
    elseif($dieFace -eq $($dieMax - 1)) { $dieSum = $dieFace + $($dieFace + 1) + 1; $dieFace = 2 }
    elseif($dieFace -eq $($dieMax - 2)) { $dieSum = $dieFace + $($dieFace + 1) + $($dieFace + 2); $dieFace = 1 }
    else { $dieSum = $dieFace + $($dieFace + 1) + $($dieFace + 2); $dieFace += 3 }

    if($dieSum -gt 10) { [int]$dieSum = $dieSum.ToString().Substring($dieSum.ToString().Length - 1,1) }

    if($playerTurn -eq 1) {

        $playerOnePosition += $dieSum
        if($playerOnePosition -gt 10) { $playerOnePosition -= 10 }

        $playerOneScore += $playerOnePosition
        $playerTurn = 2
    }
    else {

        $playerTwoPosition += $dieSum
        if($playerTwoPosition -gt 10) { $playerTwoPosition -= 10 }

        $playerTwoScore += $playerTwoPosition
        $playerTurn = 1
    }

    $dieRolls += 3
}

if($playerOneScore -gt $playerTwoScore) { $winner = "one"; $losingScore = $playerTwoScore }
else { $winner = "two"; $losingScore = $playerOneScore }

Write-Host "Player one scored $playerOneScore points, and player two scored $playerTwoScore points."
Write-Host "The winner is player $winner, and the die rolled a total of $dieRolls times."
Write-Host "Multiplying the losing score with the total die rolls gives $($losingScore * $dieRolls)."

# Answer is 1067724
