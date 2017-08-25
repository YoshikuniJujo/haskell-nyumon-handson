import Control.Concurrent
import Control.Concurrent.Chan
import System.IO
import Network

main :: IO ()
main = do
	c <- newChan
	forkIO . loopS (0, 0) $ \(k, t) -> do
		(h, ans) <- readChan c
		let	(k', t') = case ans of
				"kinoko" -> (k + 1, t)
				"takenoko" -> (k, t + 1)
				_ -> (k, t)
		putStrLn $ template "kinoko" k'
		putStrLn $ template "takenoko" t'
		hPutStrLn h $ "kinoko: " ++ show k' ++ " takenoko: " ++ show t'
		return (k', t')
	s <- listenOn $ PortNumber 4492
	loop $ do
		(h, hn, pn) <- accept s
		print hn
		print pn
		forkIO $ do
			hGetLine h >>= putStrLn . ("name  : " ++)
			kt <- hGetLine h
			putStrLn $ "answer: " ++ kt
			writeChan c (h, kt)

template :: String -> Int -> String
template kt n = kt ++ ": " ++ replicate (8 - length kt) ' ' ++
	replicate n '*' ++ " (" ++ show n ++ ")"

loop :: IO a -> IO ()
loop act = act >> loop act

loopS :: a -> (a -> IO a) -> IO ()
loopS s act = act s >>= (`loopS` act)
