import Control.Concurrent (forkIO, threadDelay)

main :: IO ()
main = do
	forkIO . loop $ do
		threadDelay $ 1000 * 1000
		putStrLn "hello"
	forkIO . loop $ do
		threadDelay $ 1500 * 1000
		putStrLn "world"
	threadDelay $ 30 * 1000 * 1000

loop :: IO a -> IO ()
loop act = act >> loop act
