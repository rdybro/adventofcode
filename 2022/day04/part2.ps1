
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 4 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$count = 0

while($line = $inputReader.ReadLine()) {

    $lineSplit = $line.Split(",")
    $elf1 = $lineSplit[0].Split("-")
    $elf2 = $lineSplit[1].Split("-")

    if(
        (([int]$elf1[0] -le [int]$elf2[0]) -and ([int]$elf1[1] -ge [int]$elf2[0])) -or
        (([int]$elf1[0] -le [int]$elf2[1]) -and ([int]$elf1[1] -ge [int]$elf2[1])) -or
        (([int]$elf2[0] -le [int]$elf1[0]) -and ([int]$elf2[1] -ge [int]$elf1[0])) -or
        (([int]$elf2[0] -le [int]$elf1[1]) -and ([int]$elf2[1] -ge [int]$elf1[1]))
    ) { $count++ }
}

Write-Host "In $count assignment pairs the ranges overlap."

# Answer is 881

$inputReader.Close()
$inputReader.Dispose()