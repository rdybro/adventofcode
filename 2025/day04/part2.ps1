
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 4 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$result = 0

$emptyRow = ""
for($a = 0; $a -lt $inputContent[0].Length; $a++) { $emptyRow += "." }

# I pad the grid with empty spaces (.) before continuing, for easier counting later
$grid = @($emptyRow)
$grid += $inputContent
$grid += $emptyRow

for($b = 0; $b -lt $grid.Count; $b++) { $grid[$b] = ".$($grid[$b])." }

$rollsOfPaperRemovedThisTurnFlag = $true

while($rollsOfPaperRemovedThisTurnFlag) {

    $rollsOfPaperRemovedThisTurn = @()

    for($i = 1; $i -lt $grid.Count - 1; $i++) {
    
        for($j = 1; $j -lt $grid[$i].Length - 1; $j++) {
            
            if($grid[$i][$j] -eq "@") {
                
                $adjacentRollsOfPaper = 0
            
                if($grid[$i-1][$j-1] -eq "@") { $adjacentRollsOfPaper++ }
                if($grid[$i-1][$j] -eq "@") { $adjacentRollsOfPaper++ }
                if($grid[$i-1][$j+1] -eq "@") { $adjacentRollsOfPaper++ }
                if($grid[$i][$j-1] -eq "@") { $adjacentRollsOfPaper++ }
                if($grid[$i][$j+1] -eq "@") { $adjacentRollsOfPaper++ }
                if($grid[$i+1][$j-1] -eq "@") { $adjacentRollsOfPaper++ }
                if($grid[$i+1][$j] -eq "@") { $adjacentRollsOfPaper++ }
                if($grid[$i+1][$j+1] -eq "@") { $adjacentRollsOfPaper++ }
            
                if($adjacentRollsOfPaper -lt 4) {
                    
                    $result++
                    $rollsOfPaperRemovedThisTurn += "$i,$j"
                }
            }
        }
    }

    if(-not $rollsOfPaperRemovedThisTurn) { $rollsOfPaperRemovedThisTurnFlag = $false }
    else {

        foreach($rollOfPaper in $rollsOfPaperRemovedThisTurn) {

            [int[]]$location = $rollOfPaper.Split(",")

            $row = $grid[$location[0]]
            $grid[$location[0]] = $row.Substring(0,$location[1]) + "x" + $row.Substring($location[1]+1)
        }
    }
}

Write-Host "$result rolls of paper can be removed by the forklifts."

# The answer is 9206