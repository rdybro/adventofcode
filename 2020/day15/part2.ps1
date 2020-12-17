
# Advent of Code 2020
# Day 15 - Part 2

$inputContent = @(1,2,16,19,18,0)

# Heavily inspired by
# https://www.reddit.com/r/PowerShell/comments/kdgfq1/advent_of_code_2020_day_15_rambunctious_recitation/gfwcxyc
# His runs significantly faster than mine though, not really sure why

$previousTurns = @{}
$lastNumber = 0
$turnCurrent = 1
$turnTarget = 30000000

foreach($number in $inputContent) {

    $previousTurns[$number] = $turnCurrent
    $lastNumber = $number
    $turnCurrent++
}

while($turnCurrent -le $turnTarget) {
    
    $previousTurn = $previousTurns[$lastNumber]
    $previousTurns[$lastNumber] = $turnCurrent - 1
    
    if($previousTurn) { $lastNumber = $turnCurrent - 1 - $previousTurn }
    else { $lastNumber = 0 }

    $turnCurrent++
}

Write-Host "The $($turnTarget)th number spoken is $lastNumber."
