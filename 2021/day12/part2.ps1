
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 12 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example1.txt
#$inputContent = Get-Content -LiteralPath input_example2.txt
#$inputContent = Get-Content -LiteralPath input_example3.txt

$queue = [System.Collections.Generic.List[string]]::new()
$paths = [System.Collections.Generic.List[string]]::new()

$smallCaves = ($inputContent.Split("-") | Group-Object | Where-Object { ($_.Name -ne "start") -and ($_.Name -ne "end") -and ($_.Name -cmatch "^[a-z]*$") }).Name

foreach($startPath in $inputContent | Where-Object { $_ -like "*start*" }) {

    foreach($smallCave in $smallCaves) {

        $queue.Add("$smallCave/start-$($startPath.Replace('start','').Replace('-',''))")
    }
}

while($queue) {

    $currentSplit = $queue[0].Split("/")
    $currentSmallCave = $currentSplit[0]
    $currentPath = $currentSplit[1]

    if(($currentPath -like "*-end") -and ($paths -notcontains $currentPath)) { $paths.Add("$currentPath") }
    else {

        $currentLocation = $currentPath.Split("-")[-1]
        $nextSteps = ($inputContent | Where-Object { ($_ -clike "$currentLocation-*") -or ($_ -clike "*-$currentLocation") }).Split("-") | Where-Object { ($_ -cnotlike "*$currentLocation*") -and ($_ -ne "start") }

        foreach($step in $nextSteps) {

            if(($step -cmatch "^[A-Z]*$") -or 
            (($step -cmatch "^[a-z]*$") -and ($step -ne $currentSmallCave) -and ($currentPath -cnotlike "*-$step*")) -or
            (($step -eq $currentSmallCave) -and (($currentPath.Split("-") | Where-Object { $_ -eq $step }).Count -lt 2))) {
                
                $queue.Add("$currentSmallCave/$currentPath-$step")
            }
        }
    }

    $queue.RemoveAt(0)
}

Write-Host "There are $($paths.Count) paths through the cave system."

# Answer is 146553
# This solution runs incredibly slow, and should be optimized
