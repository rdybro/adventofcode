
# Advent of Code 2020
# Day 9 - Part 1

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

            Write-Host "The first invalid number is $line"
            break
        }

        $numbersList.RemoveAt(0)
        $numbersList.Add($line)
    }

    $lineCount++
}
