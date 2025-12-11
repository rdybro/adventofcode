
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 22 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example1.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example2.txt")

$sum = 0
$iterations = 2000

while([int]$secret = $inputReader.ReadLine()) {

    for($i = 0; $i -lt $iterations; $i++) {

        $secret = (($secret * 64) -bxor $secret) % 16777216
        $secret = ([Math]::Floor($secret / 32) -bxor $secret) % 16777216
        $secret = (($secret * 2048) -bxor $secret) % 16777216
    }

    $sum += $secret
}

Write-Host "The sum of all secret numbers after $iterations iterations is $sum."

# The answer is 13.185.239.446