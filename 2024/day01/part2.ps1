
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 1 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$leftList = @()
$rightList = @()

foreach($line in $inputContent) {

    $lineSplit = $line.Split(" ")
    
    $leftList += $lineSplit[0]
    $rightList += $lineSplit[-1]
}

$sum = 0
$alreadyCounted = @()

foreach($number in $leftList | Where-Object { $_ -notin $alreadyCounted }) {

    $sum += [int]$number * $(($rightList | Where-Object { $_ -eq $number }).Count) * $(($leftList | Where-Object { $_ -eq $number }).Count)
    $alreadyCounted += $number
}

Write-Host "The total distance is $sum."

# The answer is 23.655.822