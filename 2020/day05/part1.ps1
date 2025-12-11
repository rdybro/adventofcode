
# Advent of Code 2020
# Day 5 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

# BFFFBBFRRR: row 70, column 7, seat ID 567.
# FFFBBBFRRR: row 14, column 7, seat ID 119.
# BBFFBBFRLL: row 102, column 4, seat ID 820.

$seatIds = @()

foreach($boardingpass in $inputContent) {
    
    $row = ""
    $column = ""

    foreach($char in $boardingpass.Substring(0,7).ToCharArray()) {

        if($char -eq "B") { $row += "1" }
        else { $row += "0" } # elseif "F"
    }
    
    foreach($char in $boardingpass.Substring(7,3).ToCharArray()) {

        if($char -eq "R") { $column += "1" }
        else { $column += "0" } # elseif "L"
    }

    $seatIds += $(([convert]::ToInt32($row,2) * 8) + [convert]::ToInt32($column,2))
}

Write-Host "Highest seat ID: $($seatIds | Sort-Object -Descending | Select-Object -First 1)"