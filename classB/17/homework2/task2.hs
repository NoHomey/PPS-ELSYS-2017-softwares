import Data.List.Split (splitOn)
import Data.List (transpose)

main :: IO ()
main = do
    csv1 <- readFile "matrix1.csv"
    csv2 <- readFile "matrix2.csv"
    let m1 = csvToMatrix csv1
    let m2 = csvToMatrix csv2
    let result = multiplyMatrix m1 m2
    putStrLn $  if canMultiply m1 m2 then
                    if result == transpose result 
                        then "true"
                        else "false"
                else "undefined"

canMultiply :: Num a => [[a]] -> [[a]] -> Bool
canMultiply m1 m2 = length (head m1) == length m2

multiplyMatrix :: Num a => [[a]] -> [[a]] -> [[a]]
multiplyMatrix m1 m2 = map (\m1row -> map (sum --sum the products
                                            . zipWith (*) --muliply all pairs
                                                m1row) --m1 rows
                                                    (transpose m2)) --transposed m2 rows ( m2 cols )
                                                        m1 --map over m1 rows

csvToMatrix :: String -> [[Double]]
csvToMatrix = (map (map read -- read strings to doubles
                        . (splitOn ","))) -- split values
                            . lines -- split lines