
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 5 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$stacks = $null

while($line = $inputReader.ReadLine()) {

    if($line.Substring(0,2) -ne " 1") {
        
        $stackTotal = ($line.Length + 1) / 4
    
        if($null -eq $stacks) {
            
            $stacks = @{}
            for($i = 1; $i -le $stackTotal; $i++) { $stacks.Add($i,[System.Collections.Generic.List[string]]::new()) }
        }
    
        $lineIndex = 1
    
        for($i = 1; $i -le $stackTotal; $i++) {
            
            $lineSubstring = $line.Substring($lineIndex,1)
            if($lineSubstring -ne " ") { $stacks[$i].Add($lineSubstring) }
            $lineIndex += 4
        }
    }
}

while($line = $inputReader.ReadLine()) {

    $lineSplit = $line.Split(" ")
    $moveFrom = [int]$lineSplit[3]
    $moveTo = [int]$lineSplit[5]

    for($i = 1; $i -le $lineSplit[1]; $i++) {

        $stacks[$moveTo].Insert(0,$stacks[$moveFrom][0])
        $stacks[$moveFrom].RemoveAt(0)
    }
}

$inputReader.Close()
$inputReader.Dispose()

$answer = ""
foreach($stack in $stacks.Keys | Sort-Object) { $answer += $stacks[$stack][0] }

Write-Host "The crates on top of each stack is $answer."

# Answer is FWNSHLDNZ
