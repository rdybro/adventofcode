
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 6 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$guardPosition = $null
$guardDirection = $null
$visitedPositions = @()

for($y = 0; $y -lt $inputContent.Count; $y++) {

    $charArray = $inputContent[$y].ToCharArray()

    for($x = 0; $x -lt $charArray.Count; $x++) {

        if(($null -eq $guardPosition) -and ($charArray[$x] -in @("^",">","v","<"))) {
            
            $guardPosition = @($x,$y)

            $guardDirection = switch($charArray[$x]) {
                "^" { "up" }
                ">" { "right" }
                "v" { "down" }
                "<" { "left" }
            }
        }
    }
}

$withinRange = $true

while($withinRange) {

    $visitedPositions += "$($guardPosition[0]),$($guardPosition[1])"

    $newPosition = switch($guardDirection) {
        "up" { @($guardPosition[0],($guardPosition[1]-1)) }
        "right" { @(($guardPosition[0]+1),$guardPosition[1]) }
        "down" { @($guardPosition[0],($guardPosition[1]+1)) }
        "left" { @(($guardPosition[0]-1),$guardPosition[1]) }
    }

    if(($newPosition[0] -ge 0) -and ($newPosition[0] -lt $inputContent[0].Length) -and ($newPosition[1] -ge 0) -and ($newPosition[1] -lt $inputContent.Count)) {
        
        if($inputContent[$newPosition[1]].ToCharArray()[$newPosition[0]] -eq "#") {
            
            $guardDirection = switch($guardDirection) {
                "up" { "right" }
                "right" { "down" }
                "down" { "left" }
                "left" { "up" }
            }
        }
        else { $guardPosition = $newPosition }
    }
    else { $withinRange = $false }
}

Write-Host "The guard have visited $(($visitedPositions | Select-Object -Unique).Count) distinct locations."

# The answer is 4.939