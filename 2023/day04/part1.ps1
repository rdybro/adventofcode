
# Advent of Code 2023
# Rasmus Dybro Larsen
# Day 4 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$points = 0

foreach($card in $inputContent) {

    $cardSplit = $card.Split(":")[1].Split("|").Trim()
    $winningNumbers = $cardSplit[0].Split(" ") | Where-Object { $_ }
    $myNumbers = $cardSplit[1].Split(" ") | Where-Object { $_ }

    $compare = Compare-Object -ReferenceObject $myNumbers -DifferenceObject $winningNumbers -ExcludeDifferent -IncludeEqual

    $points += switch ($compare.Count) {
        1 { 1 }
        2 { 2 }
        3 { 4 }
        4 { 8 }
        5 { 16 }
        6 { 32 }
        7 { 64 }
        8 { 128 }
        9 { 256 }
        10 { 512 }
        Default { 0 }
    }
}

Write-Host "All the scratchcards are woth $points points in total."

# The answer is 25.651