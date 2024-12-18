
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 18 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$gridSize = 70
#$gridSize = 6 # Example input

$bytesToRun = $inputContent.Count
$firstBlockingByte = $null

while(-not $firstBlockingByte) {

    $corruptMemoryCoordinates = $inputContent | Select-Object -First $bytesToRun
    [System.Collections.ArrayList]$queue = @(,@($gridSize,$gridSize)) # Row, column, score
    [System.Collections.ArrayList]$visited = @()

    while($queue) {

        $coordinates = $queue[0]
    
        if(($coordinates[0] -eq 0) -and ($coordinates[1] -eq 0)) { $firstBlockingByte = $inputContent[$bytesToRun] }
        else {
            
            $directions = @(@(($coordinates[0]-1),$coordinates[1]),@($coordinates[0],($coordinates[1]+1)),@(($coordinates[0]+1),$coordinates[1]),@($coordinates[0],($coordinates[1]-1)))
        
            foreach($direction in $directions) {
                
                $string = "$($direction[0]),$($direction[1])"
            
                if(($direction[0] -ge 0) -and ($direction[0] -le $gridSize) -and ($direction[1] -ge 0) -and ($direction[1] -le $gridSize) -and ($string -notin $visited) -and ($string -notin $corruptMemoryCoordinates)) {
                    
                    $queue.Add(@($direction[0],$direction[1],($coordinates[2]+1))) | Out-Null
                    $visited.Add($string) | Out-Null
                }
            }
        }
        
        $queue.RemoveAt(0)
    }

    $bytesToRun--
}

Write-Host "The coordinates of the first byte that will prevent the exit from being reachable is $firstBlockingByte."

# The answer is "38,63"