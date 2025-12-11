
# Advent of Code 2020
# Day 1 - Part 2

$inputContent = Get-Content -LiteralPath input.txt

:loop foreach($line in $inputContent) {

    foreach($compare in $inputContent) {

        foreach($new in $inputContent) {

            if((([int]$line + [int]$compare + [int]$new) -eq 2020) -and ($line -ne $compare)) {

                Write-Host "$line AND $compare AND $new"
                Write-Host "Result is $([int]$line * [int]$compare * [int]$new)"

                break loop
            }
        }
    }
}
