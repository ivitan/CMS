using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using Mysqlserver;

namespace me.vitan.shequ
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void send_Click(object sender, EventArgs e)
        {

            SqlServerDataBase obj = new SqlServerDataBase();
            string username = TBusername.Text;
            string email = TBemail.Text;
            string password = TBpassword.Text;
            string repassword = TBrepassword.Text;
            string phone = userPhone.Text;
            string sql = "select * from [user] where email='" + email + "'";
            DataSet ds = obj.Select(sql, null);
            if (ds == null || ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
            {
                if (password == repassword && email != "" && email != "")
                {
                    byte[] result = Encoding.Default.GetBytes(password);
                    MD5 md5 = new MD5CryptoServiceProvider();
                    byte[] output = md5.ComputeHash(result);
                    sql = "insert into [user] (username,phone,email,password,role) values('" + username + "','" + phone + "','" + email + "','" + BitConverter.ToString(output).Replace("-", "") + "','normal')";
                    if (obj.Insert(sql, null))
                    {
                        Response.Write("<script>alert('注册成功！')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('注册失败，请检查输入是否正确')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('注册失败，请检查输入是否正确')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('注册失败，请检查输入是否正确')</script>");
            }
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}