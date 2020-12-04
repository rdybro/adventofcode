
# Advent of Code 2020
# Day 3 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$coordinateX = 0
$coordinateY = 0
$treeCount = 0

# I subtract 1 from line count of $inputContent as we are starting on the first line with no tree

while($coordinateY -lt $($inputContent.Count - 1)) {

    $coordinateX += 3
    $coordinateY += 1

    $line = $inputContent[$coordinateY]

    while($line.ToCharArray().Count -le $coordinateX) { $line += $line }

    if($line[$coordinateX] -eq "#") { $treeCount++ }
}

Write-Host "Tree count is $treeCount"
