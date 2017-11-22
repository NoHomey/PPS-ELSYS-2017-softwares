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

namespace Matrix
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            /*
            // Read first file
            string fileOne = @"C:\Users\PC\Desktop\csvOne.txt";
            Matrix<Complex32> fileMatrixOne = DelimitedReader.Read<Complex32>(fileOne, false,",", false);
            textBox1.AppendText(fileMatrixOne.ToString("F2"));

            // Read second file
            string fileTwo = @"C:\Users\PC\Desktop\csvTwo.txt";
            Matrix<Complex32> fileMatrixTwo = DelimitedReader.Read<Complex32>(fileTwo, false, ",", false);
            textBox1.AppendText(fileMatrixTwo.ToString("F2"));
            */
            Matrix<Complex32> x = Matrix<Complex32>.Build.Dense(4, 4);
            textBox1.AppendText(x.ToString("F2"));
            

            Matrix<Complex32> y = Matrix<Complex32>.Build.Dense(4, 4, (i, j) => new Complex32(1.0f, 1.0f));

            //textBox1.AppendText(y.ToString("F2"));

            //x = y;
            y.CopyTo(x);
            x.Multiply(new Complex32(10.0f, 0), x);

            //y.Multiply(new Complex32(2.0f, 0), n);
            //textBox1.AppendText(n.ToString("F2"));
            textBox1.AppendText(x.ToString("F2"));
            textBox1.AppendText(y.ToString("F2"));

            //textBox1.AppendText(y.Column(1).ToString("F2"));

            Vector<Complex32> z = y.ColumnSums();
            textBox1.AppendText(z.ToString("F2"));
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
