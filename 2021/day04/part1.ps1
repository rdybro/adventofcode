
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 4 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$numbers = $inputReader.ReadLine().Split(",")

$boards = @()

$currentBoard = 0
$currentRow = 1

while(-not $inputReader.EndOfStream) {
    
    $line = $inputReader.ReadLine()

    if($line -eq "") { $currentBoard++; $currentRow = 1 }
    else {

        $currentColumn = 1

        foreach($number in $line.Split(" ") | Where-Object { $_ -ne "" }) {

            $boards += [PSCustomObject]@{
                Board = $currentBoard
                Row = $currentRow
                Column = $currentColumn
                Number = $number
                Marked = $false
            }

            $currentColumn++
        }

        $currentRow++
    }
}

$inputReader.Close()
$inputReader.Dispose()

$checkWin = @()

for($i = 1; $i -le $currentBoard; $i++) {

    for($j = 1; $j -le 5; $j++) {

        $checkWin += [PSCustomObject]@{
            Board = $i
            Row = $j
            Column = $null
            NumbersLeft = 5
        }
    }

    for($k = 1; $k -le 5; $k++) {

        $checkWin += [PSCustomObject]@{
            Board = $i
            Row = $null
            Column = $k
            NumbersLeft = 5
        }
    }
}

$winningType = $null
$winningBoard = $null
$winningIdentity = $null
$winningNumber = $null
$remainingSum = 0

foreach($number in $numbers) {

    if(-not $winningType) {

        foreach($item in ($boards | Where-Object { $_.Number -eq $number })) {
        
            $item.Marked = $true

            $checkRow = $checkWin | Where-Object { ($_.Board -eq $item.Board) -and ($_.Row -eq $item.Row) }
            $checkRow.NumbersLeft--
            if($checkRow.NumbersLeft -eq 0) {

                $winningType = "row"
                $winningIdentity = $item.Row
                $winningBoard = $item.Board
                $winningNumber = $number
            }

            $checkColumn = $checkWin | Where-Object { ($_.Board -eq $item.Board) -and ($_.Column -eq $item.Column) }
            $checkColumn.NumbersLeft--
            if($checkColumn.NumbersLeft -eq 0) {
                
                $winningType = "column"
                $winningIdentity = $item.Column
                $winningBoard = $item.Board
                $winningNumber = $number
            }
        }
    }
    else {

        $remainingSum = (($boards | Where-Object { ($_.Board -eq $winningBoard) -and ($_.Marked -eq $false) }).Number | Measure-Object -Sum).Sum
    }
}

Write-Host "The winning $winningType was $winningIdentity on board $winningBoard."
Write-Host "The winning number was $winningNumber, and the remaining sum on the board was $remainingSum"
Write-Host "Multiplying these together produces $($remainingSum * $winningNumber)."

# Answer is 2745
