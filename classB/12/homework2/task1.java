import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.Vector;

public class MatrixAdd {
    public static void main(String[] args) throws FileNotFoundException {
        Scanner scanner1 = new Scanner(new File("matrix1.csv"));
        Scanner scanner2 = new Scanner(new File("matrix2.csv"));

        Vector<Vector<Integer>> matrix1 = new Vector<>();
        Vector<Vector<Integer>> matrix2 = new Vector<>();

        init(scanner1, matrix1);
        init(scanner2, matrix2);

        if(!checkIfEqualSize(matrix1, matrix2)) {
            System.out.print("undefined");
        } else {
            Vector<Vector<Integer>> result = addTwoMatrices(matrix1, matrix2);

            if(checkIfSymmetric(result)) {
                System.out.print("true");
            } else {
                System.out.print("false");
            }
        }

        scanner1.close();
        scanner2.close();
    }

    private static Vector<Vector<Integer>> transposeMatrix(Vector<Vector<Integer>> result) {
        Vector<Vector<Integer>> transposedResult = new Vector<>();

        for(int i = 0; i < result.get(0).size(); i++) {
            Vector<Integer> row = new Vector<>();
            for(int j = 0; j < result.size(); j++) {
                row.add(result.get(j).get(i));
            }
            transposedResult.add(row);
        }

        return transposedResult;
    }

    private static boolean checkIfSymmetric(Vector<Vector<Integer>> matrix) {
        Vector<Vector<Integer>> transposedMatrix = transposeMatrix(matrix);

        if(!checkIfEqualSize(matrix, transposedMatrix)) {
            return false;
        } else {
            for(int i = 0; i < matrix.size(); i++) {
                for(int j = 0; j < matrix.get(0).size(); j++) {
                    if(matrix.get(i).get(j) != transposedMatrix.get(i).get(j)) {
                        return false;
                    }
                }
            }
        }

        return true;
    }

    private static Vector<Vector<Integer>> addTwoMatrices(Vector<Vector<Integer>> matrix1, Vector<Vector<Integer>> matrix2) {
        Vector<Vector<Integer>> result = new Vector<>();
        int val;

        for(int i = 0; i < matrix1.size(); i++) {
            Vector<Integer> row = new Vector<>();
            for(int j = 0; j < matrix1.get(0).size(); j++) {
                val = matrix1.get(i).get(j) + matrix2.get(i).get(j);
                row.add(val);
            }
            result.add(row);
        }

        return result;
    }

    private static boolean checkIfEqualSize(Vector<Vector<Integer>> matrix1, Vector<Vector<Integer>> matrix2) {
        return matrix1.size() == matrix2.size() && matrix1.get(0).size() == matrix2.get(0).size();
    }

    private static void init(Scanner scanner, Vector<Vector<Integer>> matrix) {
        int i;
        while(scanner.hasNext()){
            Vector<Integer> row = new Vector<>();
            String[] s = scanner.next().split(",");

            i = 0;

            while(i < s.length) {
                row.add(Integer.parseInt(s[i]));
                i++;
            }

            matrix.add(row);
        }
    }
}
