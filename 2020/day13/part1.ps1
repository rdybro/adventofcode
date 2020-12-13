
# Advent of Code 2020
# Day 13 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$earliestDepartTime = $inputContent[0]
$busIds = $inputContent[1].Split(",") | Where-Object { $_ -ne "x" }
$busses = @()

foreach($id in $busIds) {

    $busses += [PSCustomObject]@{
        ID = $id
        Depart = [Math]::Ceiling($earliestDepartTime/$id)*$id
    }
}

$bus = $busses | Where-Object { $_.Depart -ge $earliestDepartTime } | Sort-Object Depart | Select-Object -First 1
$result = ($bus.Depart - $earliestDepartTime) * $bus.ID

Write-Host "The product of bus ID and minutes to wait is $result."
