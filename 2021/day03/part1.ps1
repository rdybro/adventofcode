
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 3 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$diagnosticArray = $null

while($line = $inputReader.ReadLine()) {

    $characterArray = $line.ToCharArray()
    if($null -eq $diagnosticArray) { $diagnosticArray = @(0) * $characterArray.Count }

    for($i = 0; $i -lt $characterArray.Count; $i++) {

        if($characterArray[$i] -eq "0") { $diagnosticArray[$i]-- }
        elseif($characterArray[$i] -eq "1") { $diagnosticArray[$i]++ }
    }
}

$inputReader.Close()
$inputReader.Dispose()

$gammaRateBinary = ""
$epsilonRateBinary = ""

foreach($line in $diagnosticArray) {

    if($line -gt 0) { $gammaRateBinary += "1"; $epsilonRateBinary += "0" }
    elseif($line -lt 0) { $gammaRateBinary += "0"; $epsilonRateBinary += "1" }
}

$gammaRateInt = [Convert]::ToInt32($gammaRateBinary,2)
$epsilonRateInt = [Convert]::ToInt32($epsilonRateBinary,2)

Write-Host "The gamma rate is $gammaRateInt ($gammaRateBinary) and the epsilon rate is $epsilonRateInt ($epsilonRateBinary)."
Write-Host "Multiplying these together produces $($gammaRateInt * $epsilonRateInt)."

# Answer is 2640986
