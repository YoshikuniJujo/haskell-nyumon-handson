double :: Integer -> Integer
double x = x * 2

lucky :: Integer
lucky = 7

taro :: (String, Integer)
taro = ("Taro Yamada", 35)

helloTo :: Maybe String -> String
helloTo (Just n) = "Hello, " ++ n ++ "!"
helloTo Nothing = "Hello, customer!"

human :: (String, Integer) -> String
human (n, a) = n ++ "(" ++ show a ++ ")"

safeRecip :: Double -> Maybe Double
safeRecip 0 = Nothing
safeRecip x = Just (1 / x)

isNothing Nothing = True
isNothing (Just _) = False

atPattern :: Maybe Integer -> String
atPattern jx@(Just x) = show jx ++ ": " ++ show x
atPattern Nothing = ""

safeSqrt :: Double -> Maybe Double
safeSqrt x
	| x < 0 = Nothing
	| otherwise = Just (sqrt x)

safeSqrt' :: Double -> Maybe Double
safeSqrt' x = if x < 0 then Nothing else Just (sqrt x)

yesNo :: Char -> Maybe Bool
yesNo c = case c of
	'n' -> Just False
	'y' -> Just True
	_ -> Nothing

ignoreSecond :: a -> b -> a
ignoreSecond x y = x

type Human = (String, Integer)

showHuman :: Human -> String
showHuman (n, a) = n ++ "(" ++ show a ++ ")"

type Check a = (Bool, a)
tasks :: [Check String]
tasks = [(False, "Shopping"), (True, "Walking")]

some :: Integer
some = 8		-- some is 8

hoge :: Integer -> Integer
hoge x = x * 3
{-
hoge 3 = 9
hoge 10 = 30
...
-}
