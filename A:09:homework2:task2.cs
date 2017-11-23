namespace CsvMatrix
{
	using System;
	using System.IO;
	using System.Linq;

	public class Program
	{
		public static void Main()
		{
			var matrix1 = ReadMatrix(File.ReadAllLines("matrix1.csv"));
			var matrix2 = ReadMatrix(File.ReadAllLines("matrix2.csv"));

			if (matrix1.GetLength(0) != matrix2.GetLength(0) ||
				matrix1.GetLength(1) != matrix2.GetLength(1))
			{
				Console.WriteLine("undefined");
				return;
			}

			Console.WriteLine(CheckForSymmetry(matrix1, matrix2));
		}

		private static int[,] ReadMatrix(string[] rows)
		{
			var cols = rows[0].Split(',');
			var matrix = new int[rows.Length, cols.Length];

			for (int i = 0; i < rows.Length; i++)
			{
				var numbers = rows[i].Split(',').Select(int.Parse).ToArray();

				for (int j = 0; j < cols.Length; j++)
				{
					matrix[i, j] = numbers[j];
				}
			}

			return matrix;
		}

		private static bool CheckForSymmetry(int[,] matrix1, int[,] matrix2)
		{
			for (int i = 0; i < matrix1.GetLength(0); i++)
			{
				for (int j = 0; j < matrix1.GetLength(1); j++)
				{
					if (matrix1[i, j] != matrix2[i, j])
					{
						return false;
					}
				}
			}

			return true;
		}
	}
}