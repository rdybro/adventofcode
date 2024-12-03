
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 2 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$safeReports = 0

foreach($line in $inputContent) {

    $levels = $line.Split(" ")

    $i = 0
    $safe = $true
    $direction = $null
    $newDirection = $null
    $previousNumber = $null

    while(($i -lt $levels.Count) -and $safe) {

        if($i -ne 0) {

            $difference = [int]$levels[$i] - $previousNumber

            if($difference -in @(1,2,3)) { $newDirection = "increasing" }
            elseif($difference -in @(-1,-2,-3)) { $newDirection = "decreasing" }
            else { $safe = $false }

            if($null -eq $direction) { $direction = $newDirection }
            elseif($direction -ne $newDirection) { $safe = $false }
        }

        [int]$previousNumber = $levels[$i]
        $i++
    }

    if($safe) { $safeReports++ }
}

Write-Host "There are $safeReports safe reports in the unusual data."

# The answer is 432