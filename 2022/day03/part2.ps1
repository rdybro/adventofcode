
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 3 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$alphabetArray = [char[]]('a'[0]..'z'[0]) + [char[]]('A'[0]..'Z'[0])
$prioritySum = 0

$elf1 = $null
$elf2 = $null
$elf3 = $null

while($line = $inputReader.ReadLine()) {

    if($null -eq $elf1) { $elf1 = $line.ToCharArray() }
    elseif($null -eq $elf2) { $elf2 = $line.ToCharArray() }
    else {

        $elf3 = $line.ToCharArray()
        $compare = Compare-Object -ReferenceObject $elf1 -DifferenceObject $elf2 -ExcludeDifferent -IncludeEqual
        $sharedItem = (Compare-Object -ReferenceObject $elf3 -DifferenceObject $compare.InputObject -ExcludeDifferent -IncludeEqual).InputObject | Select-Object -Unique
        
        $prioritySum += [array]::indexof($alphabetArray,$sharedItem) + 1

        $elf1 = $null
        $elf2 = $null
        $elf3 = $null
    }
}

Write-Host "The total sum of priority values for items present in both compartments of each rucksack is $prioritySum."

# Answer is 2.585

$inputReader.Close()
$inputReader.Dispose()