
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 13 - Part 1

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

    [int]$prizeX = $linePrize[0].Split("=")[1]
    [int]$prizeY = $linePrize[1].Split("=")[1]

    $aSteps = @{"0,0"=0}
    $bSteps = @{"$prizeX,$prizeY"=0}

    $aPushes = 0
    $axCurrent = 0
    $ayCurrent = 0

    while(($axCurrent -le $prizeX) -and ($ayCurrent -le $prizeY)) {
        
        $aPushes++
        $axCurrent += $aX
        $ayCurrent += $aY
    
        $aSteps.Add("$axCurrent,$ayCurrent",$aPushes)
    }

    $bPushes = 0
    $bxCurrent = $prizeX
    $byCurrent = $prizeY

    while(($bxCurrent -ge 0) -and ($byCurrent -ge 0)) {
        
        $bPushes++
        $bxCurrent -= $bX
        $byCurrent -= $bY
    
        $bSteps.Add("$bxCurrent,$byCurrent",$bPushes)
    }
    
    if($compare = Compare-Object -ReferenceObject @($aSteps.Keys) -DifferenceObject @($bSteps.Keys) -ExcludeDifferent -IncludeEqual) {
        
        $tokensRequired += (3 * $aSteps[$compare.InputObject]) + $bSteps[$compare.InputObject]
    }
}

Write-Host "It requires $tokensRequired tokens to win all possible prizes."

# The answer is 29.201

# The solutions was heavily inspired from this Reddit post:
# https://www.reddit.com/r/adventofcode/comments/1hd7irq/2024_day_13_an_explanation_of_the_mathematics/

# Primarily I used the original post by u/ThunderChaser and this comment by u/ElevatedUser
# https://www.reddit.com/r/adventofcode/comments/1hd7irq/comment/m1tyhld/