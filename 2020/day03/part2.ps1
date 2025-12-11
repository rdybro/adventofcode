
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
        
        while($line.ToCharArray().Count -le $coordinateX) { $line += $line }
        # Need to use -le instead of -lt to make sure that $line is expanded in time
        # $line.ToCharArray().Count is counting all the characters in a row (31), while the grid are 0-indexed (0-30)
        # With -lt it would return $null on some lines because I would ask for $line[31]
        # This character would not exist, because the line wasn't expanded yet, as the line count wasn't exceeded
        
        if($line[$coordinateX] -eq "#") { $treeCount++ }
    }

    Write-Host $treeCount

    $treeCountMultiplied = $treeCountMultiplied * $treeCount
}

Write-Host "Tree count is $treeCountMultiplied"
