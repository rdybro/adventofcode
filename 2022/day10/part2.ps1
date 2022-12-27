
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 10 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$global:x = 1
$global:rows = @()
$global:currentRow = ""

function Render-Image {

    if((($global:currentRow.Length - 1) -eq $global:x) -or ($global:currentRow.Length -eq $global:x) -or (($global:currentRow.Length + 1) -eq $global:x)) { $global:currentRow += "#" }
    else { $global:currentRow += " " }

    if($global:currentRow.Length -ge 40) { $global:rows += $global:currentRow; $global:currentRow = "" }
}

while($line = $inputReader.ReadLine()) {

    Render-Image

    if($line -ne "noop") {
        
        Render-Image
        $x += [int]$line.Split(" ")[1]
    }
}

$rows

# Answer is RZHFGJCB

$inputReader.Close()
$inputReader.Dispose()