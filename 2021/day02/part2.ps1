
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 2 - Part 2

$inputContent = Get-Content -LiteralPath input.txt

$positionHorizontal = 0
$positionDepth = 0
$positionAim = 0

foreach($instruction in $inputContent) {

    $instructionSplit = $instruction.Split(" ")
    
    if($instructionSplit[0] -eq "forward") {

        $positionHorizontal += $instructionSplit[1]
        $positionDepth += [int]$instructionSplit[1] * $positionAim
    }
    elseif($instructionSplit[0] -eq "down") { $positionAim += $instructionSplit[1] }
    elseif($instructionSplit[0] -eq "up") { $positionAim -= $instructionSplit[1] }
}

Write-Host "After following the instructions, I have a horizontal position of $positionHorizontal and a depth of $positionDepth."
Write-Host "Multiplying these together produces $($positionHorizontal * $positionDepth)."

# Answer is 2006917119
