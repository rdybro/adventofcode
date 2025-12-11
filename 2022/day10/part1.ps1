
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 10 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$cycle = 1
$x = 1

$cycleRegister = @(20,60,100,140,180,220)
$signalStrengths = @()

while($line = $inputReader.ReadLine()) {

    if(($cycle -in $cycleRegister) -or (($cycle + 1) -in $cycleRegister)) {

        if($cycle -notmatch "0$") { $newCycle = $cycle + 1 }
        else { $newCycle = $cycle }
        
        $signalStrengths += $newCycle * $x
        $cycleRegister = $cycleRegister | Where-Object { $_ -ne $newCycle }
    }

    if($line -eq "noop") { $cycle++ }
    else {

        $cycle += 2
        $x += [int]$line.Split(" ")[1]
    }
}

Write-Host "The sum of the six signal strengths are $(($signalStrengths | Measure-Object -Sum).Sum)."

# Answer is 13.860

$inputReader.Close()
$inputReader.Dispose()