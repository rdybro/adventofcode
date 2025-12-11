
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 2 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

[Int64]$result = 0

$inputSplit = $inputContent.Split(",")

foreach($range in $inputSplit) {

    $rangeSplit = $range.Split("-")

    for($i = [Int64]$rangeSplit[0]; $i -le [Int64]$rangeSplit[1]; $i++) {

        if($i -match "^(\d+)\1$") { $result += $i }
    }
}

Write-Host "$result"

# The answer is 29.940.924.880

# Credits to u/4HbQ on the r/adventofcode subreddit for the tip on regex
# https://www.reddit.com/r/adventofcode/comments/1pbzqcx/comment/nru87hl/