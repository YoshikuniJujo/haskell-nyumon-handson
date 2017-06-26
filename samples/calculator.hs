import Data.Maybe (listToMaybe)
import Data.Char (isDigit)
import System.IO (hFlush, stdout)

type Parse a = String -> [(a, String)]

succeed :: a -> Parse a
succeed v inp = [(v, inp)]

check :: (Char -> Bool) -> Parse Char
check p (c : cs) | p c = [(c, cs)]
check _ _ = []

char :: Char -> Parse Char
char c0 = check (== c0)

alt :: Parse a -> Parse a -> Parse a
(p1 `alt` p2) inp = p1 inp ++ p2 inp

build :: Parse a -> (a -> b) -> Parse b
build p f inp = [ (f x, r) | (x, r) <- p inp ]

(>@>) :: Parse a -> Parse b -> Parse (a, b)
(p1 >@> p2) inp = [ ((x, y), r') | (x, r) <- p1 inp, (y, r') <- p2 r ]

(>@) :: Parse a -> Parse b -> Parse a
p1 >@ p2 = (p1 >@> p2) `build` fst

(@>) :: Parse a -> Parse b -> Parse b
p1 @> p2 = (p1 >@> p2) `build` snd

eof :: Parse ()
eof "" = [((), "")]
eof _ = []

list, list1 :: Parse a -> Parse [a]
list p = succeed [] `alt` list1 p
list1 p = (p >@> list p) `build` (\(x, xs) -> x : xs)

number :: Parse Integer
number = list1 (check isDigit) `build` read

parse :: Parse a -> String -> Maybe a
parse p = listToMaybe . map fst . (p >@ eof)

type Op = Integer -> Integer -> Integer

op, ad, sb, ml, dv :: Parse Op
op = ad `alt` sb `alt` ml `alt` dv
ad = char '+' `build` const (+)
sb = char '-' `build` const (-)
ml = char '*' `build` const (*)
dv = char '/' `build` const div

expr, term :: Parse Integer
expr = (term >@> op >@> term) `build` \((x, o), y) -> x `o` y
term = number `alt` (char '(' @> expr >@ char ')')

doWhile_ :: IO Bool -> IO ()
doWhile_ act = do
	c <- act
	if c then doWhile_ act else return ()

main :: IO ()
main = doWhile_ $ do
	putStr "> "
	hFlush stdout
	l <- getLine
	case l of
		"quit" -> return False
		"exit" -> return False
		_ -> do	let	me = parse expr l
				rslt = case me of
					Just n -> show n
					Nothing -> "parse error"
			putStrLn rslt
			return True
