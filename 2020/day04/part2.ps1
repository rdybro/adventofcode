
# Advent of Code 2020
# Day 4 - Part 2

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

$passportsValid = $passports | Where-Object { ($_.byr -ge 1920) -and ($_.byr -le 2002) -and ($_.iyr -ge 2010) -and ($_.iyr -le 2020) -and ($_.eyr -ge 2020) -and ($_.eyr -le 2030) -and ($_.hgt -match "^(1([5-8][0-9]|9[0-3])cm)|((59|6[0-9]|7[0-6])in)$") -and ($_.hcl -match "^#[0-9a-z]{6}$") -and ($_.ecl -match "^amb|blu|brn|gry|grn|hzl|oth$") -and ($_.pid -match "^[0-9]{9}$") }

Write-Host "Valid passports: $($passportsValid.Count)"
