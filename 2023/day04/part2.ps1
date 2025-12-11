
# Advent of Code 2023
# Rasmus Dybro Larsen
# Day 4 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$cards = @{}

foreach($line in $inputContent) {

    $cardSplit1 = $line.Split(":")
    $cardNumber = $cardSplit1[0].Split(" ") | Select-Object -Last 1

    $cardSplit2 = $cardSplit1[1].Split("|").Trim()
    $winningNumbers = $cardSplit2[0].Split(" ") | Where-Object { $_ }
    $myNumbers = $cardSplit2[1].Split(" ") | Where-Object { $_ }

    $compare = Compare-Object -ReferenceObject $myNumbers -DifferenceObject $winningNumbers -ExcludeDifferent -IncludeEqual

    # Stores the amount of winning numbers and how many copies of this card we have acquired
    $cards.Add([int]$cardNumber,@($compare.Count,1))
}

$sum = 0

foreach($card in ($cards.Keys | Sort-Object)) {

    for($i = 1; $i -le $cards[$card][0]; $i++) {

        $nextCard = [int]$card + $i

        if($nextCard -le $inputContent.Count) {

            for ($j = 1; $j -le $cards[$card][1]; $j++) {

                $cards[$nextCard][1]++
            }
        }
    }

    $sum += $cards[$card][1]
}

Write-Host "I end up with $sum total scratchcards left."

# The answer is 19.499.881