main :: IO ()
main = interact $ (++ "\n") . show . sum . map read . takeWhile (/= ".") . lines
