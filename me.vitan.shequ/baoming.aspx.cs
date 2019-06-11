using Mysqlserver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace me.vitan.shequ
{
    public partial class baoming : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Write("<script>alert(\"请登陆\");window.location.href=\"../login.aspx\";</script>");
            }
            else
            {
                hd.Text = Request.QueryString["hd"];
                string user = Session["username"].ToString();
                peo.Text = user;
                string email = Session["email"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlServerDataBase obj = new SqlServerDataBase();
            string sql = "insert into [baoming] ([dh],[who],[phone]) values('" + hd.Text + "','" + peo.Text + "','" + phone.Text + "')";
            if (obj.Insert(sql, null))
            {
                Response.Write("<script>alert('报名成功');window.location.href=\"/index.aspx\";</script>");
            }
            else
            {
                Response.Write("<script>alert('报名失败');window.location.href=\"/index.aspx\";</script>");
            }
        }
    }
}