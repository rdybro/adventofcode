
# Advent of Code 2023
# Rasmus Dybro Larsen
# Day 8 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example1.txt
#$inputContent = Get-Content -LiteralPath input_example2.txt

$instructions = $null
$nodes = @{}

foreach($line in ($inputContent | Where-Object { $_ })) {

    if(-not $instructions) { $instructions = $line }
    else {

        $lineSplit = $line.Split("=").Trim()
        $nextLocations = $lineSplit[1].Replace("(","").Replace(")","").Split(",").Trim()

        $nodes.Add($lineSplit[0],$nextLocations)
    }
}

$instructionsConverted = $instructions.Replace("L","0").Replace("R","1").ToCharArray()
$nextLocation = "AAA"
$steps = 0

for($i = 0; $i -lt $instructionsConverted.Count; $i++) {

    $nextLocation = $nodes[$nextLocation][[int]$instructionsConverted[$i].ToString()]
    $steps++
    
    if($nextLocation -eq "ZZZ") { $i = $instructionsConverted.Count }
    elseif($i -eq ($instructionsConverted.Count - 1)) { $i = -1 }
}

Write-Host "$steps steps are required to get from AAA to ZZZ."

# The answer is 13.939