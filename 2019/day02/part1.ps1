
# Advent of Code 2019
# Rasmus Dybro Larsen
# Day 2 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

[int[]]$intcode = $inputContent.Split(",")

$intcode[1] = 12
$intcode[2] = 2

for($i = 0; $i -lt $intcode.Count; $i += 4) {

    if($intcode[$i] -eq 99) { $i = $intcode.Count }
    else {
        
        $valueA = $intcode[$intcode[$i+1]]
        $valueB = $intcode[$intcode[$i+2]]

        if($intcode[$i] -eq 1) { $val = $valueA + $valueB}
        elseif($intcode[$i] -eq 2) { $val = $valueA * $valueB }

        $intcode[$intcode[$i+3]] = $val
    }
}

Write-Host "The value $($intcode[0]) is at position 0 after the program halts."

# Answer is 3.101.878