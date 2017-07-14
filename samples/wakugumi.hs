import Data.List

main :: IO ()
main = interact $ unlines . yourFun yourInit . lines

yourFun :: YourState -> [String] -> [String]
yourFun s (l : ls)
	| yourQuit l = ["Good-bye!"]
	| otherwise = yourOutput s l : yourFun (yourNext s l) ls

type YourState = Integer

yourInit :: YourState
yourInit = 0

yourQuit :: String -> Bool
yourQuit = (== "Bye!")

yourOutput :: YourState -> String -> String
yourOutput s l
	| s < 3 = "You say \"" ++ l ++ "\""
	| otherwise = "I love you!"

yourNext :: YourState -> String -> YourState
yourNext s l
	| "love" `isInfixOf` l = s + 1
	| otherwise = s
