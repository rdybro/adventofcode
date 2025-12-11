
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 1 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$elves = @()

while($inputReader.EndOfStream -eq $false) {

    $currentCalories = 0

    while([int]$line = $inputReader.ReadLine()) {

        $currentCalories += $line
    }
    
    $elves += $currentCalories
}

Write-Host "The 3 elves with the most calories is carrying combined $(($elves | Sort-Object -Descending | Select-Object -First 3 | Measure-Object -Sum).Sum) calories."

# Answer is 209.691

$inputReader.Close()
$inputReader.Dispose()