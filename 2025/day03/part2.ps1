
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 3 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

[Int64]$result = 0
$joltageSize = 12 # Set the size (number of characters) of the joltage int

while($batteryBank = $inputReader.ReadLine()) {

    # Select the highest number that still allows for the full length of the number ($joltageSize) afterwards
    $numberA = [int[]][string[]]$batteryBank.Substring(0,$batteryBank.Length-$joltageSize+1).ToCharArray() | Sort-Object -Descending -Top 1
    
    # Convert the battery bank to an array, and get the index of the highest number
    $numberArray = [int[]][string[]]$batteryBank.ToCharArray()
    $numberIndex = $numberArray.IndexOf($numberA)

    [string]$number = [string]$numberA

    for ($i = 1; $i -lt $joltageSize; $i++) {

        $numberB = [int[]][string[]]$batteryBank.Substring($numberIndex+1,$batteryBank.Length-$numberIndex-$joltageSize+$i).ToCharArray() | Sort-Object -Descending -Top 1
        $number += [string]$numberB

        # We need to get the index of the highest number ($numberB) that is after the index of the previous number ($numberIndex)
        # I remove the first numbers from the array, until (and including) the last selected number
        $numberArrayTemp = @($numberArray | Select-Object -Last ($numberArray.Count - 1 - $numberIndex))

        # Then we get the index of the selected next number in the temporary array, and add the index of the previously selected number, to get the index
        # A bit convoluted, but it works
        $numberIndex = $numberArrayTemp.IndexOf($numberB) + 1 + $numberIndex
    }

    $result += [Int64]$number
}

Write-Host "The total joltage output is $result."

# The answer is 176.582.889.354.075