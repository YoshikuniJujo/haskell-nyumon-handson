import Control.Concurrent (forkIO, threadDelay)
import System.Environment (getArgs)

main :: IO ()
main = sleepSort . map read =<< getArgs

sleepSort :: [Int] -> IO ()
sleepSort =
	mapM_ (\x -> forkIO $ threadDelay (x * 1000) >> print x)
