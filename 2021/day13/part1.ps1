
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 13 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$array = @()

while($line = $inputReader.ReadLine()) {

    $lineSplit = $line.Split(",")
    $array += [PSCustomObject]@{ x = [int]$lineSplit[0]; y = [int]$lineSplit[1] }
}

$fold = $inputReader.ReadLine().Split(" ")[-1].Split("=")
$foldAxis = $fold[0]
$foldValue = $fold[1]

$inputReader.Close()
$inputReader.Dispose()

$lastFoldValue = $array.$foldAxis | Sort-Object | Select-Object -Last 1

foreach($item in $array | Where-Object { $_.$foldAxis -gt $foldValue } ) {

    $item.$foldAxis = ($lastFoldValue - $item.$foldAxis) + ($foldValue - ($lastFoldValue - $foldValue))
}

Write-Host "There are $(($array | Group-Object -Property x,y).Count) dots visible after the first fold."

# Answer is 810
