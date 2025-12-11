
# Advent of Code 2020
# Day 11 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$seatingCurrent = $inputContent

function Start-Seating($seatingInput) {

    $row = 0
    $seatingUpdated = @()

    foreach($line in $seatingInput) {

        $seats = $line.ToCharArray()
        $seatingUpdatedRow = ""
        $column = 0

        foreach($seat in $seats) {

            $rowAbove = $row - 1
            $rowBelow = $row + 1
            $columnLeft = $column - 1
            $columnRight = $column + 1

            $seatsAdjacent = @(@($rowAbove,$columnLeft),@($rowAbove,$column),@($rowAbove,$columnRight),@($row,$columnRight),@($rowBelow,$columnRight),@($rowBelow,$column),@($rowBelow,$columnLeft),@($row,$columnLeft))
            $occupiedCount = 0

            foreach($adjacent in $seatsAdjacent) {
                
                if(($adjacent[0] -ge 0) -and ($adjacent[1] -ge 0) -and ($adjacent[0] -lt $seatingInput.Count) -and ($adjacent[1] -lt $seats.Count)) {

                    if($seatingInput[$adjacent[0]][$adjacent[1]] -eq "#") { $occupiedCount++ }
                }
            }
            
            if(($seat -eq "L") -and ($occupiedCount -eq 0)) { $seatingUpdatedRow += "#" }
            elseif($seat -eq "L") { $seatingUpdatedRow += "L" }
            elseif(($seat -eq "#") -and ($occupiedCount -ge 4)) { $seatingUpdatedRow += "L" }
            elseif($seat -eq "#") { $seatingUpdatedRow += "#" }
            else { $seatingUpdatedRow += "." }

            $column++
        }

        $seatingUpdated += $seatingUpdatedRow
        $row++
    }

    $seatingUpdated
}

$seatingNew = Start-Seating $seatingCurrent

while(($seatingCurrent -join ",") -ne ($seatingNew -join ",")) {

    $seatingCurrent = $seatingNew
    $seatingNew = Start-Seating $seatingCurrent
}

function Start-OccupiedCount($seatingInput) {

    $occupiedCount = 0

    foreach($line in $seatingInput) {
        
        $seats = $line.ToCharArray()

        foreach($seat in $seats) {

            if($seat -eq "#") { $occupiedCount++ }
        }
    }

    Write-Host "$occupiedCount seats are occupied."
}

Start-OccupiedCount $seatingNew
