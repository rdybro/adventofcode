
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 3 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example1.txt

$instructions = Select-String -InputObject $inputContent -Pattern "mul\([0-9]{1,3},[0-9]{1,3}\)" -AllMatches
$sumOfMultiplications = 0

foreach($instruction in $instructions.Matches.Value) {

    $numbers = (Select-String -InputObject $instruction -Pattern "[0-9]{1,3}" -AllMatches).Matches.Value
    $sumOfMultiplications += ([int]$numbers[0] * [int]$numbers[1])
}

Write-Host "The sum of the multiplications is $sumOfMultiplications."

# The answer is 184.122.457