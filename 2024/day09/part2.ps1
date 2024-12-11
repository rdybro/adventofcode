
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 9 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example.txt

[System.Collections.ArrayList]$blocks = @()
$isFile = $true
$fileId = 0

[System.Collections.ArrayList]$emptySpaces = @()
$index = 0

foreach($char in $inputContent.ToCharArray()) {

    $number = [System.Int32]::Parse($char)

    if($isFile) {

        $blocks.Add([PSCustomObject]@{StartingIndex=$index;Size=$number;FileId=$fileId}) | Out-Null

        $isFile = $false
        $fileId++
    }
    else {

        if($number -gt 0) { $emptySpaces.Add([PSCustomObject]@{StartingIndex=$index;Size=$number}) | Out-Null }

        $isFile = $true
    }

    $index += $number
}

$filesystemChecksum = 0

foreach($file in $blocks | Sort-Object FileId -Descending) {

    $destination = $emptySpaces | Where-Object { ($_.Size -ge $file.Size) -and ($_.StartingIndex -lt $file.StartingIndex) } | Select-Object -First 1

    if($destination) {

        $file.StartingIndex = $destination.StartingIndex
        $destination.Size -= $file.Size

        if($destination.Size -eq 0) { $emptySpaces.Remove($destination) }
        else { $destination.StartingIndex += $file.Size }
    }

    for($i = $file.StartingIndex; $i -lt ($file.StartingIndex + $file.Size); $i++) { $filesystemChecksum += $i * $file.FileId; Write-Host "." -NoNewline }
}

Write-Host "The filesystem checksum is $filesystemChecksum."

# The answer is 6.389.911.791.746

# It doesn't run very fast - I think it should be possible to improve a lot
# I think the bottleneck is finding the $destination in line 41 - not 100% sure though