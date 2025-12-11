
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 5 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$pointsCovered = [System.Collections.Generic.List[string]]::new()

while($line = $inputReader.ReadLine()) {

    $coordinates = $line.Split("->").Trim().Split(",")

    if($coordinates[0] -eq $coordinates[2]) {
        
        foreach($point in @($coordinates[1]..$coordinates[3])) { $pointsCovered.Add("$($coordinates[0]),$point") }
    }
    elseif($coordinates[1] -eq $coordinates[3]) {

        foreach($point in @($coordinates[0]..$coordinates[2])) { $pointsCovered.Add("$point,$($coordinates[1])") }
    }
}

$inputReader.Close()
$inputReader.Dispose()

Write-Host "There is $(($pointsCovered | Group-Object | Where-Object { $_.Count -gt 1 }).Count) points where at least 2 lines overlaps."

# Answer is 7085
