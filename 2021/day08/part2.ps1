
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 8 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

#    aaaa
#   b    c
#   b    c
#    dddd
#   e    f
#   e    f
#    gggg

$result = 0

foreach($line in $inputContent) {

    $lineSplit = $line.Split("|")
    $signalPattern = $lineSplit[0].Trim().Split(" ")

    $positionC = ($signalPattern | Where-Object { $_.Length -eq 2 }).ToCharArray()
    $positionF = $positionC
    $positionA = ($signalPattern | Where-Object { $_.Length -eq 3 }).ToCharArray() | Where-Object { $_ -notin $positionC }
    $positionB = ($signalPattern | Where-Object { $_.Length -eq 4 }).ToCharArray() | Where-Object { $_ -notin $positionC }
    $positionD = $positionB
    
    $pattern3 = ($signalPattern | Where-Object { ($_.Length -eq 5) -and ($_ -like "*$($positionC[0])*") -and ($_ -like "*$($positionC[1])*") }).ToCharArray()
    
    $positionG = $pattern3 | Where-Object { ($_ -ne $positionA) -and ($_ -notin $positionC) -and ($_ -notin $positionD) }
    $positionD = $pattern3 | Where-Object { ($_ -ne $positionA) -and ($_ -ne $positionG) -and ($_ -notin $positionC) }
    $positionB = $positionB | Where-Object { $_ -ne $positionD }

    $positionF = ($signalPattern | Where-Object { ($_.Length -eq 5) -and ($_ -like "*$positionB*") }).ToCharArray() | Where-Object { ($_ -ne $positionA) -and ($_ -ne $positionB) -and ($_ -ne $positionD) -and ($_ -ne $positionG) }
    $positionC = $positionC | Where-Object { $_ -ne $positionF }
    $positionE = @("a","b","c","d","e","f","g") | Where-Object { ($_ -ne $positionA) -and ($_ -ne $positionB) -and ($_ -ne $positionC) -and ($_ -ne $positionD) -and ($_ -ne $positionF) -and ($_ -ne $positionG) }
    
    $signalOutputValue = ""

    foreach($signalOutput in $lineSplit[1].Trim().Split(" ")) {

        if($signalOutput.Length -eq 2) { $signalOutputValue += "1" }
        elseif($signalOutput.Length -eq 3) { $signalOutputValue += "7" }
        elseif($signalOutput.Length -eq 4) { $signalOutputValue += "4" }
        elseif($signalOutput.Length -eq 7) { $signalOutputValue += "8" }
        elseif($signalOutput.Length -eq 5) {

            if($signalOutput -like "*$positionE*") { $signalOutputValue += "2" }
            elseif($signalOutput -like "*$positionC*") { $signalOutputValue += "3" }
            else { $signalOutputValue += "5" }
        }
        elseif($signalOutput.Length -eq 6) {

            if($signalOutput -notlike "*$positionD*") { $signalOutputValue += "0" }
            elseif($signalOutput -like "*$positionE*") { $signalOutputValue += "6" }
            else { $signalOutputValue += "9" }
        }
    }

    $result += [int]$signalOutputValue
}

Write-Host "The sum of all the output values are $result."

# Answer is 986163
