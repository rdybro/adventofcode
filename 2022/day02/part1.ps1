
# Advent of Code 2022
# Rasmus Dybro Larsen
# Day 2 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

# A / X / 1 / Rock
# B / Y / 2 / Paper
# C / Z / 3 / Scissor

$points = 0

# 0 Loss / 3 Draw / 6 Win

while($round = $inputReader.ReadLine()) {

    switch($round) {
        "A X" { $points += 1 + 3 } # Draw - played rock
        "A Y" { $points += 2 + 6 } # Win - played paper
        "A Z" { $points += 3 } # Loss - played scissor
        "B X" { $points += 1 } # Loss - played rock
        "B Y" { $points += 2 + 3 } # Draw - played paper
        "B Z" { $points += 3 + 6 } # Win - played scissor
        "C X" { $points += 1 + 6 } # Win - played rock
        "C Y" { $points += 2 } # Loss - played paper
        "C Z" { $points += 3 + 3 } # Draw - played scissor
    }
}

Write-Host "My total score will end with $points points according to the strategy guide."

# Answer is 15.523

$inputReader.Close()
$inputReader.Dispose()