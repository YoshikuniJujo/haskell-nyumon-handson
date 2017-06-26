getLineWithMsg :: IO String
getLineWithMsg = do
	l <- getLine
	putStrLn $ "Your input: " ++ l
	return l
