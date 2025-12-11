
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 18 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$gridSize = 70
$bytesToRun = 1024

#$gridSize = 6 # Example input
#$bytesToRun = 12 # Example input

$corruptMemoryCoordinates = $inputContent | Select-Object -First $bytesToRun
[System.Collections.ArrayList]$queue = @(,@(0,0,0)) # Row, column, score
[System.Collections.ArrayList]$visited = @()
$stepsToReachExit = $null

while(-not $stepsToReachExit) {

    $coordinates = $queue[0]

    if(($coordinates[0] -eq $gridSize) -and ($coordinates[1] -eq $gridSize)) { $stepsToReachExit = $coordinates[2] }
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

Write-Host "It takes at least $stepsToReachExit steps to reach the exit."

# The answer is 306