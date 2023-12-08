
# Advent of Code 2023
# Rasmus Dybro Larsen
# Day 7 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$cardList = @("f","e","d","b","9","8","7","6","5","4","3","2")
$handStrength = @{}

foreach($line in $inputContent) {

    $lineSplit = $line.Split(" ")
    $hand = $lineSplit[0].Replace("T","b").Replace("J","0").Replace("Q","d").Replace("K","e").Replace("A","f")
    $bid = [int]$lineSplit[1]

    $cards = $hand.ToCharArray()
    $jokers = ($cards | Where-Object { $_ -eq "0" }).Count

    $array = @()

    foreach($card in $cardList) { $array += ($cards | Where-Object { $_ -eq $card }).Count }

    $maxCardAmount = ($array | Sort-Object -Descending | Select-Object -First 1) + $jokers

    if($maxCardAmount -eq 5) { $type = "6" }
    elseif($maxCardAmount -eq 4) { $type = "5" }
    elseif((($array | Where-Object { $_ -eq 2 }).Count -eq 2) -and ($jokers -eq 1)) { $type = "4" }
    elseif(($array -contains 3) -and ($array -contains 2)) { $type = "4" }
    elseif($maxCardAmount -eq 3) { $type = "3" }
    elseif(($array | Where-Object { $_ -eq 2 }).Count -eq 2) { $type = "2" }
    elseif($maxCardAmount -eq 2) { $type = "1" }
    else { $type = 0 }

    $handStrength.Add("$type$hand",$bid)
}

$handStrengthOrdered = $handStrength.Keys | Sort-Object
$totalWinnings = 0

for($i = 0; $i -lt $handStrength.Count; $i++) { $totalWinnings += $handStrength[$handStrengthOrdered[$i]] * ($i + 1) }

Write-Host "The total winnings are $totalWinnings."

# The answer is 248.750.699