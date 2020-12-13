
# Advent of Code 2020
# Day 12 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$locationNorth = 0
$locationEast = 0
$direction = 90

foreach($line in $inputContent) {

    $action = $line.Substring(0,1)
    $value =  $line.Substring(1)

    switch($action) {

        "N" { $locationNorth += $value }
        "S" { $locationNorth -= $value }
        "E" { $locationEast += $value }
        "W" { $locationEast -= $value }
        "L" { $direction -= $value }
        "R" { $direction += $value }
        "F" { switch($direction) {

                0 { $locationNorth += $value }
                90 { $locationEast += $value }
                180 { $locationNorth -= $value }
                270 { $locationEast -= $value }
            }
        }
    }

    if($direction -lt 0) { $direction += 360 }
    elseif($direction -ge 360) { $direction -= 360 }
}

if($locationEast -lt 0) { $locationEast = $locationEast * -1 }
if($locationNorth -lt 0) { $locationNorth = $locationNorth * -1 }

Write-Host "The Manhattan distance is $($locationEast + $locationNorth)."
