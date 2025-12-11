
# Advent of Code 2020
# Day 16 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$validNumbers = @()
$currentLine = 0

$scanningErrorRate = 0

while($inputContent[$currentLine] -ne "") {

    $split = $inputContent[$currentLine].Split(":").Split(" or ").Trim().Split("-")
    $validNumbers += ([int]$split[1]..[int]$split[2])
    $validNumbers += ([int]$split[3]..[int]$split[4])

    $currentLine++
}

# Jump to "Nearby tickets"
$currentLine += 5

while($currentLine -lt $inputContent.Count) {

    foreach($number in $inputContent[$currentLine].Split(",")) {
        
        if([int]$number -notin $validNumbers) { $scanningErrorRate += $number }
    }

    $currentLine++
}

Write-Host "Ticket scanning error rate is $scanningErrorRate."
