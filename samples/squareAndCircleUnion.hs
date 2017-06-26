data Shape
	= Square (Double, Double) Double
	| Circle (Double, Double) Double
	deriving Show

sampleSquare :: Shape
sampleSquare = Square (10, 20) 15

sampleCircle :: Shape
sampleCircle = Circle (30, 45) 12

area :: Shape -> Double
area (Square _ x) = x ^ 2
area (Circle _ r) = r ^ 2 * pi
