using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Test1
{
    public partial class DangNhap : Form
    {
        
        KetNoi kn = new KetNoi();
        
        public DangNhap()
        {
            
            InitializeComponent();
            Load();
        }

        private void DangNhap_Load(object sender, EventArgs e)
        {

            

        }
        public void Load()
        {
            DataSet ds = new DataSet();
            string CauLenh = "SELECT * FROM CHINHANH";
            SqlDataAdapter da = new SqlDataAdapter(CauLenh, kn.connect);
            da.Fill(ds,"CHINHANH");
            comboBox1.DataSource = ds.Tables[0];
            comboBox1.DisplayMember = "TENCN";
            comboBox1.ValueMember = "MACN";
        }
        public void DangNhapChiNhanh()
        {
 
        }
        
        
        private void button1_Click(object sender, EventArgs e)
        {
            
            string sql1 = "DESKTOP-B1ALK3E\\CHINHANH1";
            string sql2 = "DESKTOP-B1ALK3E\\CHINHANH2";
            if (comboBox1.SelectedValue.ToString().Trim() == "CN01")
            {
                if (kn.KetNoiVao(sql1, textBox1.Text, textBox2.Text))
                {
                    SqlConnection a = new SqlConnection("Data Source=" + sql1 + ";Initial Catalog=QLNHAPDOTHETHAO;User ID=" + textBox1.Text.Trim() + ";Password=" + textBox2.Text.Trim() + "");

                    TrangChu tc = new TrangChu(comboBox1.SelectedValue.ToString(),a);
                    
                    MessageBox.Show("Thành công");
                    tc.Show();
                }
                else 
                {
                    MessageBox.Show("that bai");
                }
            }
            else if (comboBox1.SelectedValue.ToString().Trim()== "CN02")
            {
                if (kn.KetNoiVao(sql2, textBox1.Text, textBox2.Text))
                {
                    SqlConnection a = new SqlConnection("Data Source=" + sql2 + ";Initial Catalog=QLNHAPDOTHETHAO;User ID=" + textBox1.Text.Trim() + ";Password=" + textBox2.Text.Trim() + "");

                    TrangChu tc = new TrangChu(comboBox1.SelectedValue.ToString(),a);
                    MessageBox.Show("Thành công");
                    tc.Show();
                }
                else
                {
                    MessageBox.Show("that bai");
                }
            }
            else
                MessageBox.Show("Thất bại");
            

        }
        
        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

            kn.ma = comboBox1.SelectedValue.ToString();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (kn.TaoTK(comboBox1, textBox1.Text, textBox2.Text, textBox4.Text, comboBox2.Text))
            {
                MessageBox.Show("Thành công");
            }
            else
            { MessageBox.Show("Thất bại"); }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            comboBox2.Enabled = true;
            textBox4.Enabled = true;
            button2.Enabled = true;
        }

    }
}
