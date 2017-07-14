main :: IO ()
main = interact $ unlines
	. zipWith (++) ["Oh no ! You say ", "and I say "]
	. lines
