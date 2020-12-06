
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

$array = @()
$line = 1

# I subtract one from the line count, as we know it can't be last row

while($line -le $(($seats | Sort-Object Row -Descending | Select-Object -First 1).Row) - 1) {

    if(($seats | Where-Object { $_.Row -eq $line }).Count -eq 7) {
        
        foreach($seat in $seats | Where-Object { $_.Row -eq $line }) {
            
            if(!($seats | Where-Object { $_.ID -eq ($seat.ID - 1)}) -or !($seats | Where-Object { $_.ID -eq ($seat.ID + 1)})) {

                $array += $seat
            }
        }
    }

    $line++
}

if($array.Count -eq 1) {

    if($array[0].Column -eq 1) { Write-Host "ID is $($array[0].ID - 1)" }
    elseif($array[0].Column -eq 6) { Write-Host "ID is $($array[0].ID + 1)" }
}
elseif(($array.Count -eq 2) -and ($array[0].Row -eq $array[1].Row)) {

    Write-Host "ID is $(($array | Sort-Object Column | Select-Object -First 1).ID + 1)"
}
else {

    $array
}

# Fixed so it only returns a single value for ID
# Not that pretty, but seems to work - I tested against multiple inputs
