
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 7 - Part 1

$inputContent = [System.Int32[]](Get-Content -LiteralPath input.txt).Split(",")
#$inputContent = @(16,1,2,0,4,2,7,1,2,14)

[int]$median = ($inputContent | Sort-Object)[($inputContent.Count - 1) / 2]
$fuelConsumption = 0

foreach($submarine in $inputContent) {

    if($submarine -gt $median) { $fuelConsumption += $submarine - $median }
    elseif($submarine -lt $median) { $fuelConsumption += $median - $submarine }
}

Write-Host "The optimal position is $median and the fuel consumption is $fuelConsumption."

# Answer is 340052
