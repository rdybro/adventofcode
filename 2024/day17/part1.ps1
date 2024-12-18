
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 17 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$registerA = $inputContent[0].Split(":")[1].Trim()
$registerB = $inputContent[1].Split(":")[1].Trim()
$registerC = $inputContent[2].Split(":")[1].Trim()
$program = $inputContent[4].Split(":")[1].Trim().Split(",")

$output = @()

for($i = 0; $i -lt $program.Count; $i+=2) {

    $opcode = switch ($program[$i]) {
        0 { "adv" }
        1 { "bxl" }
        2 { "bst" }
        3 { "jnz" }
        4 { "bxc" }
        5 { "out" }
        6 { "bdv" }
        7 { "cdv" }
    }

    [int]$literalOperand = $program[$i+1]

    [int]$comboOperand = switch ($literalOperand) {
        4 { $registerA }
        5 { $registerB }
        6 { $registerC }
        default { $literalOperand }
    }
    
    if($opcode -in "adv","bdv","cdv") {

        [int]$result = [Math]::Floor($registerA / ([Math]::Pow(2,$comboOperand)))

        if($opcode -eq "adv") { $registerA = $result }
        elseif($opcode -eq "bdv") { $registerB = $result }
        else { $registerC = $result }
    }
    elseif($opcode -eq "bxl") { $registerB = $registerB -bxor $literalOperand }
    elseif($opcode -eq "bxc") { $registerB = $registerB -bxor $registerC }
    elseif($opcode -eq "bst") { $registerB = $comboOperand % 8 }
    elseif(($opcode -eq "jnz") -and ($registerA -ne 0)) { $i = $literalOperand-2 }
    elseif($opcode -eq "out") { $output += $comboOperand % 8 }
}

Write-Host "The output of the program is:"
Write-Host ($output -join ",")

# The answer is "1,5,3,0,2,5,2,5,3"