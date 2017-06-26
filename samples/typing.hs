import System.Environment (getArgs)
import System.IO (Handle, IOMode(..), openFile, hIsEOF, hGetLine)

doWhile_ :: IO Bool -> IO ()
doWhile_ act = do
	b <- act
	if b then doWhile_ act else return ()

runLine :: Handle -> IO ()
runLine h = do
	l0 <- hGetLine h
	putStrLn l0
	doWhile_ $ do
		l1 <- getLine
		return $ l1 /= l0

main :: IO ()
main = do
	fp : _ <- getArgs
	h <- openFile fp ReadMode
	doWhile_ $ do
		e <- hIsEOF h
		if e then return False else
			runLine h >> return True
