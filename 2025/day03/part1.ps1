
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 3 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$result = 0

while($batteryBank = $inputReader.ReadLine()) {

    $numberA = [int[]][string[]]$batteryBank.Substring(0,$batteryBank.Length-1).ToCharArray() | Sort-Object -Descending -Top 1

    $numberArray = [int[]][string[]]$batteryBank.ToCharArray()
    $numberIndex = $numberArray.IndexOf($numberA)

    $numberB = [int[]][string[]]$batteryBank.Substring($numberIndex+1,$batteryBank.Length-$numberIndex-1).ToCharArray() | Sort-Object -Descending -Top 1
    [int]$number = [string]$numberA + [string]$numberB

    $result += $number
}

Write-Host "The total joltage output is $result."

# The answer is 17.766