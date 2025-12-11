
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 7 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

[ulong]$sumOfTrueEquations = 0

foreach($equation in $inputContent) {

    $equationSplit = $equation.Split(":")
    [ulong]$result = $equationSplit[0]
    $numbers = $equationSplit[1].Trim().Split(" ")

    [System.Collections.ArrayList]$queue = @(,@(0,[ulong]$numbers[0]))

    $equationCheck = $true

    while($queue -and $equationCheck) {

        [ulong]$currentNumber = $queue[0][1]
        $index = $queue[0][0]+1

        $queue.RemoveAt(0)

        [ulong]$add = $currentNumber + $numbers[$index]
        [ulong]$multiply = $currentNumber * $numbers[$index]
        [ulong]$concat = [string]$currentNumber + [string]$numbers[$index]

        if($index -eq $numbers.Count-1) {

            if($add -eq $result) {

                $sumOfTrueEquations += $add
                $equationCheck = $false
            }
            elseif($multiply -eq $result) {

                $sumOfTrueEquations += $multiply
                $equationCheck = $false
            }
            elseif($concat -eq $result) {

                $sumOfTrueEquations += $concat
                $equationCheck = $false
            }
        }
        else {

            if($add -le $result) { $queue.Add(@($index,$add)) | Out-Null }
            if($multiply -le $result) { $queue.Add(@($index,$multiply)) | Out-Null }
            if($concat -le $result) { $queue.Add(@($index,$concat)) | Out-Null }
        }
    }
}

Write-Host "The sum of equations that can be true is $sumOfTrueEquations."

# The answer is 165.278.151.522.644