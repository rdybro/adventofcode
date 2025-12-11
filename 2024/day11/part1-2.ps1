
# Advent of Code 2024
# Rasmus Dybro Larsen
# Day 11 - Part 1 and 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = Get-Content -LiteralPath input_example1.txt
#$inputContent = Get-Content -LiteralPath input_example2.txt

#$blinks = 25 # Part 1
$blinks = 75 # Part 2
$stones = @{}

foreach($split in $inputContent.Split(" ")) { $stones.Add([string]$split,1) }

for($i = 0; $i -lt $blinks; $i++) {

    $stonesPreBlink = $stones.Clone()

    foreach($stone in $stonesPreBlink.Keys) {

        if($stone -eq "0") {

            if($stones["1"]) { $stones["1"] += $stonesPreBlink[$stone] }
            else { $stones.Add("1",$stonesPreBlink[$stone]) }
        }
        elseif($stone.Length % 2 -eq 0) {

            $stoneSplit = @(
                -join $stone[0..($stone.Length/2-1)],
                -join $stone[($stone.Length/2)..($stone.Length-1)]
            )

            foreach($split in $stoneSplit) {

                if($split -match "^0+$") { $split = "0" }
                else { $split = $split -replace "^0+","" }

                if($stones[$split]) { $stones[$split] += $stonesPreBlink[$stone] }
                else { $stones.Add($split,$stonesPreBlink[$stone]) }
            }
        }
        else {

            [string]$newEngraving = [ulong]$stone * 2024

            if($stones[$newEngraving]) { $stones[$newEngraving] += $stonesPreBlink[$stone] }
            else { $stones.Add($newEngraving,$stonesPreBlink[$stone]) }
        }

        $stones[$stone] -= $stonesPreBlink[$stone]
        if($stones[$stone] -eq 0) { $stones.Remove($stone) }
    }
}

Write-Host "After $blinks blinks, there are $(($stones.Values | Measure-Object -Sum).Sum) stones."

# The answer to part 1 is 175.006 (25 blinks)
# The answer to part 2 is 207.961.583.799.296 (75 blinks)

# I tried putting the check for if a stone already existed into a funtion, but it actually performed way worse (~300ms ot ~50ms for part 1)
# So I've kept it as-is without the function, even though that leaves me with a bit of duplicated code