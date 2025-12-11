
# Advent of Code 2023
# Rasmus Dybro Larsen
# Day 7 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$cardList = @("f","e","d","c","b","9","8","7","6","5","4","3","2")
$handStrength = @{}

foreach($line in $inputContent) {

    $lineSplit = $line.Split(" ")
    $hand = $lineSplit[0].Replace("T","b").Replace("J","c").Replace("Q","d").Replace("K","e").Replace("A","f")
    $bid = [int]$lineSplit[1]

    $cards = $hand.ToCharArray()

    $typeArray = @()

    foreach($card in $cardList) { $typeArray += ($cards | Where-Object { $_ -eq $card }).Count }

    if($typeArray -contains 5) { $type = "6" }
    elseif($typeArray -contains 4) { $type = "5" }
    elseif(($typeArray -contains 3) -and ($typeArray -contains 2)) { $type = "4" }
    elseif($typeArray -contains 3) { $type = "3" }
    elseif(($typeArray | Where-Object { $_ -eq 2 }).Count -eq 2) { $type = "2" }
    elseif(($typeArray | Where-Object { $_ -eq 2 }).Count -eq 1) { $type = "1" }
    else { $type = 0 }

    $handStrength.Add("$type$hand",$bid)
}

$handStrengthOrdered = $handStrength.Keys | Sort-Object
$totalWinnings = 0

for($i = 0; $i -lt $handStrength.Count; $i++) { $totalWinnings += $handStrength[$handStrengthOrdered[$i]] * ($i + 1) }

Write-Host "The total winnings are $totalWinnings."

# The answer is 247.961.593