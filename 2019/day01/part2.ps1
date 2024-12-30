
# Advent of Code 2019
# Rasmus Dybro Larsen
# Day 1 - Part 2

$inputContent = Get-Content -LiteralPath input.txt

function Get-RequiredFuel([int]$Mass) {
    
    return (([Math]::Floor($Mass/3)) - 2)
}

$totalFuelMass = 0

foreach($module in $inputContent) {

    while($module -gt 0) {

        $calc = Get-RequiredFuel -Mass $module
        $module = $calc

        if($calc -gt 0) { $totalFuelMass += $calc }
    }
}

Write-Host "The sum of the fuel requirements is $totalFuelMass."

# Answer is 4.849.444