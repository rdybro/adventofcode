
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 2 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

# A / 1 / Rock
# B / 2 / Paper
# C / 3 / Scissor

$points = 0

# X / 0 / Loss
# Y / 3 / Draw
# Z / 6 / Win

while($round = $inputReader.ReadLine()) {

    switch($round) {
        "A X" { $points += 3 } # Loss - play scissor
        "A Y" { $points += 1 + 3 } # Draw - play rock
        "A Z" { $points += 2 + 6 } # Win - play paper
        "B X" { $points += 1 } # Loss - play rock
        "B Y" { $points += 2 + 3 } # Draw - play paper
        "B Z" { $points += 3 + 6 } # Win - play scissor
        "C X" { $points += 2 } # Loss - play paper
        "C Y" { $points += 3 + 3 } # Draw - play scissor
        "C Z" { $points += 1 + 6 } # Win - play rock
    }
}

Write-Host "My total score will end with $points points according to the strategy guide."

# Answer is 15.702

$inputReader.Close()
$inputReader.Dispose()