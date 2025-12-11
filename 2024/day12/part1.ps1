
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 12 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example1.txt
#$inputContent = Get-Content -LiteralPath input_example2.txt

[System.Collections.ArrayList]$visited = @()
$totalPrice = 0

function floodfill([string]$Type, [int]$Row, [int]$Column) {

    if("$Column,$Row" -notin $global:visited) {

        $visited.Add("$Column,$Row") | Out-Null
        $global:regionArea++
        
        if(($Row -ge 1) -and ($inputContent[$Row-1][$Column] -eq $Type)) { floodfill -Type $Type -Row ($Row-1) -Column $Column }
        else { $global:regionPerimeter++ }

        if(($Column -lt $inputContent[$Row].Length-1) -and ($inputContent[$Row][$Column+1] -eq $Type)) { floodfill -Type $Type -Row $Row -Column ($Column+1) }
        else { $global:regionPerimeter++ }

        if(($Row -lt $inputContent.Count-1) -and ($inputContent[$Row+1][$Column] -eq $Type)) { floodfill -Type $Type -Row ($Row+1) -Column $Column }
        else { $global:regionPerimeter++ }

        if(($Column -ge 1) -and ($inputContent[$Row][$Column-1] -eq $Type)) { floodfill -Type $Type -Row $Row -Column ($Column-1) }
        else { $global:regionPerimeter++ }
    }
}

for($y = 0; $y -lt $inputContent.Count; $y++) {

    for($x = 0; $x -lt $inputContent[$y].Length; $x++) {

        if("$x,$y" -notin $visited) {

            $regionArea = 0
            $regionPerimeter = 0

            floodfill -Type $inputContent[$y][$x] -Row $y -Column $x

            $totalPrice += ($regionArea * $regionPerimeter)
        }
    }
}

Write-Host "The total price of fencing all regions are $totalPrice."

# The answer is 1.400.386