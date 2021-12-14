
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

$lastFoldValue = $array.$foldAxis | Sort-Object | Select-Object -Last 1

foreach($fold in $folds) {

    $foldAxis = $fold.foldAxis
    $foldValue = $fold.foldValue

    foreach($item in $array | Where-Object { $_.$foldAxis -gt $foldValue } ) {

        $item.$foldAxis = ($lastFoldValue - $item.$foldAxis) + ($foldValue - ($lastFoldValue - $foldValue))
    }
}

$result = @()
$indexY = 0

while($indexY -le ($array.y | Sort-Object | Select-Object -Last 1)) {

    $indexX = 0
    $string = ""

    while($indexX -le ($array.x | Sort-Object | Select-Object -Last 1)) {

        if($array | where-object { ($_.x -eq $indexX) -and ($_.y -eq $indexY) }) { $string += "##" }
        else { $string += "  " }
        $indexX++
    }

    $result += $string
    $indexY++
}

Write-Host "The puzzle answer is:"
$result

# Answer is HLBUBGFR
