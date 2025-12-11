
# Advent of Code 2020
# Day 2 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$valid = 0
$invalid = 0

foreach($line in $inputContent) {

    $policy = $line.Split(":")[0]
    $password = $line.Split(":")[1].Trim()

    $policyMin = $policy.Split("-")[0]
    $policyMax = $policy.Split("-")[1].Split(" ")[0]
    $policyLetter = $policy.Split(" ")[1]

    $policyLetterCount = ($password.ToCharArray() | Where-Object { $_ -eq $policyLetter }).Count

    if(($policyLetterCount -ge $policyMin) -and ($policyLetterCount -le $policyMax)) { $valid++ }
    else { $invalid++ }
}

Write-Host "Total input count: $($inputContent.Count)"
Write-Host "Valid passwords: $valid"
Write-Host "Invalid passwords: $invalid"
