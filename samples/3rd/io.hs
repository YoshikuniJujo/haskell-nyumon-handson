hello :: IO ()
hello = putStrLn "hello" >> putStrLn "world"

echo :: IO ()
echo = getLine >>= putStrLn
