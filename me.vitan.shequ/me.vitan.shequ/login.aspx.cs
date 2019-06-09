using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

namespace me.vitan.shequ
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            SqlServerDataBase obj = new SqlServerDataBase();
            string mail = email.Text;
            string password = pw.Text;
            byte[] result = Encoding.Default.GetBytes(password);
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] output = md5.ComputeHash(result);
            string sql = "select * from [user] where email='" + mail + "' and password='" + BitConverter.ToString(output).Replace("-", "") + "'";
            DataSet ds = obj.Select(sql, null);
            if (ds == null || ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
            {
                Response.Write("<script>alert('该用户不存在')</script>");
            }
            else
            {
                string uid = ds.Tables[0].Rows[0][0].ToString();
                string username = ds.Tables[0].Rows[0][1].ToString();
                mail = ds.Tables[0].Rows[0][3].ToString();
                password = ds.Tables[0].Rows[0][4].ToString();
                string role = ds.Tables[0].Rows[0][5].ToString();
                Session["username"] = username;
                Session["uid"] = uid;
                Session["email"] = mail;
                Session["password"] = password;
                Session["role"] = role;
                if (role == "manager")
                {
                    Response.Write("<script>alert('登录成功');window.location.href=\"health.aspx\";</script>");
                }
                else if (role == "operator")
                {
                    Response.Write("<script>alert('登录成功');window.location.href=\"index.aspx\";</script>");
                }
                else if (role == "normal")
                {
                    Response.Write("<script>alert('登录成功');window.location.href=\"index.aspx\";</script>");
                }

            }
        }
    }
}