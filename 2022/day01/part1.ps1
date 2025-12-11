
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 1 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$mostCalories = 0

while($inputReader.EndOfStream -eq $false) {

    $currentCalories = 0

    while([int]$line = $inputReader.ReadLine()) {

        $currentCalories += $line
    }

    if($currentCalories -gt $mostCalories) { $mostCalories = $currentCalories }
}

Write-Host "The elf with the most calories is carrying $mostCalories calories."

# Answer is 71.300

$inputReader.Close()
$inputReader.Dispose()