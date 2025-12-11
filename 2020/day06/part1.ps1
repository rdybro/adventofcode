
# Advent of Code 2020
# Day 6 - Part 1

$inputContent = Get-Content -LiteralPath input.txt

$inputContent += ""

$questionsAll = @()
$questionsGroup = ""

foreach($questionsPerson in $inputContent) {
    
    if($questionsPerson) {
        
        $questionsGroup += $questionsPerson
    }
    else {

        $questionsAll += ($questionsGroup.ToCharArray() | Sort-Object | Get-Unique).Count
        $questionsGroup = ""
    }
}

Write-Host "Sum of questions count is $(($questionsAll | Measure-Object -Sum).Sum)"
