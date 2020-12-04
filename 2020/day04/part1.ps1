
# Advent of Code 2020
# Day 4 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$inputContent += ""
$passports = @()
$passport = New-Object -TypeName psobject

foreach($line in $inputContent) {

    if($line) {

        $split = $line.Split(" ")

        foreach($item in $split) {
            
            $passport | Add-Member -MemberType NoteProperty -Name $item.Split(":")[0] -Value $item.Split(":")[1]
        }
    }
    else {
        
        $passports += $passport
        $passport = New-Object -TypeName psobject
    }
}

$passportsValid = $passports | Where-Object { ($null -ne $_.byr) -and ($null -ne $_.iyr) -and ($null -ne $_.eyr) -and ($null -ne $_.hgt) -and ($null -ne $_.hcl) -and ($null -ne $_.ecl) -and ($null -ne $_.pid) }

Write-Host "Valid passports: $($passportsValid.Count)"
