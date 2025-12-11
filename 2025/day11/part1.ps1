
# Advent of Code 2025
# Rasmus Dybro Larsen
# Day 11 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

$devices = @{}

foreach($line in $inputContent) {

    $lineSplit = $line.Split(":").Trim()
    $devices += @{$lineSplit[0]=$lineSplit[1]}
}

$result = 0
$start = $devices["you"].Split(" ")

$queue = New-Object System.Collections.Generic.List[string]

foreach($s in $start) { $queue.Add($s) }

while($queue) {
    
    $path = $queue[0]
    $current = $path.Split(" ")[-1]

    $currentOutputs = $devices[$current]
    
    if($currentOutputs -eq "out") { $result++ }
    else{
    
        foreach($output in $currentOutputs.Split(" ") | Where-Object { $path -notlike "*$_*" }) {
            
            $queue.Add("$path $output")
        }
    }

    $queue.RemoveAt(0)
}

Write-Host "$result different paths leads to 'out'."

# The answer is 555