
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 9 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$sum = 0

$sizeVertical = -1
$sizeHorizontal = $inputContent[0].Length - 1

$area = @(0..$sizeHorizontal)

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

            $sum += $location + 1
        }

        $positionHorizontal++
    }

    $positionVertical++
}

Write-Host "The sum of the risk level of all low points on my map is $sum."

# Answer is 494
