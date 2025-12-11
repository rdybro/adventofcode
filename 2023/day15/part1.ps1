
# Advent of Code 2023
# Rasmus Dybro Larsen
# Day 15 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$sumOfHashAlgorithmOutputs = 0

foreach($step in $inputContent.Split(",")) {

    $currentValue = 0

    foreach($char in $step.ToCharArray()) {

        # Determine the ASCII code for the current character of the string.
        # Increase the current value by the ASCII code you just determined.
        $currentValue += [byte][char]$char
        
        # Set the current value to itself multiplied by 17.
        $currentValue *= 17
        
        # Set the current value to the remainder of dividing itself by 256.
        $currentValue %= 256
    }

    $sumOfHashAlgorithmOutputs += $currentValue
}

Write-Host "The sum of the HASH algorithm outputs is $sumOfHashAlgorithmOutputs."

# The answer is 508.498