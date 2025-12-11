
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 6 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$grandTotal = 0
$problems = @{}

while($line = $inputReader.ReadLine()) {

    $lineSplit = $line.Split(" ") | Where-Object { $_ }

    for($i = 0; $i -lt $lineSplit.Count; $i++) {

        if($problems[$i]) { $problems[$i] += "$($lineSplit[$i]) " }
        else { $problems.Add($i,"$($lineSplit[$i]) ") }
    }
}

foreach($problemKey in $problems.Keys) {

    $problemSplit = $problems[$problemKey].Trim().Split(" ")
    $problem = $problemSplit | Where-Object { $_ -notin @("+","*") }
    $operator = $problemSplit[-1]

    $grandTotal += Invoke-Expression -Command $($problem -join $operator)
}

Write-Host "The grand total of all the answers are $grandTotal."

# The answer is 4.648.618.073.226