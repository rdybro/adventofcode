
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 14 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$polymer = [System.Collections.Generic.List[string]]@($inputReader.ReadLine().ToCharArray())
$inputReader.ReadLine()

$insertionRules = [System.Collections.Generic.List[PSCustomObject]]::new()

while($line = $inputReader.ReadLine()) {

    $lineSplit = $line.Split(" -> ")

    $insertionRules.Add([PSCustomObject]@{
        element1 = $lineSplit[0].Substring(0,1)
        element2 = $lineSplit[0].Substring(1,1)
        elementInsert = $lineSplit[1]
    })
}

$inputReader.Close()
$inputReader.Dispose()

$steps = 10

for($i = 0; $i -lt $steps; $i++) {

    $index = 0

    while($index -le ($polymer.Count - 1)) {
        
        $insert = ($insertionRules | Where-Object { ($_.element1 -eq $polymer[$index]) -and ($_.element2 -eq $polymer[$index + 1]) }).elementInsert
        if($insert) { $polymer.Insert($index + 1,$insert) }
        $index += 2
    }
}

$mostCommon = $polymer | Group-Object | Sort-Object Count | Select-Object -Last 1
$leastCommon = $polymer | Group-Object | Sort-Object Count | Select-Object -First 1

Write-Host "After step $steps, $($mostCommon.Name) is the most common with $($mostCommon.Count) occurrences, and $($leastCommon.Name) is the least common with $($leastCommon.Count) occurrences."
Write-Host "Subtracting these gives the answer $($mostCommon.Count - $leastCommon.Count)."

# Answer is 2027
