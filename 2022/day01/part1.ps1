
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 1 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$mostCalories = 0
$currentCalories = 0

while($inputReader.EndOfStream -eq $false) {

    [int]$line = $inputReader.ReadLine()

    if($line -gt 0) { $currentCalories += $line }
    elseif($currentCalories -gt $mostCalories) { $mostCalories = $currentCalories; $currentCalories = 0 }
    else { $currentCalories = 0 }
}

Write-Host "The elf with the most calories is carrying $mostCalories calories."

# Answer is 71.300

$inputReader.Close()
$inputReader.Dispose()