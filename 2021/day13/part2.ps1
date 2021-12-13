
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 13 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$array = @()
$folds = @()

while($line = $inputReader.ReadLine()) {

    $lineSplit = $line.Split(",")
    $array += [PSCustomObject]@{ x = [int]$lineSplit[0]; y = [int]$lineSplit[1] }
}

while($line = $inputReader.ReadLine()) {

    $lineSplit = $line.Split(" ")[-1].Split("=")
    $folds += [PSCustomObject]@{ foldAxis = $lineSplit[0]; foldValue = [int]$lineSplit[1] }
}

$inputReader.Close()
$inputReader.Dispose()

$last = $array.$foldAxis | Sort-Object | Select-Object -Last 1

foreach($fold in $folds) {

    $foldAxis = $fold.foldAxis
    $foldValue = $fold.foldValue

    $foldSideA = $foldValue
    $foldSideB = $last - $foldValue

    foreach($item in $array | Where-Object { $_.$foldAxis -gt $foldValue } ) {

        $item.$foldAxis = ($last - $item.$foldAxis) + ($foldSideA - $foldSideB)
    }
}

$maxX = $array.x | Sort-Object | Select-Object -Last 1
$maxY = $array.y | Sort-Object | Select-Object -Last 1
$iy = 0

$result = @()

while($iy -le $maxY) {

    $ix = 0
    $string = ""

    while($ix -le $maxX) {

        if($array | where-object { ($_.x -eq $ix) -and ($_.y -eq $iy) }) { $string += "##" }
        else { $string += "  " }
        $ix++
    }

    $result += $string
    $iy++
}

Write-Host "The puzzle answer is:"

$result

# Answer is HLBUBGFR
