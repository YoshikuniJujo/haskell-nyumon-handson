helloTo :: IO ()
helloTo = do
	putStrLn "May I ask your name?"
	n <- getLine
	let	name = "Mr./Ms. " ++ n
	putStrLn $ "Hello, " ++ name ++ "!"
	putStrLn $ name ++ ", please be my friend."
