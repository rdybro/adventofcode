
# Advent of Code 2023
# Rasmus Dybro Larsen
# Day 1 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example1.txt

$sum = 0

foreach($line in $inputContent) {

    $line -match "^[A-Za-z]*([0-9])(.*([0-9]))?[A-Za-z]*$" | Out-Null
    
    if($Matches[3]) { $number = "$($Matches[1])$($Matches[3])" }
    else { $number = "$($Matches[1])$($Matches[1])" }

    $sum += $number
}

Write-Host "The sum of the calibration values is $sum."

# The answer is 54.601