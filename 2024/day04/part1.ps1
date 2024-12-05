
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 4 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$count = 0
$y = 0

foreach($row in $inputContent) {

    $x = 0
    $charArray = $row.ToCharArray()

    foreach($letter in $charArray) {

        if($letter -eq "X") {

            if(($y -ge 3) -and ($inputContent[$y-1][$x] -eq "M") -and ($inputContent[$y-2][$x] -eq "A") -and ($inputContent[$y-3][$x] -eq "S")) { $count++ }
            if(($y -ge 3) -and ($x -lt $charArray.Count-3) -and ($inputContent[$y-1][$x+1] -eq "M") -and ($inputContent[$y-2][$x+2] -eq "A") -and ($inputContent[$y-3][$x+3] -eq "S")) { $count++ }
            if(($x -lt $charArray.Count-3) -and ($inputContent[$y][$x+1] -eq "M") -and ($inputContent[$y][$x+2] -eq "A") -and ($inputContent[$y][$x+3] -eq "S")) { $count++ }
            if(($y -lt $inputContent.Count-3) -and ($x -lt $charArray.Count-3) -and ($inputContent[$y+1][$x+1] -eq "M") -and ($inputContent[$y+2][$x+2] -eq "A") -and ($inputContent[$y+3][$x+3] -eq "S")) { $count++ }
            if(($y -lt $inputContent.Count-3) -and ($inputContent[$y+1][$x] -eq "M") -and ($inputContent[$y+2][$x] -eq "A") -and ($inputContent[$y+3][$x] -eq "S")) { $count++ }
            if(($y -lt $inputContent.Count-3) -and ($x -ge 3) -and ($inputContent[$y+1][$x-1] -eq "M") -and ($inputContent[$y+2][$x-2] -eq "A") -and ($inputContent[$y+3][$x-3] -eq "S")) { $count++ }
            if(($x -ge 3) -and ($inputContent[$y][$x-1] -eq "M") -and ($inputContent[$y][$x-2] -eq "A") -and ($inputContent[$y][$x-3] -eq "S")) { $count++ }
            if(($y -ge 3) -and ($x -ge 3) -and ($inputContent[$y-1][$x-1] -eq "M") -and ($inputContent[$y-2][$x-2] -eq "A") -and ($inputContent[$y-3][$x-3] -eq "S")) { $count++ }
        }

        $x++
    }

    $y++
}

Write-Host "XMAS appears $count times in the little Elf's word search."

# The answer is 2.571