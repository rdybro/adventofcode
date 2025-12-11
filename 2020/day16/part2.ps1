
# Advent of Code 2020
# Day 16 - Part 2

$inputContent = Get-Content -LiteralPath input.txt

# I guess this ended up being kind of a mess - but it works

$validNumbers = @()
$currentLine = 0

$ticketFields = @{}
$confirmedFields = @{}

$possibleFields = New-Object -TypeName "System.Collections.ArrayList"
$validTickets = @()

$result = 1

while($inputContent[$currentLine] -ne "") {

    $split = $inputContent[$currentLine].Split(":").Split(" or ").Trim().Split("-")
    $validNumbers += ($split[1]..$split[2]) + ($split[3]..$split[4])
    $ticketFields += @{ $split[0] = @($split[1]..$split[2]) + @($split[3]..$split[4]) }

    $currentLine++
}

foreach($key in $ticketFields.Keys) {

    $index = 0

    while($index -lt $ticketFields.Count) {

        $null = $possibleFields.Add("$index-$key")
        $index++
    }
}

$myTicket = $inputContent[$currentLine+2].Split(",")

# Jump to "Nearby tickets"
$currentLine += 5

while($currentLine -lt $inputContent.Count) {

    $numbers = $inputContent[$currentLine].Split(",")
    $valid = $true

    foreach($number in $numbers) {
        
        if([int]$number -notin $validNumbers) { $valid = $false }
    }

    if($valid) { $validTickets += ,$numbers }

    $currentLine++
}

foreach($ticket in $validTickets) {

    $index = 0
    
    foreach($number in $ticket) {
        
        foreach($field in $ticketFields.Keys) {
            
            if($ticketFields[$field] -notcontains $number) { $possibleFields.Remove("$index-$field") }
        }
        
        $index++
    }
}

while($possibleFields.Count -gt 0) {
    
    foreach($field in $ticketFields.Keys) {
        
        $filter = @($possibleFields | Where-Object { $_ -like "*-$field" })
        
        if($filter.Count -eq 1) {
            
            $filterSplit = $filter[0].Split("-")
            $confirmedFields += @{ $filterSplit[1] = $filterSplit[0] }
            $possibleFields.Remove($filter[0])
        
            foreach($item in @($possibleFields | Where-Object { $_ -like "$($filterSplit[0])-*" })) { $possibleFields.Remove($item) }
        }
    }
}

foreach($field in ($confirmedFields.Keys | Where-Object { $_ -like "departure*" })) { $result = $result * $myTicket[$confirmedFields[$field]] }

Write-Host "The product of the 'departure' fields on my ticket is $result."
