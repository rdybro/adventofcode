
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 24 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example1.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example2.txt")

$wires = @{}
[System.Collections.ArrayList]$queue = @()
$i = 0

while($line = $inputReader.ReadLine()) {

    $lineSplit = $line.Split(":").Trim()
    $wires.Add([string]$lineSplit[0],[int]$lineSplit[1])
}

while($line = $inputReader.ReadLine()) {

    $lineSplit = $line.Split(" ")
    $queue.Add(@([string]$lineSplit[1],[string]$lineSplit[0],[string]$lineSplit[2],[string]$lineSplit[4])) | Out-Null
}

while($queue) {

    if(($queue[$i][1] -in $wires.Keys) -and ($queue[$i][2] -in $wires.Keys)) {

        if($queue[$i][0] -eq "AND") { $gateResult = $wires[$queue[$i][1]] -band $wires[$queue[$i][2]] }
        elseif($queue[$i][0] -eq "OR") { $gateResult = $wires[$queue[$i][1]] -bor $wires[$queue[$i][2]] }
        else { $gateResult = $wires[$queue[$i][1]] -bxor $wires[$queue[$i][2]] }

        if($queue[$i][3] -in $wires.Keys) { $wires[$queue[$i][3]] = $gateResult }
        else { $wires.Add($queue[$i][3],$gateResult) }

        $queue.RemoveAt($i)
        $i = 0
    }
    else { $i++ }
}

$zWiresBinary = ""
foreach($key in $wires.Keys | Where-Object { $_ -like "z*" } | Sort-Object -Descending) { $zWiresBinary += $wires[$key] }

Write-Host "The system outputs the decimal number $([Convert]::ToInt64($zWiresBinary,2)) for all wires starting with 'z'."

# The answer is 57.588.078.076.750