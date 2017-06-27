import System.IO (stdout, hFlush)
import System.Random (randomRIO)
import Text.Read (readMaybe)

doWhile_ :: IO Bool -> IO ()
doWhile_ act = do
	c <- act
	if c then doWhile_ act else return ()

message :: Integer -> String -> IO ()
message n lh = putStrLn $ "Your guess, " ++ show n ++ ", is too " ++ lh

main :: IO ()
main = do
	n0 <- randomRIO (1, 100 :: Integer)
	putStr "Guess! (1..100): "
	hFlush stdout
	doWhile_ $ do
		l <- getLine
		case readMaybe l of
			Just n	| n == n0 -> do
					putStrLn "You Win!"
					return False
				| n < n0 -> do
					message n "low"
					return True
				| n > n0 -> do
					message n "high"
					return True
			Nothing -> do
				putStrLn "Oops!"
				putStr "Guess again! (1..100): "
				hFlush stdout
				return True
