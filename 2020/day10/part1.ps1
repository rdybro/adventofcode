
# Advent of Code 2020
# Day 10 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$adaptersSorted = $inputContent | ForEach-Object { [int]$_ } | Sort-Object
$adaptersSorted += ($adaptersSorted | Select-Object -Last 1) + 3

$adapterPrevious = 0

$adapterDiffCount1 = 0
$adapterDiffCount3 = 0

foreach($adapter in $adaptersSorted) {
    
    if(($adapter - $adapterPrevious) -eq 1) { $adapterDiffCount1++ }
    elseif(($adapter - $adapterPrevious) -eq 3) { $adapterDiffCount3++ }

    $adapterPrevious = $adapter
}

Write-Host "The 1-jolt differences multiplied with 3-jolt differences is $($adapterDiffCount1 * $adapterDiffCount3)"
