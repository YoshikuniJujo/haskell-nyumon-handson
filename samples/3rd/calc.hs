import Data.Maybe (listToMaybe, fromJust)
import Data.Char (isDigit, isSpace, digitToInt)
import System.IO (hFlush, stdout)
import Data.Bool (bool)

type Parse a = String -> [(a, String)]

succeed :: a -> Parse a
succeed v inp = [(v, inp)]

check :: (Char -> Bool) -> Parse Char
check p (c : cs) | p c = [(c, cs)]
check _ _ = []

char :: Char -> Parse Char
char c = check (== c)

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
list1 p = (p >@> list p) `build` uncurry (:)

number :: Parse Integer
number = list1 (check isDigit) `build` read

parse :: Parse a -> String -> Maybe a
parse p = listToMaybe . map fst . (p >@ eof)

spaces1 :: Parse ()
spaces1 = list1 (check isSpace) `build` const ()

spNumbers :: Parse [Integer]
spNumbers = list (spaces1 @> number)

numbers :: Parse [Integer]
numbers = (number >@> spNumbers)
	`build` uncurry (:)

type Op = Integer -> Integer -> Integer

ad, sb, ml, dv :: Parse Op
ad = char '+' `build` const (+)
sb = char '-' `build` const (-)
ml = char '*' `build` const (*)
dv = char '/' `build` const div

op :: Parse Op
op = ad `alt` sb `alt` ml `alt` dv

expr :: Parse Integer
expr = (term >@> op >@> term) `build`
	\((x, o), y) -> x `o` y

term :: Parse Integer
term = number `alt`
	(char '(' @> expr >@ char ')')

calc :: String -> Maybe Integer
calc = parse expr

doWhile_ :: IO Bool -> IO ()
doWhile_ act = do
	c <- act
	bool (return ()) (doWhile_ act) c

main :: IO ()
main = doWhile_ $ do
	putStr "> "
	hFlush stdout
	l <- getLine
	case l of
		":q" -> return False
		_ -> do	case calc l of
				Just n -> print n
				Nothing -> putStrLn "parse error"
			return True
