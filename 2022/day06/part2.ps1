
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 6 - Part 2

$inputContent = Get-Content -LiteralPath input.txt
#$inputContent = "mjqjpqmgbljsphdztnvjfqwrcgsmlb" # Example 1 - 7
#$inputContent = "bvwbjplbgvbhsrlpgdmjqwftvncz" # Example 2 - 5
#$inputContent = "nppdvjthqldpwncqszvftbrmjlhg" # Example 3 - 6
#$inputContent = "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg" # Example 4 - 10
#$inputContent = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw" # Example 5 - 11

$answer = $null
$packetLength = 14
$index = $packetLength

while($null -eq $answer) {

    if(($inputContent.Substring($index - $packetLength, $packetLength).ToCharArray() | Sort-Object | Get-Unique).Count -eq $packetLength) { $answer = $index }
    else { $index++ }
}

Write-Host "The start-of-message marker is at the $($answer)th character."

# Answer is 3.605
