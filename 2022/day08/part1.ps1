
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 8 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$maxHorizontal = $inputContent.GetUpperBound(0)
$maxVertical = $inputContent[0].Length - 1

$visible = 0

for($ver = 0; $ver -le $maxHorizontal; $ver++) {

    for($hor = 0; $hor -le $maxVertical; $hor++) {

        [int]$height = $inputContent[$ver][$hor].ToString()

        if(($ver -ne 0) -and ($ver -ne $maxVertical) -and ($hor -ne 0) -and ($hor -ne $maxHorizontal)) {

            $up = $true; $down = $true; $left = $true; $right = $true

            for($i = $ver - 1; $i -ge 0; $i--) { if([int]$inputContent[$i][$hor].ToString() -ge $height) { $up = $false } }
            for($i = $ver + 1; $i -le $maxVertical; $i++) { if([int]$inputContent[$i][$hor].ToString() -ge $height) { $down = $false } }
            for($i = $hor - 1; $i -ge 0; $i--) { if([int]$inputContent[$ver][$i].ToString() -ge $height) { $left = $false } }
            for($i = $hor + 1; $i -le $maxHorizontal; $i++) { if([int]$inputContent[$ver][$i].ToString() -ge $height) { $right = $false } }

            if($up -or $down -or $left -or $right) { $visible++ }
        }
        else { $visible++ }
    }
}

Write-Host "There are $visible trees visible from outside the grid."

# Answer is 1.669
