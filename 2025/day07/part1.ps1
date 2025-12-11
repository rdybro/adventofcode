
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 7 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$totalSplits = 0
$startingLocation = $null
[int[]]$beams = @()

while($line = $inputReader.ReadLine()) {

    $charArray = [string[]]$line.ToCharArray()

    if(-not $startingLocation) {
        
        $startingLocation = $charArray.IndexOf("S")
        $beams += $startingLocation
    }
    else {

        $newArray = @()

        foreach($beam in $beams) {

            if($charArray[$beam] -eq "^") {
                
                $newArray += $beam-1
                $newarray += $beam+1
                $totalSplits++
            }
            else { $newArray += $beam }
        }

        $beams = $newArray | Sort-Object -Unique
    }
}

Write-Host "The beam splits $totalSplits times."

# The answer is 1662