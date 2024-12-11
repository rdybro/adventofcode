
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 9 - Part 1

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

        for($i = 0; $i -lt $number; $i++) { $blocks.Add($fileId) | Out-Null }

        $isFile = $false
        $fileId++
        $index += $number
    }
    else {

        for($i = 0; $i -lt $number; $i++) {
            
            $blocks.Add(".") | Out-Null
            $emptySpaces.Add($index) | Out-Null
            $index++
        }

        $isFile = $true
    }
}

while($emptySpaces -and ($emptySpaces[0] -lt $blocks.Count)) {

    if($blocks[-1] -ne ".") {

        $blocks[$emptySpaces[0]] = $blocks[-1]
        $emptySpaces.RemoveAt(0)
    }

    $blocks.RemoveAt($blocks.Count-1)
}

$filesystemChecksum = 0

for($i = 0; $i -lt $blocks.Count; $i++) { $filesystemChecksum += $i * $blocks[$i] }

Write-Host "The filesystem checksum is $filesystemChecksum."

# The answer is 6.356.833.654.075
