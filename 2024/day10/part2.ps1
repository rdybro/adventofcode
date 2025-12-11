
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 10 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example1.txt
#$inputContent = Get-Content -LiteralPath input_example2.txt

$trailheadScoreSum = 0

for($i = 0; $i -lt $inputContent.Count; $i++) {

    for($j = 0; $j -lt $inputContent[$i].Length; $j++) {
        
        if($inputContent[$i][$j] -eq "0") {

            [System.Collections.ArrayList]$queue = @(,@([int]$j,[int]$i))
            $trailheadScore = 0
    
            while($queue) {
                
                $x = $queue[0][0]
                $y = $queue[0][1]
        
                [int]$value = [System.Int32]::Parse($inputContent[$y][$x])
        
                if($value -eq 9) { $trailheadScore++ }
                else {
                    
                    if(($y -gt 0) -and ([System.Int32]::Parse($inputContent[$y-1][$x])) -eq $value+1) { $queue.Add(@($x,($y-1))) | Out-Null }
                    if(($x -lt $inputContent[0].Length-1) -and ([System.Int32]::Parse($inputContent[$y][$x+1])) -eq $value+1) { $queue.Add(@(($x+1),$y)) | Out-Null }
                    if(($y -lt $inputContent.Count-1) -and ([System.Int32]::Parse($inputContent[$y+1][$x])) -eq $value+1) { $queue.Add(@($x,($y+1))) | Out-Null }
                    if(($x -gt 0) -and ([System.Int32]::Parse($inputContent[$y][$x-1])) -eq $value+1) { $queue.Add(@(($x-1),$y)) | Out-Null }
                }
        
                $queue.RemoveAt(0)
            }
    
            $trailheadScoreSum += $trailheadScore
        }
    }
}

Write-Host "The sum of the trailhead scores is $trailheadScoreSum."

# The answer is 1432