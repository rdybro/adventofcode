
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 4 - Part 1

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

for($i = 1; $i -lt $grid.Count - 1; $i++) {

    $row = $grid[$i]

    for($j = 1; $j -lt $row.Length - 1; $j++) {

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

            if($adjacentRollsOfPaper -lt 4) { $result++ }
        }
    }
}

Write-Host "$result rolls of paper can be accessed by the forklifts."

# The answer is 1533