
# Advent of Code 2020
# Day 3 - Part 2

$inputContent = Get-Content -LiteralPath input.txt

$treeCountMultiplied = 1
$slopes = @(@(1,1),@(3,1),@(5,1),@(7,1),@(1,2))

foreach ($slope in $slopes) {
    
    $coordinateX = 0
    $coordinateY = 0
    $treeCount = 0

    # I subtract 1 from line count of $inputContent as we are starting on the first line with no tree
    
    while($coordinateY -lt $($inputContent.Count - 1)) {
        
        $coordinateX += $slope[0]
        $coordinateY += $slope[1]
        
        $line = $inputContent[$coordinateY]
        
        while($line.ToCharArray().Count -lt $coordinateX) { $line += $line }
        
        if($line[$coordinateX] -eq "#") { $treeCount++ }
    }

    Write-Host $treeCount

    $treeCountMultiplied = $treeCountMultiplied * $treeCount
}

Write-Host "Tree count is $treeCountMultiplied"

# I am not getting right answer
# Getting correct answer on example input though
# Need to re-visit this one
# Wrong answer: 3043957440
