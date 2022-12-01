
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 1 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$elves = @()
$currentCalories = 0

while($inputReader.EndOfStream -eq $false) {

    [int]$line = $inputReader.ReadLine()

    if($line -gt 0) { $currentCalories += $line }
    else { $elves += $currentCalories; $currentCalories = 0 }
}

Write-Host "The 3 elves with the most calories is carrying combined $(($elves | Sort-Object -Descending | Select-Object -First 3 | Measure-Object -Sum).Sum) calories."

# Answer is 209.691

$inputReader.Close()
$inputReader.Dispose()