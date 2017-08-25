import System.IO
import System.Environment
import Network

main :: IO ()
main = do
	addr : nm : kt : _ <- getArgs
	h <- connectTo addr $ PortNumber 4492
	hPutStrLn h nm
	hPutStrLn h kt
	hGetLine h >>= putStrLn
	hClose h
