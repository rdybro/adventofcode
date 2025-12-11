
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 1 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$result = 0
$dialPoint = 50

while($instruction = $inputReader.ReadLine()) {

    $direction = $instruction.Substring(0,1)
    $turns = $instruction.Substring(1)

    if($direction -eq "R") {
        
        $dialPoint += $turns
        while($dialPoint -gt 99) { $dialPoint -= 100 }
    }
    elseif($direction -eq "L") {
        
        $dialPoint -= $turns
        while($dialPoint -lt 0) { $dialPoint += 100 }
    }

    if($dialPoint -eq 0) { $result++ }
}

Write-Host "The dial points at 0 a total of $result times."

# The answer is 1071