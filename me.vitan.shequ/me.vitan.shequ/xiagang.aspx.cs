using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;


namespace me.vitan.shequ
{
    public partial class xiagang : System.Web.UI.Page
    {
        protected static PagedDataSource ps = new PagedDataSource();//创建一个分页数据源的对象且一定要声明为静态
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dataBindToDataList();
            }

        }

        private void dataBindToDataList()
        {
            //实例化SqlConnection对象
            SqlConnection sqlCon = new SqlConnection();
            //实例化SqlConnection对象连接数据库的字符串
            sqlCon.ConnectionString = "server = VITAN\\VITAN; uid = sa; pwd = 123456; database = community";
            //定义SQL语句
            string SqlStr = "select * from xiagang left join peixun on xiagang.[姓名] = peixun.[姓名]";
            //实例化SqlDataAdapter对象
            SqlDataAdapter da = new SqlDataAdapter(SqlStr, sqlCon);
            //实例化数据集DataSet
            DataSet ds = new DataSet();
            da.Fill(ds, "序号");

            ps.DataSource = ds.Tables["序号"].DefaultView;

            this.DataList1.DataSource = ps;
            this.DataList1.DataKeyField = "序号";
            this.DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            dataBindToDataList();
        }
        
        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)// e表示DataList传递给该函数的信息。
        {
            DataList1.EditItemIndex = e.Item.ItemIndex;//e.Item表示DataList中发生事件的那一项
            dataBindToDataList();

        }

        protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)// e表示DataList传递给该函数的信息。
        {
            DataList1.EditItemIndex = -1;  //当EditItemIndex属性值为-1时，表示不显示EditItemTemplate模板
            dataBindToDataList();
        }

        protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            SqlServerDataBase obj = new SqlServerDataBase();
            string Id = DataList1.DataKeys[e.Item.ItemIndex].ToString();
            string xm = ((TextBox)e.Item.FindControl("TextBox1")).Text;
            string xb = ((TextBox)e.Item.FindControl("TextBox2")).Text;
            string cs = ((TextBox)e.Item.FindControl("TextBox3")).Text;
            string jg = ((TextBox)e.Item.FindControl("TextBox4")).Text;
            string xl = ((TextBox)e.Item.FindControl("TextBox5")).Text;
            string bzj = ((TextBox)e.Item.FindControl("TextBox6")).Text;
            string pxjl = ((TextBox)e.Item.FindControl("TextBox7")).Text;
            string hy = ((TextBox)e.Item.FindControl("TextBox8")).Text;
            string zz = ((TextBox)e.Item.FindControl("TextBox9")).Text;
            string jk = ((TextBox)e.Item.FindControl("TextBox10")).Text;
            string dh = ((TextBox)e.Item.FindControl("TextBox11")).Text;
            string yx = ((TextBox)e.Item.FindControl("TextBox12")).Text;
            string sql = "update [xiagang] set [姓名]='" + xm + "',[性别]='" + xb + "',[出生年月]='" + cs + "',[籍贯]='" + jg + "',[保障金]='" + bzj+ "',[学历]='" + xl + "' ,[婚姻状况]='" + hy + "',[政治面貌]='" + zz + "',[健康状况]='" + jk + "',[联系电话]='" + dh + "',[邮箱]='" + yx + "' where [序号]=" + Id;
            if (obj.Update(sql, null))
            {
                Response.Write("<script>alert('修改成功');window.location.href=\"xiagang.aspx\";</script>");
            }
            else
            {
                Response.Write("<script>alert('修改失败');window.location.href=\"xiagang.aspx\";</script>");
            }
            DataList1.EditItemIndex = -1;
            dataBindToDataList();
        }
        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            string ID = DataList1.DataKeys[e.Item.ItemIndex].ToString();
            SqlServerDataBase obj = new SqlServerDataBase();
            string sql = "delete from xiagang where [序号]='" + ID + "'";
            if (obj.Update(sql, null))
            {
                Response.Write("<script>alert('删除成功');window.location.href=\"xiagang.aspx\";</script>");
            }
            else
            {
                Response.Write("<script>alert('删除失败');window.location.href=\"xiagang.aspx\";</script>");
            }
            DataList1.EditItemIndex = -1;
            dataBindToDataList();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlServerDataBase obj = new SqlServerDataBase();
            string sql = "insert into [xiagang] ([姓名],[性别],[出生年月],[籍贯],[学历],[婚姻状况],[政治面貌],[健康状况],[联系电话],[邮箱]) values('" + xm.Text + "','" + xb.Text + "','" + cs.Text + "','" + jg.Text + "','" + xl.Text + "','" + hy.Text + "','" + zz.Text + "','" + jk.Text + "','" + dh.Text + "','" + yx.Text + "')";
            if (obj.Insert(sql, null))
            {
                Response.Write("<script>alert('增加成功');window.location.href=\"xiagang.aspx\";</script>");
            }
            else
            {
                Response.Write("<script>alert('增加失败');window.location.href=\"xiagang.aspx\";</script>");
            }
        }
    }
}