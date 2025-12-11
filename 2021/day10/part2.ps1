
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 10 - Part 2

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$scores = @()

while($line = $inputReader.ReadLine()) {

    while($line -match "\(\)|\[\]|\{\}|\<\>") {
        
        $line = $line.Replace("()","").Replace("[]","").Replace("{}","").Replace("<>","")
    }

    if($line -notmatch "\)|\]|\}|\>") {

        $currentScore = 0
        $completionString = ""

        foreach($char in $line.ToCharArray()) {

            switch($char) {

                "(" { $completionString = ")" + $completionString }
                "[" { $completionString = "]" + $completionString }
                "{" { $completionString = "}" + $completionString }
                "<" { $completionString = ">" + $completionString }
            }
        }

        foreach($char in $completionString.ToCharArray()) {

            $currentScore = $currentScore * 5
            
            switch($char) {

                ")" { $currentScore += 1 }
                "]" { $currentScore += 2 }
                "}" { $currentScore += 3 }
                ">" { $currentScore += 4 }
            }
        }

        $scores += $currentScore
    }
}

$inputReader.Close()
$inputReader.Dispose()

Write-Host "The autocomplete middle score is $(($scores | Sort-Object)[(($scores.Count - 1) / 2)])."

# Answer is 1190420163
