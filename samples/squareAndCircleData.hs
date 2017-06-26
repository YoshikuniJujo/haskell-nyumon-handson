data Square = Square (Double, Double) Double deriving Show
data Circle = Circle (Double, Double) Double deriving Show

sampleSquare :: Square
sampleSquare = Square (10, 20) 15

sampleCircle :: Circle
sampleCircle = Circle (30, 45) 12

squareArea :: Square -> Double
squareArea (Square _ x) = x ^ 2

circleArea :: Circle -> Double
circleArea (Circle _ r) = r ^ 2 * pi
