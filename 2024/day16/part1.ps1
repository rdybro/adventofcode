
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 16 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example1.txt
#$inputContent = Get-Content -LiteralPath input_example2.txt

[System.Collections.ArrayList]$queue = @()
[System.Collections.ArrayList]$visited = @()
$lowestScore = $null

for($row = 0; $row -lt $inputContent.Count; $row++) {

    for($column = 0; $column -lt $inputContent[$row].Length; $column++) {

        if($inputContent[$row][$column] -eq "S") {

            $queue.Add([PSCustomObject]@{Score=0;Row=[int]$row;Column=[int]$column;Direction="East"}) | Out-Null
        }
    }
}

while(-not $lowestScore) {

    $current = $queue | Sort-Object Score | Select-Object -First 1
    $visited.Add("$($current.Row),$($current.Column)") | Out-Null

    if($inputContent[$current.Row][$current.Column] -eq "E") { $lowestScore = $current.Score }
    elseif($inputContent[$current.Row][$current.Column] -ne "#") {

        $directions = @("North",($current.Row-1),$current.Column),@("East",$current.Row,($current.Column+1)),@("South",($current.Row+1),$current.Column),@("West",$current.Row,($current.Column-1))

        # I exclude the opposite direction of what we are currently facing, as we can't turn 180 degrees (and it also wouldn't make sense)
        if($current.Direction -eq "North") { $directions = $directions | Where-Object { $_[0] -ne "South" } }
        elseif($current.Direction -eq "East") { $directions = $directions | Where-Object { $_[0] -ne "West" } }
        elseif($current.Direction -eq "South") { $directions = $directions | Where-Object { $_[0] -ne "North" } }
        elseif($current.Direction -eq "West") { $directions = $directions | Where-Object { $_[0] -ne "East" } }

        foreach($direction in $directions) {

            if(($direction[1] -ge 0) -and ($direction[1] -lt $inputContent.Count) -and ($direction[2] -ge 0) -and ($direction[2] -lt $inputContent[0].Length) -and ("$($direction[1]),$($direction[2])" -notin $visited)) {

                if($current.Direction -ne $direction[0]) { $rotateScore = 1000 }
                else { $rotateScore = 0 }
                
                $object = [PSCustomObject]@{
                    Score = $current.Score + 1 + $rotateScore
                    Row= $direction[1]
                    Column = $direction[2]
                    Direction = $direction[0]
                }

                $queue.Add($object) | Out-Null
            }
        }
    }

    $queue.Remove($current)
}

Write-Host "The lowest score for a reindeer is $lowestScore."

# The answer is 115.500

# It's a bit slow to complete, but it gets the job done