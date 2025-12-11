
# Advent of Code 2020
# Day 18 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

function Format-Math($math) {

    return (($math.Split(" ") -join "").Split("+") -join " + ").Split("*") -join " * "
}

function Get-MathParenthesis($math) {
    
    $mathSplit = $math.Split("(",2)
    
    if($mathSplit[1] -match "^.*?([(|)])(.*)$") {

        if($Matches[1] -eq ")") {

            $mathSplitSplit = $mathSplit[1].Split(")",2)
            $result = Invoke-MathFunction $mathSplitSplit[0]
            $math = "$($mathSplit[0].Trim()) $($result.Trim()) $($mathSplitSplit[1].Trim())"
        }
        else {

            $mathSplit = $math.Split(")",2)
            $mathSplitSplit = $mathSplit.Split("(")
            $result = Invoke-MathFunction $mathSplitSplit[2]
            $math = "$($mathSplitSplit[0..1] -join "("))$($result.Trim())$($mathSplit[1].Trim())"
        }
    }

    return Format-Math $math
}

function Invoke-MathFunction($math) {

    $math = Format-Math $math

    while($math.ToCharArray() -contains "(") { $math = Get-MathParenthesis $math }

    while($math.Trim().Split(" ").Count -gt 1) {

        $mathSplit = $math.Split(" ")
        $math = "$(Invoke-Expression ($mathSplit[0..2] -join " ")) $($mathSplit[3..$math.Length] -join " ")"
    }

    return $math
}

[Int64]$result = 0

foreach($line in $inputContent) {

    $result += [Int64](Invoke-MathFunction $line)
}

Write-Host "The sum of each resulting value in the homework is $result."
