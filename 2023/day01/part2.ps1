
# Advent of Code 2023
# Rasmus Dybro Larsen
# Day 1 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example2.txt

$sum = 0

function Convert-StringToNumber {
    param(
        [Parameter(Mandatory=$true)]$String
    )

    $number = switch($String) {
        "one" { 1 }
        "two" { 2 }
        "three" { 3 }
        "four" { 4 }
        "five" { 5 }
        "six" { 6 }
        "seven" { 7 }
        "eight" { 8 }
        "nine" { 9 }
        Default { $String }
    }

    return $number
}

foreach($line in $inputContent) {

    $line -match "([0-9]|one|two|three|four|five|six|seven|eight|nine)(.*([0-9]|one|two|three|four|five|six|seven|eight|nine))?.*$" | Out-Null
    
    if($Matches[3]) {
        
        $number = "$(Convert-StringToNumber -String $Matches[1])$(Convert-StringToNumber -String $Matches[3])"
    }
    else {
        
        $convert = Convert-StringToNumber -String $Matches[1]
        $number = "$convert$convert"
    }

    $sum += $number
}

Write-Host "The sum of the calibration values is $sum."

# The answer is 54.078