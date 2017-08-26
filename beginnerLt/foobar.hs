import Control.Concurrent (forkIO, threadDelay)

main :: IO ()
main = do
	forkIO . loop $ do
		threadDelay 2000000
		putStrLn "foo"
	forkIO . loop $ do
		threadDelay 3000000
		putStrLn "bar"
	threadDelay 15000000

loop :: IO a -> IO ()
loop act = act >> loop act
