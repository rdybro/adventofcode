
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 7 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

[ulong]$sumOfTrueEquations = 0

foreach($equation in $inputContent) {

    $equationSplit = $equation.Split(":")
    [ulong]$result = $equationSplit[0]
    $numbers = $equationSplit[1].Trim().Split(" ")

    [System.Collections.ArrayList]$queue = @(@{0=[ulong]$numbers[0]},@{0=[ulong]$numbers[0]})

    for($i = 1; $i -lt $numbers.Count; $i++) {

        while($queue.Keys -contains $i-1) {

            [ulong]$currentNumber = $queue[0][$i-1]
            $queue.RemoveAt(0)

            [ulong]$add = $currentNumber + $numbers[$i]
            [ulong]$multiply = $currentNumber * $numbers[$i]

            if($add -le $result) { $queue.Add(@{$i=$add}) | Out-Null }
            if($multiply -le $result) { $queue.Add(@{$i=$multiply}) | Out-Null }
        }
    }

    if($queue | Where-Object { ($_.Keys -eq $numbers.Count-1) -and ($_.Values -eq $result) }) { $sumOfTrueEquations += $result }
}

Write-Host "The sum of equations that can be true is $sumOfTrueEquations."

# The answer is 1.582.598.718.861
