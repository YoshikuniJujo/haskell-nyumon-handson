data Janken = Rock | Paper | Scissors deriving (Show, Eq)
data Result = Lose | Draw | Win deriving Show

xxxAgainst :: Janken -> Janken -> Result
j `xxxAgainst` k | j == k = Draw
Rock `xxxAgainst` Paper = Lose
Paper `xxxAgainst` Scissors = Lose
Scissors `xxxAgainst` Rock = Lose
_ `xxxAgainst` _ = Win
