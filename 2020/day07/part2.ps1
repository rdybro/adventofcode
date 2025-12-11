
# Advent of Code 2020
# Day 7 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt
#$inputContent = Get-Content -LiteralPath input_example2.txt

$bags = @()
$bagsCount = 0

foreach($line in $inputContent) {

    $lineSplit = $line.Split("contain").Trim().Replace(".","")

    $bags += [PSCustomObject]@{
        
        Bag = $lineSplit[0] -replace "s$"
        Content = @($lineSplit[1].Split(",").Trim() -replace "s$")
    }
}

$bagsTracking = [System.Collections.Generic.List[System.String]]"shiny gold bag"

while($bagsTracking) {

    $bagCurrent = $bags | Where-Object { $_.Bag -eq $bagsTracking[0] }
    $bagsTracking.RemoveAt(0)
    
    foreach ($bagNested in $bagCurrent.Content) {
        
        $bagNestedSplit = $bagNested.Split(" ",2)

        if($bagNestedSplit[0] -match "^[0-9]+$") {
            
            $bagsCount += $bagNestedSplit[0]
            $i = 1

            while($i -le $bagNestedSplit[0]){
                
                $bagsTracking.Add($bagNestedSplit[1])
                $i++
            }
        }
    }
}

Write-Host "A shiny gold bag contains $bagsCount bags"
