
# Advent of Code 2023
# Rasmus Dybro Larsen
# Day 15 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

function Get-HashAlgorithmOutput {
    param([string]$String)

    $currentValue = 0

    foreach($char in $string.ToCharArray()) {

        $currentValue += [byte][char]$char
        $currentValue *= 17
        $currentValue %= 256
    }

    return $currentValue
}

[System.Collections.ArrayList]$arrayList = @()
$i = 0

foreach($step in $inputContent.Split(",")) {

    $regex = Select-String -InputObject $step -Pattern "([\w]+)(=|-)(\d?)"

    $lensLabel = $regex.Matches.Groups[1].Value
    $boxNumber = Get-HashAlgorithmOutput -String $lensLabel
    $operationCharacter = $regex.Matches.Groups[2].Value

    $lens = $arrayList | Where-Object { $_.LensLabel -eq $lensLabel }

    if($operationCharacter -eq "-") { $arrayList.Remove($lens) }
    elseif($operationCharacter -eq "=") {

        $lensFocalLength = $regex.Matches.Groups[3].Value

        if($lens) { $lens.LensFocalLength = $lensFocalLength }
        else {
            
            $object = [PSCustomObject]@{
                Box = $boxNumber
                Order = $i
                LensLabel = $lensLabel
                LensFocalLength = $lensFocalLength
            }

            $arrayList.Add($object) | Out-Null
        }
    }

    $i++
}

foreach($box in $arrayList.Box | Select-Object -Unique) {

    $i = 1

    foreach($lens in $arrayList | Where-Object { $_.Box -eq $box } | Sort-Object Order) {

        $lens.Order = $i
        $i++
    }
}

$totalFocusingPower = 0

foreach($lens in $arrayList) { $totalFocusingPower += ($lens.Box + 1) * $lens.Order * $lens.LensFocalLength }

Write-Host "The total focusing power is $totalFocusingPower."

# The answer is 279.116