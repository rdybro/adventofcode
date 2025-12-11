
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 6 - Part 1

$inputContent = [System.Int32[]](Get-Content -LiteralPath input.txt).Split(",")
#$inputContent = @(3,4,3,1,2)

$daysToRun = 80
$newLanternfish = @()

for($day = 0; $day -lt $daysToRun; $day++) {

    for($i = 0; $i -lt $inputContent.Count; $i++) {
        
        if($inputContent[$i] -eq 0) { $inputContent[$i] = 6; $newLanternfish += @(8) }
        else { $inputContent[$i]-- }
    }

    $inputContent += $newLanternfish
    $newLanternfish = @()
}

Write-Host "There is $($inputContent.Count) lanternfish after $daysToRun days."

# Answer is 380758
