
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 14 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$steps = 40

$polymer = [System.Collections.Generic.List[string]]@($inputReader.ReadLine().ToCharArray())
$inputReader.ReadLine()

$insertionRules = [System.Collections.Generic.List[PSCustomObject]]::new()

while($line = $inputReader.ReadLine()) {

    $lineSplit = $line.Split(" -> ")

    $insertionRules.Add([PSCustomObject]@{
        element1 = $lineSplit[0].Substring(0,1)
        element2 = $lineSplit[0].Substring(1,1)
        elementInsert = $lineSplit[1]
        pairCount = 0
        pairCountNew = 0
    })
}

$inputReader.Close()
$inputReader.Dispose()

for($i = 0; $i -lt ($polymer.Count - 1); $i++) {

    $rule = $insertionRules | Where-Object { ($_.element1 -eq $polymer[$i]) -and ($_.element2 -eq $polymer[$i + 1]) }
    $rule.pairCount++
}

for($step = 0; $step -lt $steps; $step++) {

    foreach($rule in $insertionRules | Where-Object { $_.pairCount -gt 0 }) {

        $ruleA = $insertionRules | Where-Object { ($_.element1 -eq $rule.element1) -and ($_.element2 -eq $rule.elementInsert) }
        $ruleA.pairCountNew += $rule.pairCount

        $ruleB = $insertionRules | Where-Object { ($_.element1 -eq $rule.elementInsert) -and ($_.element2 -eq $rule.element2) }
        $ruleB.pairCountNew += $rule.pairCount

        $rule.pairCount -= $rule.pairCount
    }

    foreach($rule in $insertionRules | Where-Object { $_.pairCountNew -gt 0 }) {

        $rule.pairCount += $rule.pairCountNew
        $rule.pairCountNew = 0
    }
}

$occurrences = [System.Collections.Generic.List[PSCustomObject]]::new()

foreach($element in ($insertionRules.element1 | Group-Object).Name) {

    $count = (($insertionRules | Where-Object { ($_.element1 -eq $element) -or ($_.element2 -eq $element) }).pairCount | Measure-Object -Sum).Sum
    $count += ($insertionRules | Where-Object { ($_.element1 -eq $element) -and ($_.element2 -eq $element) }).pairCount

    if($polymer[0] -eq $element) { $count++ }
    if($polymer[-1] -eq $element) { $count++ }

    $occurrences.Add([PSCustomObject]@{
        Element = $element
        Count = $count / 2
    })
}

$mostCommon = $occurrences | Sort-Object Count | Select-Object -Last 1
$leastCommon = $occurrences | Sort-Object Count | Select-Object -First 1

Write-Host "After step $steps, $($mostCommon.Element) is the most common with $($mostCommon.Count) occurrences, and $($leastCommon.Element) is the least common with $($leastCommon.Count) occurrences."
Write-Host "Subtracting these gives the answer $($mostCommon.Count - $leastCommon.Count)."

# Answer is 2265039461737
