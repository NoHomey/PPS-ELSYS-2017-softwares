import Data.List.Split --splitOn
import Data.List --transpose

main :: IO ()
main = do
    csv1 <- readFile "matrix1.csv"
    csv2 <- readFile "matrix2.csv"
    let m1 = csvToMatrix csv1
    let m2 = csvToMatrix csv2
    let result = matrixMultiply m1 m2
    putStrLn $  if canMultiply m1 m2 then
                    if result == transpose result 
                        then "true"
                        else "false"
                else "undefined"

canMultiply :: Num a => [[a]] -> [[a]] -> Bool
canMultiply m1 m2 = length (head m1) == length m2

matrixMultiply :: Num a => [[a]] -> [[a]] -> [[a]]
matrixMultiply m1 m2 = map (\m1row -> map (sum . zipWith (*) m1row) (Data.List.transpose m2)) m1

csvToMatrix :: String -> [[Double]]
csvToMatrix = (map (map (\x -> read x :: Double) -- string to double
                    . (splitOn ","))) -- split values
                . (splitOn "\n") -- split lines