type Square = ((Double, Double), Double)
type Circle = ((Double, Double), Double)

squareArea :: Square -> Double
squareArea (_, x) = x ^ 2

circleArea :: Circle -> Double
circleArea (_, r) = r ^ 2 * pi

sampleSquare :: Square
sampleSquare = ((10, 20), 15)

sampleCircle :: Circle
sampleCircle = ((30, 45), 12)
