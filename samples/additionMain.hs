main :: IO ()
main = do
	putStrLn "Please input two numbers: "
	x <- getLine
	y <- getLine
	putStrLn (show (read x + read y))
