
# Advent of Code 2020
# Day 9 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
$preamble = 25

#$inputContent = Get-Content -LiteralPath input_example.txt
#$preamble = 5

$lineCount = 0

$numbersList = [System.Collections.Generic.List[System.Int32]]@()

foreach($line in $inputContent) {

    $sumArray = @()

    if($lineCount -lt $preamble) {

        $numbersList.Add($line)
    }
    else {

        foreach($number1 in $numbersList) {

            foreach($number2 in $numbersList) {

                $sum = $number1 + $number2

                if($sumArray -notcontains $sum) { $sumArray += $sum }
            }
        }

        if($sumArray -notcontains $line) {

            [int]$invalidNumber = $line
            Write-Host "The first invalid number is $invalidNumber"
            break
        }

        $numbersList.RemoveAt(0)
        $numbersList.Add($line)
    }

    $lineCount++
}

$lineCount = 0
$lineCountNew = 0

foreach($number1 in $inputContent) {

    [int]$sum = $number1
    $lineCountNew = $lineCount + 1
    $number2 = $null

    while($sum -lt $invalidNumber) {

        $number2 = $inputContent[$lineCountNew]
        $sum += $number2
        $lineCountNew++
    }
    
    if($sum -eq $invalidNumber) {

            break
    }

    $lineCount++
}

$subArray = $inputContent | Select-Object -Skip $lineCount | Select-Object -First ($lineCountNew - $lineCount)
[int]$numberLow = $subArray | Sort-Object | Select-Object -First 1
[int]$numberHigh = $subArray | Sort-Object | Select-Object -Last 1

Write-Host "The encryption weakness is $($numberLow + $numberHigh)"
