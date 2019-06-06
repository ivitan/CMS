using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

namespace me.vitan.shequ
{
    public partial class healthUP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["name"] != null)
            {
                Label1.Text = "你要修改的是：" + Request.QueryString["name"];
            }
            else
            {
                Response.Write("<Script>alert('未选择要编辑的记录！')</script>");

            }
            if (!IsPostBack)
            {
                SqlServerDataBase obj = new SqlServerDataBase();
                string sql = "select * from health where id='" + Request.QueryString["id"].ToString() + "'";
                DataSet ds = obj.Select(sql, null);
                string pname = ds.Tables[0].Rows[0][6].ToString();
                Image1.ImageUrl = "/images/" + pname;

                string sql2 = "select * from photos";
                DataSet ds2 = obj.Select(sql2, null);
                int i = 0;
                for (i = 0; i < ds2.Tables[0].Rows.Count; i++)
                {
                    string pname2 = ds2.Tables[0].Rows[i][1].ToString();
                    ListItem _li = new ListItem
                    {
                        Value = pname2,
                        Text = pname2
                    };
                    photo.Items.Add(_li);
                }
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            bool fileIsValid = false;
            //如果确认了上传文件，则判断文件类型是否符合要求
            if (this.FileUpload1.HasFile)
            {
                //获取上传文件的后缀
                String fileExtension = System.IO.Path.GetExtension(this.FileUpload1.FileName).ToLower();
                String[] restrictExtension = { ".gif", ".jpg", ".bmp", ".png" };

                //判断文件类型是否符合要求
                for (int i = 0; i < restrictExtension.Length; i++)
                {
                    if (fileExtension == restrictExtension[i])
                    {
                        fileIsValid = true;

                    }

                }
                //如果文件类型符合要求,调用SaveAs方法实现上传,并显示相关信息
                if (fileIsValid == true)
                {
                    // this.Image1.ImageUrl ="~/images/"+ FileUpload1.FileName;
                    this.FileUpload1.SaveAs(Server.MapPath("/images/") + FileUpload1.FileName);
                    string pname = this.FileUpload1.PostedFile.FileName;
                    SqlServerDataBase obj = new SqlServerDataBase();
                    string sql = "insert into photos(pname) values ('" + pname + "')";
                    if (obj.Insert(sql, null))
                    {
                        obj.Insert(sql, null);
                        this.Label2.Text = "照片上传成功";
                    }
                }
                else
                {
                    this.Label2.Text = "只能够上传后缀为.gif,.jpg,.bmp,.png的文件";

                }

            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            name.Text = Request.QueryString["name"].ToString();
            string id = Request.QueryString["id"].ToString();
            string sexxuanze = DropDownList1.SelectedValue.ToString();
            string iphoto = photo.SelectedValue.ToString();
            SqlServerDataBase obj = new SqlServerDataBase();
            string sql = "update [health] set name='" + name.Text + "',sex='" + sexxuanze + "',age='" + age.Text + "',health='" + hea.Text + "',phone='" + phone.Text + "' ,img='" + iphoto + "' where id=" + id;
            if (obj.Insert(sql, null))
            {
                Response.Write("<script>alert('修改成功');window.location.href=\"health.aspx\";</script>");
            }
            else
            {
                Response.Write("<script>alert('修改失败'');window.location.href=\"healthUp.aspx\";</script>");
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlServerDataBase obj = new SqlServerDataBase();
            string uid = Request.QueryString["id"];
            string sql = "delete from [health] where id=" + uid;
            if (obj.Delete(sql, null))
            {
                Response.Write("<script>alert('删除成功'');window.location.href=\"health.aspx\";</script>");
            }
            else
            {
                Response.Write("<script>alert('删除失败'');window.location.href=\"health.aspx\";</script>");
            }
        }
    }
}