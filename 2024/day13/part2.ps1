
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 13 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$tokensRequired = 0
$index = 0

while($index -lt $inputContent.Count) {

    $lineA = $inputContent[$index].Split(":")[1].Split(",")
    $lineB = $inputContent[$index+1].Split(":")[1].Split(",")
    $linePrize = $inputContent[$index+2].Split(":")[1].Split(",")

    $index += 4
    
    [int]$aX = $lineA[0].Split("+")[1]
    [int]$aY = $lineA[1].Split("+")[1]
    [int]$bX = $lineB[0].Split("+")[1]
    [int]$bY = $lineB[1].Split("+")[1]

    # $prizeX = [int64]$linePrize[0].Split("=")[1] # Part 1
    # $prizeY = [int64]$linePrize[1].Split("=")[1] # Part 1

    $prizeX = [int64]$linePrize[0].Split("=")[1] + 10000000000000 # Part 2
    $prizeY = [int64]$linePrize[1].Split("=")[1] + 10000000000000 # Part 2

    $det = ($aX * $bY) - ($aY * $bX)

    [int64]$aPushes = ($prizeX * $bY - $prizeY * $bX) / $det
    [int64]$bPushes = ($prizeY * $aX - $prizeX * $ay) / $det

    if(($aPushes * $aX + $bPushes * $bX -eq $prizeX) -and ($aPushes * $aY + $bPushes * $bY -eq $prizeY)) {

        $tokensRequired += (3 * $aPushes) + $bPushes
    }
}

Write-Host "It requires $tokensRequired tokens to win all possible prizes."

# The answer is 104.140.871.044.942

# The solutions was heavily inspired from this Reddit post:
# https://www.reddit.com/r/adventofcode/comments/1hd7irq/2024_day_13_an_explanation_of_the_mathematics/

# Primarily I used the original post by u/ThunderChaser and this comment by u/ElevatedUser
# https://www.reddit.com/r/adventofcode/comments/1hd7irq/comment/m1tyhld/

# This solution (for part 2) also works much better for part 1 than my submitted solution