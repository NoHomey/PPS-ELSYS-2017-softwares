import Data.List.Split (splitOn)
import Data.List (transpose)

main :: IO ()
main = do
    csv1 <- readFile "matrix1.csv"
    csv2 <- readFile "matrix2.csv"
    let m1 = csvToMatrix csv1
    let m2 = csvToMatrix csv2
    let result = addMatrix m1 m2
    putStrLn $  if sameSize m1 m2 then
                    if negateMatrix result == transpose result 
                        then "true"
                        else "false"
                else "undefined"

sameSize :: Num a => [[a]] -> [[a]] -> Bool
sameSize m1 m2 = length m1 == length m2 &&
                    map length m1 == map length m2

addMatrix :: Num a => [[a]] -> [[a]] -> [[a]]
addMatrix = zipWith $ zipWith (+)

negateMatrix :: Num a => [[a]] -> [[a]]
negateMatrix = map $ map negate

csvToMatrix :: String -> [[Double]]
csvToMatrix = (map (map read -- read strings to doubles
                        . (splitOn ","))) -- split values
                            . lines -- split lines