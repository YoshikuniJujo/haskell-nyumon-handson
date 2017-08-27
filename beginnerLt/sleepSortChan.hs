import Control.Monad (forM_)
import Control.Concurrent (forkIO, threadDelay)
import Control.Concurrent.Chan (newChan, getChanContents, writeChan)

sleepSort :: [Int] -> IO [Int]
sleepSort xs = do
	c <- newChan
	mapM_ (\x -> forkIO $ threadDelay (x * 1000) >> writeChan c x) xs
	take (length xs) <$> getChanContents c
