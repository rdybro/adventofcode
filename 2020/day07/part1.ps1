
# Advent of Code 2020
# Day 7 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$bags = @()
$bagsAnswer = @()

foreach($line in $inputContent) {

    $lineSplit = $line.Split("contain").Trim().Replace(".","")

    $bags += [PSCustomObject]@{
        
        Bag = $lineSplit[0] -replace "s$"
        Content = @($lineSplit[1].Split(",").Trim() -replace "^[0-9] " -replace "s$")
    }
}

function Find-ShinyGoldBag($searchBag, $searchRoot, $searchArray = $bags) {

    $thisBag = $searchArray | Where-Object { $_.Bag -eq $searchBag }

    if($thisBag.Content -contains "shiny gold bag") { return $searchRoot }
    elseif($thisBag.Content -contains "no other bag") { return $null }

    foreach($item in $thisBag.Content) {

        Find-ShinyGoldBag $item $searchRoot
    }

    return $null
}

foreach ($bag in ($bags | Where-Object { ($_.Bag -ne "shiny gold bag") -and ($_.Content -notcontains "no other bag") })) {

    $newBag = Find-ShinyGoldBag $bag.Bag $bag.Bag

    if($newBag) { $bagsAnswer += $newBag }
}

Write-Host "$(($bagsAnswer | Sort-Object | Get-Unique).Count) bags can contain shiny gold bags"

# This one is horrible ineffective - it took an eternity to run
# But it got the job done eventually, and I don't think I will revisit to optimize
