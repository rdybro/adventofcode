
# Advent of Code 2021
# Rasmus Dybro Larsen
# Day 23 - Part 1

# Beginning diagram:
#   ...........
#     D B A C
#     B D A C

# Energy cost per step:
$amber = 1
$bronze = 10
$copper = 100
$desert = 1000

$cost = 0

#   AA.........
#     D B . C
#     B D . C

$cost += (7 * $amber) + (7 * $amber)

#   AA.........
#     D B C .
#     B D C .

$cost += (5 * $copper) + (5 * $copper)

#   AA.B.......
#     D . C .
#     B . C D

$cost += (2 * $bronze) + (8 * $desert)

#   AA.........
#     D . C .
#     B B C D

$cost += (3 * $bronze)

#   AA.........
#     . B C D
#     . B C D

$cost += (8 * $desert) + (5 * $bronze)

#   ...........
#     A B C D
#     A B C D

$cost += (3 * $amber) + (3 * $amber)

Write-Host "The total cost is $cost."

# Answer is 17120
