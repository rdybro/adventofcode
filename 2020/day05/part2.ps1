
# Advent of Code 2020
# Day 5 - Part 2

$inputContent = Get-Content -LiteralPath input.txt

$seats = @()

foreach($boardingpass in $inputContent) {
    
    $rowBinary = ""
    $columnBinary = ""

    foreach($char in $boardingpass.Substring(0,7).ToCharArray()) {

        if($char -eq "B") { $rowBinary += "1" }
        else { $rowBinary += "0" } # elseif "F"
    }

    $row = [convert]::ToInt32($rowBinary,2)
    
    foreach($char in $boardingpass.Substring(7,3).ToCharArray()) {

        if($char -eq "R") { $columnBinary += "1" }
        else { $columnBinary += "0" } # elseif "L"
    }

    $column = [convert]::ToInt32($columnBinary,2)

    $seats += [PSCustomObject]@{

        Row = $row
        Column = $column
        ID = ($row * 8) + $column
    }
}

$line = 0

while($line -le ($seats | Sort-Object Row -Descending | Select-Object -First 1).Row) {

    if(($seats | Where-Object { $_.Row -eq $line }).Count -eq 7) {
        
        foreach($seat in $seats | Where-Object { $_.Row -eq $line }) {
            
            if(!($seats | Where-Object { $_.ID -eq ($seat.ID - 1)}) -or !($seats | Where-Object { $_.ID -eq ($seat.ID + 1)})) {

                Write-Host $seat
            }
        }
    }

    $line++
}

# This doesn't output the correct answer, but instead outputs 2 seats, one on 109-6 and one on 63-1
# My seat is neighbor to one of these
# I know it is not 109-6 because that would make my seat the last seat in the last row, we know that can't be the answer
# And as I know 63-2 isn't missing a neighbor, my seat must be 63-0, and the answer is 504 (505-1)
