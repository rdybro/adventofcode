
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 3 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example2.txt

$instructions = Select-String -InputObject $inputContent -Pattern "mul\([0-9]{1,3},[0-9]{1,3}\)|do\(\)|don't\(\)" -AllMatches
$sumOfMultiplications = 0
$enabled = $true

foreach($instruction in $instructions.Matches.Value) {

    if(($instruction -like "mul(*") -and $enabled) {
        
        $numbers = (Select-String -InputObject $instruction -Pattern "[0-9]{1,3}" -AllMatches).Matches.Value
        $sumOfMultiplications += ([int]$numbers[0] * [int]$numbers[1])
    }
    elseif($instruction -eq "do()") { $enabled = $true }
    elseif($instruction -eq "don't()") { $enabled  = $false }
}

Write-Host "The sum of the multiplications is $sumOfMultiplications."

# The answer is 107.862.689