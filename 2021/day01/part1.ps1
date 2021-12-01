
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 1 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$lastDepth = $null
$count = 0

foreach($measure in $inputContent) {
    
    if(($null -ne $lastDepth) -and ([int]$measure -gt [int]$lastDepth)) { $count++ }
    $lastDepth = $measure
}

Write-Host "$count measurements are larger than the previous measurement."

# Answer is 1466
