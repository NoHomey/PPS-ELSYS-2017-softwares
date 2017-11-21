import Data.List.Split --splitOn
import Data.List --transpose

main :: IO ()
main = do
    csv1 <- readFile "matrix1.csv"
    csv2 <- readFile "matrix2.csv"
    let m1 = csvToMatrix csv1
    let m2 = csvToMatrix csv2
    let result = matrixAdd m1 m2
    putStrLn $  if sameSize m1 m2 then
                    if negativeMatrix result == transpose result 
                        then "true"
                        else "false"
                else "undefined"

sameSize :: Num a => [[a]] -> [[a]] -> Bool
sameSize m1 m2 = length m1 == length m2 && length (head m1) == length (head m2)

matrixAdd :: Num a => [[a]] -> [[a]] -> [[a]]
matrixAdd = zipWith $ zipWith (+)

negativeMatrix :: Num a => [[a]] -> [[a]]
negativeMatrix = map $ map (0-)

csvToMatrix :: String -> [[Double]]
csvToMatrix = (map (map (\x -> read x :: Double) -- string to double
                    . (splitOn ","))) -- split values
                . (splitOn "\n") -- split lines