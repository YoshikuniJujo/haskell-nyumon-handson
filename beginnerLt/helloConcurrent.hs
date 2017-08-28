import Control.Monad (forever)
import Control.Concurrent (forkIO, threadDelay)

main :: IO ()
main = do
	forkIO . forever $ do
		threadDelay $ 1000 * 1000
		putStrLn "hello"
	forkIO . forever $ do
		threadDelay $ 1500 * 1000
		putStrLn "world"
	threadDelay $ 30 * 1000 * 1000
