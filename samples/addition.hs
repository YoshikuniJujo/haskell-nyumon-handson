addition :: IO ()
addition =
	putStrLn "Please input two numbers: " >>
	getLine >>= \x ->
	getLine >>= \y ->
	putStrLn (show (read x + read y))

additionDo :: IO ()
additionDo = do
	putStrLn "Please input two numbers: "
	x <- getLine
	y <- getLine
	putStrLn (show (read x + read y))
