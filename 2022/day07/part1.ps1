
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 7 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$files = @()
$currentDirectory = $null
$directoryLevel = $null

while($line = $inputReader.ReadLine()) {

    $lineSplit = $line.Split(" ")

    if(($lineSplit[0] -eq "$") -and ($lineSplit[1] -eq "cd")) {

        if($lineSplit[2] -eq "/") { $currentDirectory = "/"; $directoryLevel = 0 }
        elseif($lineSplit[2] -eq "..") { $currentDirectory = ($currentDirectory -split "/",-3)[0] + "/"; $directoryLevel -= 1 }
        else { $currentDirectory += $lineSplit[2] + "/"; $directoryLevel += 1 }
    }
    elseif($lineSplit[0] -ne "$") {

        if($lineSplit[0] -eq "dir") { $type = "dir"; $size = $null }
        else { $type = "file"; $size = $lineSplit[0] }

        $files += [pscustomobject]@{
            Path = $currentDirectory
            Name = $lineSplit[1]
            Level = $directoryLevel
            Type = $type
            Size = $size
        }
    }
}

foreach($dir in $files | Where-Object { $_.Type -eq "dir" } | Sort-Object "Level" -Descending) {

    $dir.Size = ($files | Where-Object { $_.Path -eq $dir.Path + $dir.Name + "/" } | Measure-Object "Size" -Sum).Sum
}

Write-Host "The sum of all directories with a size at 100.000 or less is $(($files | Where-Object { ($_.Type -eq "dir") -and ($_.Size -le 100000) } | Measure-Object "Size" -Sum).Sum)."

# Answer is 1.243.729
