
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 19 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$availablePatterns = $inputReader.ReadLine().Split(",").Trim()
$null = $inputReader.ReadLine()

$possiblePatternCount = 0

while($towel = $inputReader.ReadLine()) {

    [System.Collections.ArrayList]$queue = @(,"$towel")
    $designPossible = $false

    while($queue -and (-not $designPossible)) {

        foreach($pattern in $availablePatterns) {

            if($queue[0] -like "$pattern*") {
                
                $substring = $queue[0].Substring($pattern.Length)

                if($substring.Length -eq 0) { $designPossible = $true; $possiblePatternCount++ }
                elseif($substring -notin $queue) { $queue.Add($substring) | Out-Null }
            }
        }

        $queue.RemoveAt(0)
    }
}

Write-Host "There are $possiblePatternCount possible designs."

# The answer is 296