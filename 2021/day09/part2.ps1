
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 9 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$sizeVertical = -1
$sizeHorizontal = $inputContent[0].Length - 1

$area = @(0..$sizeHorizontal)
$lowPoints = @()

foreach($line in $inputContent) { $sizeVertical++; $area[$sizeVertical] = $line.ToCharArray() }

$positionVertical = 0

while($positionVertical -le $sizeVertical) {

    $positionHorizontal = 0

    while($positionHorizontal -le $sizeHorizontal) {

        $location = [System.Int32]::Parse($area[$positionVertical][$positionHorizontal])

        if(
            (($positionVertical -eq 0) -or ($location -lt [System.Int32]::Parse($area[$positionVertical - 1][$positionHorizontal]))) -and 
            (($positionHorizontal -eq 0) -or ($location -lt [System.Int32]::Parse($area[$positionVertical][$positionHorizontal - 1]))) -and
            (($positionVertical -eq $sizeVertical) -or ($location -lt [System.Int32]::Parse($area[$positionVertical + 1][$positionHorizontal]))) -and 
            (($positionHorizontal -eq $sizeHorizontal) -or ($location -lt [System.Int32]::Parse($area[$positionVertical][$positionHorizontal + 1])))
        ) {

            $lowPoints += [PSCustomObject]@{"Vertical" = $positionVertical; "Horizontal" = $positionHorizontal; "Value" = $location; "BasinSize" = 0}
        }

        $positionHorizontal++
    }

    $positionVertical++
}

foreach($lowPoint in $lowPoints) {

    $queue = [System.Collections.Generic.List[string]]@("$($lowPoint.Vertical)-$($lowPoint.Horizontal)")
    $reached = [System.Collections.Generic.List[string]]::new()
    
    while($queue) {

        $positionSplit = $queue[0].Split("-")
        [int]$positionVertical = $positionSplit[0]
        [int]$positionHorizontal = $positionSplit[1]
        $positionValue = [System.Int32]::Parse($area[$positionVertical][$positionHorizontal])
        
        $reached.Add("$positionVertical-$positionHorizontal")
        $lowPoint.BasinSize++

        if(($positionVertical -gt 0) -and ($positionValue -lt [System.Int32]::Parse($area[$positionVertical - 1][$positionHorizontal])) -and ([System.Int32]::Parse($area[$positionVertical - 1][$positionHorizontal]) -lt 9) -and ($reached -notcontains "$($positionVertical - 1)-$positionHorizontal") -and ($queue -notcontains "$($positionVertical - 1)-$positionHorizontal")) {

            $queue.Add("$($positionVertical - 1)-$positionHorizontal")
        }
        if(($positionHorizontal -gt 0) -and ($positionValue -lt [System.Int32]::Parse($area[$positionVertical][$positionHorizontal - 1])) -and ([System.Int32]::Parse($area[$positionVertical][$positionHorizontal - 1]) -lt 9) -and ($reached -notcontains "$positionVertical-$($positionHorizontal - 1)") -and ($queue -notcontains "$positionVertical-$($positionHorizontal - 1)")) {

            $queue.Add("$positionVertical-$($positionHorizontal - 1)")
        }
        if(($positionVertical -lt $sizeVertical) -and ($positionValue -lt [System.Int32]::Parse($area[$positionVertical + 1][$positionHorizontal])) -and ([System.Int32]::Parse($area[$positionVertical + 1][$positionHorizontal]) -lt 9) -and ($reached -notcontains "$($positionVertical + 1)-$positionHorizontal") -and ($queue -notcontains "$($positionVertical + 1)-$positionHorizontal")) {

            $queue.Add("$($positionVertical + 1)-$positionHorizontal")
        }
        if(($positionHorizontal -lt $sizeHorizontal) -and ($positionValue -lt [System.Int32]::Parse($area[$positionVertical][$positionHorizontal + 1])) -and ([System.Int32]::Parse($area[$positionVertical][$positionHorizontal + 1]) -lt 9) -and ($reached -notcontains "$positionVertical-$($positionHorizontal + 1)") -and ($queue -notcontains "$positionVertical-$($positionHorizontal + 1)")) {

            $queue.Add("$positionVertical-$($positionHorizontal + 1)")
        }

        $queue.RemoveAt(0)
    }
}

$basinSizeTop = $lowPoints.BasinSize | Sort-Object -Descending | Select-Object -First 3

Write-Host "The largest basins are sizes $($basinSizeTop[0]), $($basinSizeTop[1]), and $($basinSizeTop[2])."
Write-Host "Multiplying these gives me the puzzle answer $($basinSizeTop[0] * $basinSizeTop[1] * $basinSizeTop[2])."

# Answer is 1048128
