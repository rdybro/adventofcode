
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 2 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt
#$inputContent = Get-Content -LiteralPath input_edgecases.txt

function Test-Level {
    param(
        [int[]]$Levels
    )

    $i = 0
    $safe = $true
    $direction = $null
    $newDirection = $null
    $previousNumber = $null

    while(($i -lt $Levels.Count) -and $safe) {

        if($i -ne 0) {

            $difference = [int]$Levels[$i] - $previousNumber

            if($difference -in @(1,2,3)) { $newDirection = "increasing" }
            elseif($difference -in @(-1,-2,-3)) { $newDirection = "decreasing" }
            else { $safe = $false }

            if($null -eq $direction) { $direction = $newDirection }
            elseif($direction -ne $newDirection) { $safe = $false }
        }

        [int]$previousNumber = $Levels[$i]
        $i++
    }

    return $safe
}

$safeReports = 0

foreach($line in $inputContent) {

    $lineSplit = $line.Split(" ")

    if(Test-Level -Levels $lineSplit) { $safeReports++ }
    else {

        $j = 0
        $safeWithProblemDampener = $false

        while(($j -lt $lineSplit.Count) -and (-not $safeWithProblemDampener)) {

            [System.Collections.Generic.List[System.Object]]$list = $lineSplit
            $list.RemoveAt($j)

            if(Test-Level -Levels $list) {
                
                $safeWithProblemDampener = $true
                $safeReports++
            }

            $j++
        }
    }
}

Write-Host "There are $safeReports safe reports in the unusual data."

# The answer is 488