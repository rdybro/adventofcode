
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 5 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$pageOrderingRules = @{}
$sumOfMiddlePageNumbersInIncorrectlyOrderedUpdates = 0

while($rule = $inputReader.ReadLine()) {

    $ruleSplit = $rule.Split("|")

    if($pageOrderingRules[$ruleSplit[0]]) { $pageOrderingRules[$ruleSplit[0]] += $ruleSplit[1] }
    else { $pageOrderingRules.Add($ruleSplit[0],@($ruleSplit[1])) }
}

while($update = $inputReader.ReadLine()) {

    [System.Collections.ArrayList]$updateSplit = $update.Split(",")
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

    if(-not $correctlyOrdered) {

        $sortedThisRound = $false
        $notSorted = $true
        $j = 1

        while($notSorted) {

            $currentNumber = $updateSplit[$j]
            $previousNumber = $updateSplit[$j-1]

            if($currentNumber -in $pageOrderingRules[$previousNumber]) {

                $updateSplit.Remove($currentNumber)
                $updateSplit.Insert($j-1,$currentNumber)
                $sortedThisRound = $true
            }

            if($j -lt $updateSplit.Count-1) { $j++ }
            elseif($sortedThisRound) { $sortedThisRound = $false; $j = 1}
            else { $notSorted = $false; $j = 1 }
        }

        $sumOfMiddlePageNumbersInIncorrectlyOrderedUpdates += $updateSplit[[Math]::Ceiling($updateSplit.Count/2)-1]
    }
}

Write-Host "The sum of middle page numbers in incorrectly ordered updates after sorting are $sumOfMiddlePageNumbersInIncorrectlyOrderedUpdates."

# The answer is 5.273