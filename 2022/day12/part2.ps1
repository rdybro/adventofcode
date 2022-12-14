
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 12 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$maxHorizontal = $inputContent.GetUpperBound(0)
$maxVertical = $inputContent[0].Length - 1

$map = @{}
$startKey = $null
$aSteps = @()

for($ver = 0; $ver -le $maxHorizontal; $ver++) {

    for($hor = 0; $hor -le $maxVertical; $hor++) {

        $key = "$ver-$hor"
        $height = $inputContent[$ver][$hor]
        $steps = 2147483647

        if($height -ceq "S") { $height = [char]"a" }
        elseif($height -ceq "E") { $height = [char]"z"; $startKey = $key; $steps = 0 }

        $map[$key] = @{
            Vertical = $ver
            Horizontal = $hor
            Height = $height
            Steps = $steps
        }
    }
}

$queue = [System.Collections.Generic.List[string]]::new()
$queue.Add($startKey)

while($queue -and ($null -eq $test)) {

    $currentLocation = $map[$queue[0]]
    $nextLocations = @(@($($currentLocation.Vertical-1),$currentLocation.Horizontal),@($($currentLocation.Vertical+1),$currentLocation.Horizontal),@($currentLocation.Vertical,$($currentLocation.Horizontal-1)),@($currentLocation.Vertical,$($currentLocation.Horizontal+1)))
    
        foreach($location in $nextLocations) {

            $locationKey = "$($location[0])-$($location[1])"
            $locationObject = $map[$locationKey]
            $newSteps = $currentLocation.Steps + 1

            if(($location[0] -ge 0) -and ($location[0] -le $maxHorizontal) -and ($location[1] -ge 0) -and ($location[1] -le $maxVertical) -and ($newSteps -lt $locationObject.Steps) -and ([int][char]$currentLocation.Height -le [int][char]$locationObject.Height+1)) {

                $locationObject.Steps = $newSteps

                if($locationObject.Height -ceq "a") { $aSteps += $newSteps }
                else { $queue.Add($locationKey) }
            }
        }

    $queue.RemoveAt(0)
}

Write-Host "Fewest steps required from a square with elevation 'a' to the location with the best signal is $($aSteps | Sort-Object | Select-Object -First 1) steps."

# Answer is 375
