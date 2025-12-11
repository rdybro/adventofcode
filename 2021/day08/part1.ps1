
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 8 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$result = 0

foreach($line in $inputContent) {
    
    foreach($string in $line.Split("|")[1].Split(" ")) {

        if(($string.Length -eq 2) -or ($string.Length -eq 3) -or ($string.Length -eq 4) -or ($string.Length -eq 7)) { $result++ }
    }
}

Write-Host "Digits 1, 4, 7, or 8 appears $result times in the output."

# Answer is 421
