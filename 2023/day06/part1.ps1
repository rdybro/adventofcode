
# Advent of Code 2023
# Rasmus Dybro Larsen
# Day 6 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$times = $inputContent[0].Split(":").Trim().Split(" ") | Where-Object { $_ -and ($_ -ne "Time") }
$distances = $inputContent[1].Split(":").Trim().Split(" ") | Where-Object { $_ -and ($_ -ne "Distance") }

$waysToWin = @()

for($i = 0; $i -lt $times.Count; $i++) {

    $currentTime = $times[$i]
    $recordDistance = $distances[$i]

    $currentWaysToWin = 0

    for($j = 1; $j -lt $currentTime; $j++) {

        $currentDistance = $j * ($currentTime - $j)

        if($currentDistance -gt $recordDistance) { $currentWaysToWin++ }
    }

    $waysToWin += $currentWaysToWin
}

$result = 0

foreach($count in $waysToWin) {

    if($result -eq 0) { $result = $count }
    else { $result = $result * $count }
}

Write-Host "Multiplying the numbers of ways to win each race gives the result $result."

# The answer is 131.376