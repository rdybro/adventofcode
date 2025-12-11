
# Advent of Code 2020
# Day 1 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

:loop foreach($line in $inputContent) {

    foreach($compare in $inputContent) {

        if((([int]$line + [int]$compare) -eq 2020) -and ($line -ne $compare)) {

            Write-Host "$line AND $compare"
            Write-Host "Result is $([int]$line * [int]$compare)"

            break loop
        }
    }
}
