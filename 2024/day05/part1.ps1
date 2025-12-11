
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 5 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$pageOrderingRules = @{}
$sumOfMiddlePageNumbersInCorrectOrderedUpdates = 0

while($rule = $inputReader.ReadLine()) {

    $ruleSplit = $rule.Split("|")

    if($pageOrderingRules[$ruleSplit[0]]) { $pageOrderingRules[$ruleSplit[0]] += $ruleSplit[1] }
    else { $pageOrderingRules.Add($ruleSplit[0],@($ruleSplit[1])) }
}

while($update = $inputReader.ReadLine()) {

    $updateSplit = $update.Split(",")
    $correctlyOrdered = $true

    $previousPageNumbers = @($updateSplit[0])
    $i = 1

    while(($i -lt $updateSplit.Count) -and $correctlyOrdered) {

        $pageNumber = $updateSplit[$i]

        foreach($pageNumber in $pageOrderingRules[$updateSplit[$i]]) {

            if($pageNumber -in $previousPageNumbers) { $correctlyOrdered = $false }
        }
        
        $previousPageNumbers += $updateSplit[$i]
        $i++
    }

    if($correctlyOrdered) { $sumOfMiddlePageNumbersInCorrectOrderedUpdates += $updateSplit[[Math]::Ceiling($updateSplit.Count/2)-1] }
}

Write-Host "The sum of middle page numbers in correctly ordered updates are $sumOfMiddlePageNumbersInCorrectOrderedUpdates."

# The answer is 5.639