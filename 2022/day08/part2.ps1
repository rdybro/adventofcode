
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 8 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$maxHorizontal = $inputContent.GetUpperBound(0)
$maxVertical = $inputContent[0].Length - 1

$highestScenicScore = 0

for($ver = 0; $ver -le $maxHorizontal; $ver++) {

    for($hor = 0; $hor -le $maxVertical; $hor++) {

        [int]$height = $inputContent[$ver][$hor].ToString()
        $up = 0; $down = 0; $left = 0; $right = 0

        if($ver -gt 0) {

            $i = $ver - 1
            $blocked = $false
            while(-not $blocked) {

                $up++
                if(($i -le 0) -or ([int]$inputContent[$i][$hor].ToString() -ge $height)) { $blocked = $true }
                else { $i-- }
            }
        }

        if($ver -lt $maxVertical) {
            
            $i = $ver + 1
            $blocked = $false
            while(-not $blocked) {
                
                $down++
                if(($i -ge $maxVertical) -or ([int]$inputContent[$i][$hor].ToString() -ge $height)) { $blocked = $true }
                else { $i++ }
            }
        }

        if($hor -gt 0) {
            
            $i = $hor - 1
            $blocked = $false
            while(-not $blocked) {
                
                $left++
                if(($i -le 0) -or ([int]$inputContent[$ver][$i].ToString() -ge $height)) { $blocked = $true }
                else { $i-- }
            }
        }

        if($hor -lt $maxHorizontal) {

            $i = $hor + 1
            $blocked = $false
            while(-not $blocked) {
                
                $right++
                if(($i -ge $maxHorizontal) -or ([int]$inputContent[$ver][$i].ToString() -ge $height)) { $blocked = $true }
                else { $i++ }
            }
        }

        $scenicScore = $up * $down * $left * $right
        if($scenicScore -gt $highestScenicScore) { $highestScenicScore = $scenicScore }
    }
}

Write-Host "The highest possible scenic score is $highestScenicScore."

# Answer is 331.344
