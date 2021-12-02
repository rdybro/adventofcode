
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 2 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$positionHorizontal = 0
$positionDepth = 0

foreach($instruction in $inputContent) {

    $instructionSplit = $instruction.Split(" ")
    
    if($instructionSplit[0] -eq "forward") { $positionHorizontal += $instructionSplit[1] }
    elseif($instructionSplit[0] -eq "down") { $positionDepth += $instructionSplit[1] }
    elseif($instructionSplit[0] -eq "up") { $positionDepth -= $instructionSplit[1] }
}

Write-Host "After following the instructions, I have a horizontal position of $positionHorizontal and a depth of $positionDepth."
Write-Host "Multiplying these together produces $($positionHorizontal * $positionDepth)."

# Answer is 1989014
