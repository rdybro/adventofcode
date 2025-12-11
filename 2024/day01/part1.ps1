
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 1 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$leftList = @()
$rightList = @()

foreach($line in $inputContent) {

    $lineSplit = $line.Split(" ")
    
    $leftList += $lineSplit[0]
    $rightList += $lineSplit[-1]
}

$leftListSorted = $leftList | Sort-Object
$rightListSorted = $rightList | Sort-Object

$sum = 0

for ($i = 0; $i -lt $leftListSorted.Count; $i++) {

    $distance = $leftListSorted[$i] - $rightListSorted[$i]
    
    if($distance -lt 0) { $distance = $distance * -1 }

    $sum += $distance
}

Write-Host "The total distance is $sum."

# The answer is 2.196.996