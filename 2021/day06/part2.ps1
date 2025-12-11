
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 6 - Part 2

$inputContent = (Get-Content -LiteralPath input.txt).Split(",")
#$inputContent = @("3","4","3","1","2")

$daysToRun = 256

$list = @{ "0" = 0; "1" = 0; "2" = 0; "3" = 0; "4" = 0; "5" = 0; "6" = 0; "7" = 0; "8" = 0 }
foreach ($lanternfish in $inputContent) { $list[$lanternfish]++ }

for($day = 0; $day -lt $daysToRun; $day++) {

    $newLanternfish = $list["0"]
    $list["0"] = $list["1"]
    $list["1"] = $list["2"]
    $list["2"] = $list["3"]
    $list["3"] = $list["4"]
    $list["4"] = $list["5"]
    $list["5"] = $list["6"]
    $list["6"] = $list["7"] + $newLanternfish
    $list["7"] = $list["8"]
    $list["8"] = $newLanternfish
}

Write-Host "There is $(($list.Values | Measure-Object -Sum).Sum) lanternfish after $daysToRun days."

# Answer is 1710623015163
