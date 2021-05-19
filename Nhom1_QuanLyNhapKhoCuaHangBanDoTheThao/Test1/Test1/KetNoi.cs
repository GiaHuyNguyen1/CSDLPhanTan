using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Test1
{
    public class KetNoi
    {

        public SqlConnection connect = new SqlConnection("Data Source=DESKTOP-B1ALK3E;Initial Catalog=QLNHAPDOTHETHAO;User ID=sa;Password=sa2012");
        public SqlConnection connect1 = new SqlConnection("Data Source=DESKTOP-B1ALK3E\\CHINHANH1;Initial Catalog=QLNHAPDOTHETHAO;User ID=sa;Password=sa2012");
        public SqlConnection connect2 = new SqlConnection("Data Source=DESKTOP-B1ALK3E\\CHINHANH2;Initial Catalog=QLNHAPDOTHETHAO;User ID=sa;Password=sa2012");
        public SqlConnection cnn;
        public bool KTDN(ComboBox cb,string Acc,string MK)
        {
            try
            {
                if (cb.SelectedIndex==0)
                {
                    
                    connect1.Open();
                    string CauLenh = "DECLARE	@return_value int EXEC	@return_value = [dbo].[KTDN] @manv = N'" + Acc + "',@tennv = N'" + MK + "' SELECT	'Return Value' = @return_value";
                    SqlCommand cmd = new SqlCommand(CauLenh, connect1);
                    object value = cmd.ExecuteScalar();
                    connect1.Close();
                    int kq = int.Parse(value.ToString());
                    if (kq == 1)
                    {
                        
                        return true;
                        
                    }
                    else
                        return false;
                }
                else if (cb.SelectedIndex==1)
                {
                    
                    connect2.Open();
                    string CauLenh = "DECLARE	@return_value int EXEC	@return_value = [dbo].[KTDN] @manv = N'" + Acc + "',@tennv = N'" + MK + "' SELECT	'Return Value' = @return_value";
                    SqlCommand cmd = new SqlCommand(CauLenh, connect2);
                    object value = cmd.ExecuteScalar();
                    connect2.Close();
                    int kq = int.Parse(value.ToString());
                    if (kq == 1)
                    {
                        
                        return true;
                    }
                    else
                        return false;
                }
                else
                    return false;
            }
            catch { return false; }
        }
        public bool KTKC(ComboBox cb, string MANV)
        {
            try
            {
                if (cb.SelectedIndex == 0)
                {
                    connect1.Open();
                    string CauLenh = "DECLARE	@return_value int EXEC	@return_value = [dbo].[KTR_MANV] @manv = N'"+MANV+"' SELECT	'Return Value' = @return_value";
                    SqlCommand cmd = new SqlCommand(CauLenh, connect1);
                    object value = cmd.ExecuteScalar();
                    connect1.Close();
                    int kq = int.Parse(value.ToString());
                    if (kq == 1)
                    {

                        return false;

                    }
                    else
                    {
                        return true;
                    }
                        
                }
                else if (cb.SelectedIndex == 1)
                {

                    connect2.Open();
                    string CauLenh = "DECLARE	@return_value int EXEC	@return_value = [dbo].[KTR_MANV] @manv = N'" + MANV + "' SELECT	'Return Value' = @return_value";
                    SqlCommand cmd = new SqlCommand(CauLenh, connect2);
                    object value = cmd.ExecuteScalar();
                    connect2.Close();
                    int kq = int.Parse(value.ToString());
                    if (kq == 1)
                    {

                        return false;

                    }
                    else
                    {
                        return true;
                    }

                }
                else
                {
                    return false;
                }
            }
            catch { return false; }
        }







        

        public bool TaoTK(ComboBox cb,string acc,string mk,string username,string nhomquyen)
        {
            try
            {
                if (cb.SelectedIndex == 0)
                {
                    connect1.Open();
                    string CauLenh = "DECLARE	@return_value int EXEC	@return_value = [dbo].[sp_TaoTaiKhoan] @login = N'"+acc+"',@pass = N'"+mk+"',@username = N'"+username+"',@role = N'"+nhomquyen+"'SELECT	'Return Value' = @return_value";
                    SqlCommand cmd = new SqlCommand(CauLenh, connect1);
                    object value = cmd.ExecuteScalar();
                    connect1.Close();
                    int kq = int.Parse(value.ToString());
                    if (kq == 1)
                    {

                        return false;

                    }
                    else
                    {
                        return true;
                    }

                }
                else if (cb.SelectedIndex == 1)
                {

                    connect2.Open();
                    string CauLenh = "DECLARE	@return_value int EXEC	@return_value = [dbo].[sp_TaoTaiKhoan] @login = N'" + acc + "',@pass = N'" + mk + "',@username = N'" + username + "',@role = N'" + nhomquyen + "'SELECT	'Return Value' = @return_value";
                    SqlCommand cmd = new SqlCommand(CauLenh, connect2);
                    object value = cmd.ExecuteScalar();
                    connect2.Close();
                    int kq = int.Parse(value.ToString());
                    if (kq == 1)
                    {

                        return false;

                    }
                    else
                    {
                        return true;
                    }

                }
                else
                {
                    return false;
                }
            }
            catch { return false; }
        }
        string _TenMay;

        public string TenMay
        {
            get { return _TenMay; }
            set { _TenMay = value; }
        }
        string _TenSql;

        public string TenSql
        {
            get { return _TenSql; }
            set { _TenSql = value; }
        }
        string _Acc;

        public string Acc
        {
            get { return _Acc; }
            set { _Acc = value; }
        }
        string _Pass;

        public string Pass
        {
            get { return _Pass; }
            set { _Pass = value; }
        }
        
        public void KhoiTao()
        {
            cnn = new SqlConnection("Data Source=" + TenMay + ";Initial Catalog=QLNHAPDOTHETHAO;User ID=" + Acc + ";Password=" + Pass + "");
        }
        public bool KetNoiVao(string tm, string acc, string pass)
        {
            _TenMay = tm;
            _Acc = acc;
            _Pass = pass;
            KhoiTao();
            try
            {
                cnn.Open();
                cnn.Close();
                return true;
            }
            catch { return false; }
        }
        public void KhoiTaoCNN(string tm, string acc, string pass)
        {
            _TenMay = tm;
            _Acc = acc;
            _Pass = pass;
            KhoiTao();
 
        }
        public string ma="";
    }
}
