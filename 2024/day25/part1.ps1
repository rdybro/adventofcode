
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 25 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$locks = @()
$keys = @()

$lockOrKey = $null
$rowCount = 0
$current = @(0,0,0,0,0)

while($line = $inputReader.ReadLine()) {

    if(($null -eq $lockOrKey) -and ($line -eq "#####")) { $lockOrKey = "lock" }
    elseif(($null -eq $lockOrKey) -and ($line -eq ".....")) { $lockOrKey = "key" }
    elseif($rowCount -lt 6) {

        for($i = 0; $i -lt $line.Length; $i++) {
            
            if($line[$i] -eq "#") { $current[$i]++ }
        }
    }
    else {

        if($lockOrKey -eq "lock") { $locks += ,$current }
        else { $keys += ,$current }
        
        $lockOrKey = $null
        $rowCount = -1
        $current = @(0,0,0,0,0)
        $null = $inputReader.ReadLine()
    }

    $rowCount++
}

$validCombinations = 0

foreach($lock in $locks) {

    $validKeys = @($keys | Where-Object { ($_[0] -le (5-$lock[0])) -and ($_[1] -le (5-$lock[1])) -and ($_[2] -le (5-$lock[2])) -and ($_[3] -le (5-$lock[3])) -and ($_[4] -le (5-$lock[4])) })
    $validCombinations += $validKeys.Count
}

Write-Host "$validCombinations."

# The answer is 3.307