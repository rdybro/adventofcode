
# Advent of Code 2019
# Rasmus Dybro Larsen
# Day 1 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$totalFuelMass = 0

foreach($module in $inputContent) {

    $totalFuelMass += ([Math]::Floor($module/3)) - 2
}

Write-Host "The sum of the fuel requirements is $totalFuelMass."

# Answer is 3.234.871