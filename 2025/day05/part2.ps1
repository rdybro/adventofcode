
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 5 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$result = 0
$freshIngredients = @{}

while($line = $inputReader.ReadLine()) {
    
    [Int64[]]$lineSplit = $line.Split("-")

    if(-not $freshIngredients[$lineSplit[0]]) { $freshIngredients.Add($lineSplit[0],$lineSplit[1]) }
    elseif($lineSplit[1] -gt $freshIngredients[$lineSplit[0]]) { $freshIngredients[$lineSplit[0]] = $lineSplit[1] }
}

$freshIngredients2 = @{}
[Int64]$previousFrom = 0

foreach($rangeFrom in $freshIngredients.Keys | Sort-Object) {

    $rangeTo = $freshIngredients[$rangeFrom]
    $previousTo = $freshIngredients2[$previousFrom]

    if(
        (($previousTo -ge $rangeFrom) -and ($previousTo -le $rangeTo)) -or
        ($rangeFrom -eq $previousTo)
    ) {
        
        # If $previousTo is within this range, or
        # if this range starts where the previous range stopped
        # then extend the previous range
        $freshIngredients2[$previousFrom] = $rangeTo
    }
    elseif(($rangeFrom -ge $previousFrom) -and ($rangeTo -le $previousTo)) {

        # If this range is fully within the previous range, do nothing
    }
    else {

        # Else, add this range to $freshIngredients2 and set $previousFrom for next iteration        
        $freshIngredients2.Add($rangeFrom,$rangeTo)
        $previousFrom = $rangeFrom
    }
}

foreach($rangeFrom in $freshIngredients2.Keys | Sort-Object) {

    $rangeTo = $freshIngredients2[$rangeFrom]
    # I add one to account for the ranges being inclusive
    $result += $rangeTo - $rangeFrom + 1
}

Write-Host "$result"

# The answer is 336.790.092.076.620