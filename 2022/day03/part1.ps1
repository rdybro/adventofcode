
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 3 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$alphabetArray = [char[]]('a'[0]..'z'[0]) + [char[]]('A'[0]..'Z'[0])
$prioritySum = 0

while($line = $inputReader.ReadLine()) {

    $rucksack = $line.ToCharArray()
    $compartment1 = $rucksack | Select-Object -First $($rucksack.Count/2)
    $compartment2 = $rucksack | Select-Object -Last $($rucksack.Count/2)
    $sharedItem = (Compare-Object -ReferenceObject $compartment1 -DifferenceObject $compartment2 -ExcludeDifferent -IncludeEqual).InputObject | Select-Object -Unique
    $prioritySum += [array]::indexof($alphabetArray,$sharedItem) + 1
}

Write-Host "The total sum of priority values for items present in both compartments of each rucksack is $prioritySum."

# Answer is 7.917

$inputReader.Close()
$inputReader.Dispose()