
# Advent of Code 2020
# Day 6 - Part 2

$inputContent = Get-Content -LiteralPath input.txt

$inputContent += ""

$questionsAll = @()
$questionsGroup = @()

foreach($questionsPerson in $inputContent) {
    
    if($questionsPerson) {
        
        $questionsGroup += $questionsPerson
    }
    else {

        $answered = $questionsGroup[0].ToCharArray()

        foreach($answer in $questionsGroup) {

            if($answered) {

                $answered = (Compare-Object -ReferenceObject $answered -DifferenceObject ($answer.ToCharArray() | Sort-Object) -ExcludeDifferent -IncludeEqual).InputObject
            }
            else {

                $answer = $answer.ToCharArray()
            }
        }

        $questionsAll += $answered.Count
        $questionsGroup = @()
    }
}

Write-Host "Sum of questions count is $(($questionsAll | Measure-Object -Sum).Sum)"
