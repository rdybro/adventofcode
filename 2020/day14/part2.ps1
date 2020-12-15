
# Advent of Code 2020
# Day 14 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt
#$inputContent = Get-Content -LiteralPath input_example2.txt

$mask = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
$memory = New-Object -TypeName "System.Collections.ArrayList"
$curLine = 0

function Switch-BitmaskBit($maskedBinary, $value, $sequence) {

    $maskedBinarySplit = $maskedBinary.Split("X",2)

    if($maskedBinarySplit.Count -gt 1) {

        Switch-BitmaskBit "$($maskedBinarySplit[0])1$($maskedBinarySplit[1])" $value $sequence
        Switch-BitmaskBit "$($maskedBinarySplit[0])0$($maskedBinarySplit[1])" $value $sequence
    }
    else {

        $index = [Convert]::ToInt64($maskedBinarySplit[0],2)

        $null = $global:memory.Add([PSCustomObject]@{
                
                Index = $index
                Value = $value
                Sequence = $sequence
            })
    }
}

foreach($line in $inputContent) {
    
    if($line -like "mask = *") { $mask = $line.Split("=").Trim()[1] }
    else {

        $lineIndex = [Convert]::ToString($line.Split("[").Split("]")[1],2).PadLeft($mask.Length,"0").ToCharArray()
        $lineValue = $line.Split("=").Trim()[1]

        $lineIndexMaskedBinary = ""
        $lineIndexIndex = 0

        foreach($bit in $mask.ToCharArray()) {

            if($bit -ne "0") { $lineIndexMaskedBinary += $bit }
            elseif($lineIndex[$lineIndexIndex]) { $lineIndexMaskedBinary += $lineIndex[$lineIndexIndex] }
            else { $lineIndexMaskedBinary += "0" }

            $lineIndexIndex++
        }

        Switch-BitmaskBit $lineIndexMaskedBinary $lineValue $curLine
    }

    $curLine++
}

$index = New-Object -TypeName "System.Collections.ArrayList"
$memorySum = 0

foreach($mem in $memory | Sort-Object Sequence -Descending) {

    if($index -notcontains $mem.Index) {

        $memorySum += $mem.Value
        $null = $index.Add($mem.Index)
    }
}

Write-Host "Sum of all values left in memory is $memorySum."
