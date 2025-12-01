
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

    if($direction -eq "R") {

        for($i = 0; $i -lt $turns; $i++) {
            
            $dialPoint++

            if($dialPoint -eq 100) {

                $dialPoint = 0
                $result++
            }
        }
    }
    elseif($direction -eq "L") {
        
        for($i = 0; $i -lt $turns; $i++) {
            
            $dialPoint--

            if($dialPoint -eq 0) { $result++ }
            if($dialPoint -lt 0) { $dialPoint = 99 }
        }
    }
}

Write-Host "The dial moves to, or pass, 0 a total of $result times."

# The answer is 6700