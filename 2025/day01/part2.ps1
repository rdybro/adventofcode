
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 1 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$result = 0
$dialPoint = 50

while($instruction = $inputReader.ReadLine()) {

    $direction = $instruction.Substring(0,1)
    $turns = $instruction.Substring(1)

    $modulusRemainder = $turns % 100
    $originalPosition = $dialPoint
    
    if($turns -ge 100) {

        $result += ($turns - $modulusRemainder) / 100
        $turns = $modulusRemainder
    }

    if($turns -gt 0) {
        
        if($direction -eq "R") { $dialPoint += $turns }
        elseif($direction -eq "L") { $dialPoint -= $turns }
    
        if($dialPoint -eq 0) { $result++ }
        elseif($dialPoint -gt 99) {
            
            $dialPoint -= 100
            $result++
        }
        elseif($dialPoint -lt 0) {
            
            $dialPoint += 100
            if($originalPosition -gt 0) { $result++ }
        }
    }
}

Write-Host "The dial points at 0 a total of $result times."

# The answer is 6700