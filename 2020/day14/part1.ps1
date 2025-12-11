
# Advent of Code 2020
# Day 14 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$mask = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
$memory = @()

foreach($line in $inputContent) {
    
    if($line -like "mask = *") { $mask = $line.Split("=").Trim()[1] }
    else {

        $lineIndex = $line.Split("[").Split("]")[1]
        $lineValue = [Convert]::ToString($line.Split("=").Trim()[1],2).ToCharArray()

        $lineValueMaskedBinary = ""
        $lineValueIndex = 0

        while($lineValue.Count -lt $mask.Length) {

            $lineValueNew = @(0)
            $lineValueNew += @($lineValue)
            $lineValue = $lineValueNew
        }

        foreach($bit in $mask.ToCharArray()) {

            if($bit -ne "X") { $lineValueMaskedBinary += $bit }
            elseif($lineValue[$lineValueIndex]) { $lineValueMaskedBinary += $lineValue[$lineValueIndex] }
            else { $lineValueMaskedBinary += "0" }

            $lineValueIndex++
        }

        $lineValueMasked = [Convert]::ToInt64($lineValueMaskedBinary,2)

        if($memory | Where-Object { $_.Index -eq $lineIndex }) {

           ($memory | Where-Object { $_.Index -eq $lineIndex }).Value = $lineValueMasked
        }
        else {
            
            $memory += [PSCustomObject]@{

                Index = $lineIndex
                Value = $lineValueMasked
            }
        }
    }
}

Write-Host "Sum of all values left in memory is $(($memory.Value | Measure-Object -Sum).Sum)."
