
# Advent of Code 2020
# Day 15 - Part 1

$inputContent = @(1,2,16,19,18,0)

$array = @()
$lastNumber = 0

$turnTarget = 2020
$turnCurrent = 1

foreach($number in $inputContent) {

    $array += [PSCustomObject]@{ Turn = $turnCurrent; Number = $number }

    $lastNumber = $number
    $turnCurrent++
}

while($turnCurrent -le $turnTarget) {

    if(($array | Where-Object { $_.Number -eq $lastNumber }).Count -eq 1) { $lastNumber = 0 }
    else {
        
        $arr = $array | Where-Object { $_.Number -eq $lastNumber } | Select-Object -Last 2
        $lastNumber = $arr[1].Turn - $arr[0].Turn
    }

    $array += [PSCustomObject]@{ Turn = $turnCurrent; Number = $lastNumber }
    $turnCurrent++
}

Write-Host "The $($turnTarget)th number spoken is $lastNumber."
