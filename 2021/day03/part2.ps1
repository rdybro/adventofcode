
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 3 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$oxygenGeneratorRating = $inputContent
$oxygenGeneratorRatingBinary = ""
$index = 0

while($oxygenGeneratorRating.Count -gt 1) {

    $rating = 0

    foreach($item in $oxygenGeneratorRating) {
        
        if($item[$index] -eq "1") { $rating++ }
        elseif($item[$index] -eq "0") { $rating-- }
    }

    if($rating -ge 0) { $oxygenGeneratorRatingBinary += "1" }
    elseif($rating -lt 0) { $oxygenGeneratorRatingBinary += "0" }

    $oxygenGeneratorRating = $oxygenGeneratorRating | Where-Object { $_ -like "$oxygenGeneratorRatingBinary*" }
    $index++
}

$co2ScrubberRating = $inputContent
$co2ScrubberRatingBinary = ""
$index = 0

while($co2ScrubberRating.Count -gt 1) {

    $rating = 0

    foreach($item in $co2ScrubberRating) {
        
        if($item[$index] -eq "1") { $rating++ }
        elseif($item[$index] -eq "0") { $rating-- }
    }

    if($rating -ge 0) { $co2ScrubberRatingBinary += "0" }
    elseif($rating -lt 0) { $co2ScrubberRatingBinary += "1" }

    $co2ScrubberRating = $co2ScrubberRating | Where-Object { $_ -like "$co2ScrubberRatingBinary*" }
    $index++
}

$oxygenGeneratorRatingInt = [Convert]::ToInt32($oxygenGeneratorRating,2)
$co2ScrubberRatingInt = [Convert]::ToInt32($co2ScrubberRating,2)

Write-Host "The oxygen generator rating is $oxygenGeneratorRatingInt ($oxygenGeneratorRating) and the CO2 scrubber rating is $co2ScrubberRatingInt ($co2ScrubberRating)."
Write-Host "Multiplying these together produces $($oxygenGeneratorRatingInt * $co2ScrubberRatingInt)."

# Answer is 6822109
