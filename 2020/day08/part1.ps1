
# Advent of Code 2020
# Day 8 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$accumulator = 0
$instructionPosition = 0
$instructionsRun = @()
$instructionsOk = $true

while($instructionsOk) {

    $instructionCurrent = $inputContent[$instructionPosition].Split(" ")
    $instructionCurrentSign = $instructionCurrent[1].Substring(0,1)
    $instructionCurrentValue = $instructionCurrent[1].Substring(1)

    if($instructionsRun -contains $instructionPosition) {
        
        $instructionsOk = $false
        break
    }
    else { $instructionsRun += $instructionPosition }

    if($instructionCurrent[0] -eq "acc") {

        if($instructionCurrentSign -eq "+") { $accumulator += $instructionCurrentValue }
        else { $accumulator -= $instructionCurrentValue }

        $instructionPosition++
    }
    elseif($instructionCurrent[0] -eq "jmp") {
        
        if($instructionCurrentSign -eq "+") { $instructionPosition += $instructionCurrentValue }
        else { $instructionPosition -= $instructionCurrentValue }
    }
    else { $instructionPosition++ }
}

Write-Host "The value of the accumulator is $accumulator."
