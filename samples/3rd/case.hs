helloTo :: String -> String
helloTo n = case n of
	"Yoshikuni" -> "Good morning, sir."
	_ -> "Hello, " ++ n ++ "!"

users :: [(String, Int)]
users = [
	("Taro", 3),
	("Saburo", 9),
	("Keiko", 5) ]

getId :: String -> String
getId n = case lookup n users of
	Just i -> "ID: " ++ show i
	Nothing -> "No such user"
