using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MathNet.Numerics;
using MathNet.Numerics.LinearAlgebra;
using MathNet.Numerics.Data.Text;
using System.IO;

namespace Matrix
{
    public partial class Matrix : Form
    {
        public Matrix()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            // Read first file
            string fileOne = "matrixone.csv";
            Matrix<double> fileMatrixOne = DelimitedReader.Read<double>(fileOne, false, ",", false);
            // Write in textBox1 the information about fileMatrixOne
            textBox1.AppendText("\n");
            textBox1.AppendText(fileMatrixOne.ToString("F2"));

            textBox1.AppendText("matrix1 rows: " + fileMatrixOne.RowCount.ToString("F2"));
            textBox1.AppendText("\n");
            textBox1.AppendText("matrix1 columns: " + fileMatrixOne.ColumnCount.ToString("F2"));
            textBox1.AppendText("\n");
            // FirstCSV file into a multidimensional array
            // string[][] numOne = File.ReadLines(@"C:\Users\PC\Desktop\matrix1.csv").Select(s => s.Split(",".ToCharArray())).ToArray().ToArray();
            // textBox1.AppendText("stringOne : " + numOne[1][0]);

            // Read second file
            string fileTwo = "matrixtwo.csv";
            Matrix<double> fileMatrixTwo = DelimitedReader.Read<double>(fileTwo, false, ",", false);
            // Write in textBox1 the information about fileMatrixTwo
            textBox1.AppendText("\n");
            textBox1.AppendText(fileMatrixTwo.ToString("F2"));

            textBox1.AppendText("matrix2 rows: " + fileMatrixTwo.RowCount.ToString("F2"));
            textBox1.AppendText("\n");
            textBox1.AppendText("matrix2 columns: " + fileMatrixTwo.ColumnCount.ToString("F2"));
            textBox1.AppendText("\n");
            // FirstCSV file into a multidimensional array
            // string[][] numTwo = File.ReadLines(@"C:\Users\PC\Desktop\matrix2.csv").Select(s => s.Split(",".ToCharArray())).ToArray().ToArray();
            // textBox1.AppendText("stringOne : " + numTwo[1][0]);

            if (fileMatrixTwo.RowCount == fileMatrixOne.RowCount && fileMatrixOne.ColumnCount == fileMatrixTwo.ColumnCount)
            {
                //TASK ONE
                textBox1.AppendText("\n");
                textBox1.AppendText("\nTASK ONE");
                Matrix<double> resultSum = DelimitedReader.Read<double>(fileTwo, false, ",", false);
                resultSum.Add(fileMatrixOne, resultSum);
                textBox1.AppendText("\n");
                textBox1.AppendText("Sumation:");
                textBox1.AppendText(resultSum.ToString("F2"));
                double[,] resultArray = new double[resultSum.RowCount, resultSum.ColumnCount];
                //textBox1.AppendText(resultArray[1,1].ToString("F2"));
                bool antisymmetrical = true;
                // antisymmetrical matrix
                if (fileMatrixOne.RowCount == fileMatrixOne.ColumnCount && fileMatrixTwo.RowCount == fileMatrixTwo.ColumnCount)
                {
                    for (int i = 0; i < resultSum.ColumnCount; i++)
                    {
                        for (int j = 0; j < resultSum.RowCount; j++)
                        {
                            if (j != i)
                            {
                                //textBox1.AppendText("Symmetrical\n");
                                antisymmetrical = resultSum[j, i] != resultSum[i, j] ? true : false;
                                if (!antisymmetrical)
                                {
                                    textBox1.AppendText("\n");
                                    textBox1.AppendText("\nAntiSymmetrical:\n");
                                    textBox1.AppendText("false\n");
                                    i = resultSum.ColumnCount;
                                    j = resultSum.RowCount;
                                }
                            }
                        }
                    }
                    if (antisymmetrical)
                    {
                        textBox1.AppendText("\n");
                        textBox1.AppendText("\nAntiSymmetrical: \n");
                        textBox1.AppendText("true\n");
                    }

                }
                else
                {
                    textBox1.AppendText("\n");
                    textBox1.AppendText("\nAntiSymmetrical: \n");
                    textBox1.AppendText("false\n");
                }

                //TASK TWO
                textBox1.AppendText("\n");
                textBox1.AppendText("\nTASK TWO");
                Matrix<double> resultMul = DelimitedReader.Read<double>(fileTwo, false, ",", false);
                resultMul.Multiply(fileMatrixOne, resultMul);
                textBox1.AppendText("\n");
                textBox1.AppendText("Multiplication");
                textBox1.AppendText(resultSum.ToString("F2"));
                //double[,] resultArray = new double[resultMul.RowCount, resultMul.ColumnCount];
                //textBox1.AppendText(resultArray[1,1].ToString("F2"));
                bool symmetrical = true;
                // antisymmetrical matrix
                if (fileMatrixOne.RowCount == fileMatrixOne.ColumnCount && fileMatrixTwo.RowCount == fileMatrixTwo.ColumnCount)
                {
                    for (int i = 0; i < resultSum.ColumnCount; i++)
                    {
                        for (int j = 0; j < resultSum.RowCount; j++)
                        {
                            if (j != i)
                            {
                                //textBox1.AppendText("Symmetrical\n");
                                symmetrical = resultSum[j, i] == resultSum[i, j] ? true : false;
                                if (!symmetrical)
                                {
                                    textBox1.AppendText("\n");
                                    textBox1.AppendText("\nSymmetrical:\n");
                                    textBox1.AppendText("false\n");
                                    i = resultSum.ColumnCount;
                                    j = resultSum.RowCount;
                                }
                            }
                        }
                    }
                    if (symmetrical)
                    {
                        textBox1.AppendText("\n");
                        textBox1.AppendText("\nSymmetrical: \n");
                        textBox1.AppendText("true\n");
                    }

                }
                else
                {
                    textBox1.AppendText("\n");
                    textBox1.AppendText("\nSymmetrical: \n");
                    textBox1.AppendText("false\n");
                }
            }
            else
            {
                textBox1.AppendText("\n");
                textBox1.AppendText("Undefined Matrices!");
            }

            //Matrix<Complex32> x = Matrix<Complex32>.Build.Dense(4, 4);
            //textBox1.AppendText(x.ToString("F2"));


            //Matrix<Complex32> y = Matrix<Complex32>.Build.Dense(4, 4, (i, j) => new Complex32(1.0f, 1.0f));

            //textBox1.AppendText(y.ToString("F2"));

            //x = y;
            //y.CopyTo(x);
            //x.Add(new Complex32(10.0f, 0), x);

            //y.Multiply(new Complex32(2.0f, 0), n);
            //textBox1.AppendText(n.ToString("F2"));
            //textBox1.AppendText(x.ToString("F2"));
            //textBox1.AppendText(y.ToString("F2"));

            //textBox1.AppendText(y.Column(1).ToString("F2"));

            //Vector<Complex32> z = y.ColumnSums();
            //textBox1.AppendText(z.ToString("F2"));
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
