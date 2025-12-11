
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 5 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$result = 0

$freshIngredients = @()
$availableIngredients = @()

while($line = $inputReader.ReadLine()) { $freshIngredients += $line }
while($line = $inputReader.ReadLine()) { $availableIngredients += [Int64]$line }

foreach($ingredient in $availableIngredients) {

    $isFresh = $false
    $currentRange = 0

    while((-not $isFresh) -and ($currentRange -lt $freshIngredients.Count)) {

        $rangeSplit = $freshIngredients[$currentRange].Split("-")
        $rangeFrom = $rangeSplit[0]
        $rangeTo = $rangeSplit[1]

        if(($ingredient -ge $rangeFrom) -and ($ingredient -le $rangeTo)) {
            
            $isFresh = $true
            $result++
        }

        $currentRange++
    }
}

Write-Host "$result of the available ingredients are fresh."

# The answer is 509