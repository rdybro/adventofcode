
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 12 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example1.txt
#$inputContent = Get-Content -LiteralPath input_example2.txt
#$inputContent = Get-Content -LiteralPath input_example3.txt

$queue = [System.Collections.Generic.List[string]]::new()
$paths = [System.Collections.Generic.List[string]]::new()

foreach($startPath in $inputContent | Where-Object { $_ -like "*start*" }) { $queue.Add("start-$($startPath.Replace('start','').Replace('-',''))") }

while($queue) {

    $currentPath = $queue[0]

    if($currentPath -like "*-end") { $paths.Add($currentPath) }
    else {

        $currentLocation = $currentPath.Split("-")[-1]
        $nextSteps = ($inputContent | Where-Object { ($_ -clike "$currentLocation-*") -or ($_ -clike "*-$currentLocation") }).Split("-") | Where-Object { ($_ -cnotlike "*$currentLocation*") -and ($_ -ne "start") }

        foreach($step in $nextSteps) {

            if(($step -cmatch "^[A-Z]*$") -or (($step -cmatch "^[a-z]*$") -and ($currentPath -cnotlike "*-$step*"))) { $queue.Add("$currentPath-$step") }
        }
    }

    $queue.RemoveAt(0)
}

Write-Host "There are $($paths.Count) paths through the cave system."

# Answer is 5333
