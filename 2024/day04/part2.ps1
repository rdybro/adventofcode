
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 4 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$count = 0

for($y = 1; $y -lt $inputContent.Count-1; $y++) {

    $charArray = $inputContent[$y].ToCharArray()

    for($x = 1; $x -lt $charArray.Count-1; $x++) {

        if($charArray[$x] -eq "A") {

            if(
                (
                    (($inputContent[$y-1][$x-1] -eq "M") -and ($inputContent[$y+1][$x+1] -eq "S")) -or
                    (($inputContent[$y-1][$x-1] -eq "S") -and ($inputContent[$y+1][$x+1] -eq "M"))
                ) -and (
                    (($inputContent[$y-1][$x+1] -eq "M") -and ($inputContent[$y+1][$x-1] -eq "S")) -or
                    (($inputContent[$y-1][$x+1] -eq "S") -and ($inputContent[$y+1][$x-1] -eq "M"))
                )
            ) { $count++ }
        }
    }
}

Write-Host "X-MAS appears $count times in the little Elf's word search."

# The answer is 1.992