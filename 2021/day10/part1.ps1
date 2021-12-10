
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 10 - Part 1

$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input.txt")
#$inputReader = New-Object System.IO.StreamReader("$((Get-Location).Path)\input_example.txt")

$score = 0

while($line = $inputReader.ReadLine()) {

    while($line -match "\(\)|\[\]|\{\}|\<\>") {
        
        $line = $line.Replace("()","").Replace("[]","").Replace("{}","").Replace("<>","")
    }

    $line = $line.Replace("(","").Replace("[","").Replace("{","").Replace("<","")

    if($line) {
        
        switch($line.Substring(0,1)) {
            
            ")" { $score += 3 }
            "]" { $score += 57 }
            "}" { $score += 1197 }
            ">" { $score += 25137 }
        }    
    }
}

$inputReader.Close()
$inputReader.Dispose()

Write-Host "The syntax error score is $score."

# Answer is 389589
