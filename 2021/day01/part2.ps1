
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 1 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$count = 0

for($i = 3; $i -lt $inputContent.Count; $i++) {
    
    [int]$windowA = [int]$inputContent[$i-1] + [int]$inputContent[$i-2] + [int]$inputContent[$i-3]
    [int]$windowB = [int]$inputContent[$i] + [int]$inputContent[$i-1] + [int]$inputContent[$i-2]

    if($windowB -gt $windowA) { $count++ }
}

Write-Host "$count measurements are larger than the previous measurement."

# Answer is 1491
