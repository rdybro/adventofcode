
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 9 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$result = 0

for($i = 0; $i -lt $inputContent.Count; $i++) {
    
    [int[]]$split1 = $inputContent[$i].Split(",")
    
    for($j = $i+1; $j -lt $inputContent.Count; $j++) {
        
        [int[]]$split2 = $inputContent[$j].Split(",")
        [int]$sideA = $split2[0] - $split1[0] + 1
        [int]$sideB = $split2[1] - $split1[1] + 1
        
        if($sideA -lt 0){ [int]$sideA = $split1[0] - $split2[0] + 1 }
        if($sideB -lt 0){ [int]$sideB = $split1[1] - $split2[1] + 1 }
        
        [Int64]$area = $sideA * $sideB
        
        if($area -gt $result) { $result = $area }
    }
}

Write-Host "The largest possible area is $result."

# The answer is 4.774.877.510