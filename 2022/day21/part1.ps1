
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 21 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$monkeys = @{}
$queue = [System.Collections.Generic.List[string]]::new()

while($line = $inputReader.ReadLine()) {

    $lineSplit = $line.Split(":").Trim()

    try { $monkeys[$lineSplit[0]] = [int]$lineSplit[1] }
    catch { $queue.Add($line) }
}

$inputReader.Close()
$inputReader.Dispose()

while($null -eq $monkeys["root"]) {

    for($i = 0; $i -lt $queue.Count; $i++) {

        $split = $queue[$i].Split(":").Trim().Split(" ")

        if($monkeys[$split[1]] -and $monkeys[$split[3]]) {

            $monkeys[$split[0]] = Invoke-Expression -Command "$($monkeys[$split[1]]) $($split[2]) $($monkeys[$split[3]])"
            $queue.RemoveAt($i)
            $i--
        }
    }
}

Write-Host "The monkey named 'root' will yell $($monkeys["root"])."

# Answer is 155.708.040.358.220
