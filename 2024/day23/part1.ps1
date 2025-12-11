
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 23 - Part 1

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

[System.Collections.ArrayList]$computers = @()
[System.Collections.ArrayList]$computersInterconnected = @()

foreach($connection in $inputContent) {
    
    foreach($computer in $connection.Split("-")) {

        if($computer -notin $computers) { $computers.Add($computer) | Out-Null }
    }
}

foreach($connection in $inputContent) {

    $connectionSplit = $connection.Split("-")
    $computer1 = $connectionSplit[0]
    $computer2 = $connectionSplit[1]

    foreach($computer3 in $computers | Where-Object { $_ -notin $connectionSplit }) {

        $string = ($computer1,$computer2,$computer3 | Sort-Object) -join "-"

        if(
            (($computer1 -like "t*") -or ($computer2 -like "t*") -or ($computer3 -like "t*")) -and
            (("$computer1-$computer3" -in $inputContent) -or ("$computer3-$computer1" -in $inputContent)) -and
            (("$computer2-$computer3" -in $inputContent) -or ("$computer3-$computer2" -in $inputContent))
        ) { $computersInterconnected.Add($string) | Out-Null }
    }
}

Write-Host "There is $(($computersInterconnected | Select-Object -Unique).Count) sets of connected computers with at least one computer with a name starting with 't'."

# The answer is 1.000