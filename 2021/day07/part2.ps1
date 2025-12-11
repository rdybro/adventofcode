
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 7 - Part 2

$inputContent = [System.Int32[]](Get-Content -LiteralPath input.txt).Split(",")
#$inputContent = @(16,1,2,0,4,2,7,1,2,14)

[int]$mean = ($inputContent | Measure-Object -Sum).Sum / $inputContent.Count -1
$fuelConsumption = 0

foreach($submarine in $inputContent) {

    if($submarine -ne $mean) {
        
        if($submarine -gt $mean) { $move = $submarine - $mean }
        elseif($submarine -lt $mean) { $move = $mean - $submarine }
    
        $fuelConsumption += ($move * ($move + 1)) / 2
    }
}

Write-Host "The optimal position is $mean and the fuel consumption is $fuelConsumption."

# Answer is 92948968
