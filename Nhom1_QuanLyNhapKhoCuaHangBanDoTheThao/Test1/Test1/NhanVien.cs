using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Test1
{

    public class NhanVien
    {
        KetNoi kn = new KetNoi();

        SqlConnection a;
        
        
        
        //public bool Them(TextBox manv, TextBox tennv, TextBox diachi, TextBox SDT, ComboBox macn)
        //{
        //    try
        //    {
        //        if (macn.SelectedValue.ToString().Trim() == "CN01")
        //        {
        //            if (kn.KTKC(macn, manv.Text) == true)
        //            {
        //                kn.connect1.Open();
        //                string CauLenh = "INSERT INTO NHANVIEN(MANV,TENNV,DIACHI,SDT,MACN) VALUES ('" + manv.Text.Trim() + "','" + tennv.Text.Trim() + "','" + diachi.Text.Trim() + "','" + SDT.Text.Trim() + "','CN01')";
        //                SqlCommand cmd = new SqlCommand(CauLenh, kn.connect1);
        //                cmd.ExecuteNonQuery();
        //                kn.connect1.Close();
        //                return true;
        //            }
        //            else
        //            {
        //                return false;
        //            }
        //        }
        //        else if (macn.SelectedValue.ToString().Trim() == "CN02")
        //        {
        //            if (kn.KTKC(macn, manv.Text) == true)
        //            {
        //                kn.connect2.Open();
        //                string CauLenh = "INSERT INTO NHANVIEN(MANV,TENNV,DIACHI,SDT,MACN) VALUES ('" + manv.Text.Trim() + "','" + tennv.Text.Trim() + "','" + diachi.Text.Trim() + "','" + SDT.Text.Trim() + "','CN02')";
        //                SqlCommand cmd = new SqlCommand(CauLenh, kn.connect2);
        //                cmd.ExecuteNonQuery();
        //                kn.connect2.Close();
        //                return true;
        //            }
        //            else
        //                return false;
        //        }

        //        return false;
        //    }
        //    catch
        //    {
        //        return false;
        //    }

        //}

        public bool Them(TextBox manv, TextBox tennv, TextBox diachi, TextBox SDT, ComboBox macn)
        {
            try
            {
                a.Open();
                string CauLenh = "INSERT INTO NHANVIEN(MANV,TENNV,DIACHI,SDT,MACN) VALUES ('" + manv.Text.Trim() + "','" + tennv.Text.Trim() + "','" + diachi.Text.Trim() + "','" + SDT.Text.Trim() + "','CN01')";
                SqlCommand cmd = new SqlCommand(CauLenh, a);
                cmd.ExecuteNonQuery();
                a.Close();
                return true;
            }
            catch
            {
                return false;
            }

        }
        //public bool Xoa(ComboBox macn, TextBox manv)
        //{
        //    try
        //    {
        //        if (macn.SelectedValue.ToString().Trim() == "CN01")
        //        {
        //            kn.connect1.Open();
        //            string CauLenh = "DELETE FROM NHANVIEN WHERE MANV='" + manv.Text + "'";
        //            SqlCommand cmd1 = new SqlCommand(CauLenh, kn.connect1);
        //            cmd1.ExecuteNonQuery();
        //            kn.connect1.Close();
        //            return true;
        //        }
        //        else if (macn.SelectedValue.ToString().Trim() == "CN02")
        //        {
        //            kn.connect2.Open();
        //            string CauLenh = "DELETE FROM NHANVIEN WHERE MANV='" + manv.Text + "'";
        //            SqlCommand cmd = new SqlCommand(CauLenh, kn.connect2);
        //            cmd.ExecuteNonQuery();
        //            kn.connect2.Close();
        //            return true;
        //        }
        //        return false;

        //    }
        //    catch
        //    {
        //        return false;
        //    }

        //}
        public bool Xoa(ComboBox macn, TextBox manv)
        {
            try
            {
                kn.cnn.Open();
                string CauLenh = "DELETE FROM NHANVIEN WHERE MANV='" + manv.Text + "'";
                SqlCommand cmd1 = new SqlCommand(CauLenh, kn.cnn);
                cmd1.ExecuteNonQuery();
                kn.cnn.Close();
                return true;

            }
            catch
            {
                return false;
            }

        }
        //public bool Sua(TextBox manv, TextBox tennv, TextBox diachi, TextBox SDT, ComboBox macn,string ma)
        //{
        //    try
        //    {
        //        if (macn.SelectedValue.ToString().Trim() == "CN01")
        //        {
        //            if (kn.KTKC(macn, manv.Text) == true)
        //            {
        //                kn.connect1.Open();
        //                string CauLenh = "UPDATE NHANVIEN SET TENNV='" + tennv.Text + "',DIACHI='" + diachi.Text + "',SDT='" + SDT.Text + "' WHERE MANV='" + ma + "'";
        //                SqlCommand cmd = new SqlCommand(CauLenh, kn.connect1);
        //                cmd.ExecuteNonQuery();
        //                kn.connect1.Close();

        //                return true;
        //            }
        //            else
        //            {
        //                return false;
        //            }
        //        }
        //        else if (macn.SelectedValue.ToString().Trim() == "CN02")
        //        {
        //            if (kn.KTKC(macn, manv.Text) == true)
        //            {
        //                kn.connect2.Open();
        //                string CauLenh = "UPDATE NHANVIEN SET TENNV='" + tennv.Text + "',DIACHI='" + diachi.Text + "',SDT='" + SDT.Text + "' WHERE MANV='" + ma + "'";
        //                SqlCommand cmd = new SqlCommand(CauLenh, kn.connect2);
        //                cmd.ExecuteNonQuery();
        //                kn.connect2.Close();

        //                return true;
        //            }
        //            else
        //                return false;
        //        }

        //        return false;
        //    }
        //    catch { return false; }
        //}

        public bool Sua(TextBox manv, TextBox tennv, TextBox diachi, TextBox SDT, ComboBox macn, string ma)
        {
            try
            {
                kn.cnn.Open();
                string CauLenh = "UPDATE NHANVIEN SET TENNV='" + tennv.Text + "',DIACHI='" + diachi.Text + "',SDT='" + SDT.Text + "' WHERE MANV='" + ma + "'";
                SqlCommand cmd = new SqlCommand(CauLenh, kn.cnn);
                cmd.ExecuteNonQuery();
                kn.cnn.Close();

                return true;
            }
            catch { return false; }
        }
    }
}
