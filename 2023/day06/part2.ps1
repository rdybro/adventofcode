
# Advent of Code 2023
# Rasmus Dybro Larsen
# Day 6 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

# This solution is quite slow, but it gets the job done eventually

$currentTime = $inputContent[0].Split(":")[1].Replace(" ","")
$recordDistance = $inputContent[1].Split(":")[1].Replace(" ","")

$currentWaysToWin = 0

for($j = 1; $j -lt $currentTime; $j++) {
    
    $currentDistance = $j * ($currentTime - $j)
    $canBreak = $false
    
    if($currentDistance -gt $recordDistance) { $currentWaysToWin++; $canBreak = $true }
    elseif(($currentDistance -le $recordDistance) -and $canBreak) { $j = [int]$currentTime }
}

Write-Host "We can beat the record in a total of $currentWaysToWin ways."

# The answer is 34.123.437