using Mysqlserver;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace me.vitan.shequ
{
    public partial class jumin : System.Web.UI.Page
    {
        protected static PagedDataSource ps = new PagedDataSource();//创建一个分页数据源的对象且一定要声明为静态
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
            {
                Response.Write("<script>alert(\"请登陆\");window.location.href=\"../login.aspx\";</script>");
            }
            else if (Session["role"].ToString() != "manager")
            {
                Response.Write("<script>alert(\"您不是管理员\");window.location.href=\"../index.aspx\";</script>");
            }
            else
            {
                if (!IsPostBack)
                {

                    Bind(0);//数据绑定
                }
            }

        }
        //进行数据绑定的方法
        public void Bind(int CurrentPage)
        {
            //实例化SqlConnection对象
            SqlConnection sqlCon = new SqlConnection();
            //实例化SqlConnection对象连接数据库的字符串
            sqlCon.ConnectionString = "server = VITAN\\VITAN; uid = sa; pwd = 123456; database = community";
            //定义SQL语句
            string SqlStr = "select * from jumin";
            //实例化SqlDataAdapter对象
            SqlDataAdapter da = new SqlDataAdapter(SqlStr, sqlCon);
            //实例化数据集DataSet
            DataSet ds = new DataSet();
            da.Fill(ds, "序号");

            ps.DataSource = ds.Tables["序号"].DefaultView;
            ps.AllowPaging = true; //是否可以分页
            ps.PageSize = 6; //显示的数量
            ps.CurrentPageIndex = CurrentPage; //取得当前页的页码

            this.DataList1.DataSource = ps;
            this.DataList1.DataKeyField = "序号";
            this.DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                //以下5个为 捕获用户点击 上一页 下一页等时发生的事件
                case "first"://第一页
                    ps.CurrentPageIndex = 0;
                    Bind(ps.CurrentPageIndex);
                    break;
                case "pre"://上一页
                    ps.CurrentPageIndex = ps.CurrentPageIndex - 1;
                    Bind(ps.CurrentPageIndex);
                    break;
                case "next"://下一页
                    ps.CurrentPageIndex = ps.CurrentPageIndex + 1;
                    Bind(ps.CurrentPageIndex);
                    break;
                case "last"://最后一页
                    ps.CurrentPageIndex = ps.PageCount - 1;
                    Bind(ps.CurrentPageIndex);
                    break;
                case "search"://页面跳转页
                    if (e.Item.ItemType == ListItemType.Footer)
                    {
                        int PageCount = int.Parse(ps.PageCount.ToString());
                        TextBox txtPage = e.Item.FindControl("txtPage") as TextBox;
                        int MyPageNum = 0;
                        if (!txtPage.Text.Equals(""))
                            MyPageNum = Convert.ToInt32(txtPage.Text.ToString());
                        if (MyPageNum <= 0 || MyPageNum > PageCount)
                            Response.Write("<script>alert('请输入页数并确定没有超出总页数！')</script>");
                        else
                            Bind(MyPageNum - 1);
                    }
                    break;
            }
        }
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                //以下六个为得到脚模板中的控件,并创建变量
                Label CurrentPage = e.Item.FindControl("labNowPage") as Label;
                Label PageCount = e.Item.FindControl("labCount") as Label;
                LinkButton FirstPage = e.Item.FindControl("lnkbtnFirst") as LinkButton;
                LinkButton PrePage = e.Item.FindControl("lnkbtnFront") as LinkButton;
                LinkButton NextPage = e.Item.FindControl("lnkbtnNext") as LinkButton;
                LinkButton LastPage = e.Item.FindControl("lnkbtnLast") as LinkButton;
                CurrentPage.Text = (ps.CurrentPageIndex + 1).ToString();//绑定显示当前页
                PageCount.Text = ps.PageCount.ToString();//绑定显示总页数
                if (ps.IsFirstPage)//如果是第一页,首页和上一页不能用
                {
                    FirstPage.Enabled = false;
                    PrePage.Enabled = false;
                }
                if (ps.IsLastPage)//如果是最后一页"下一页"和"尾页"按钮不能用
                {
                    NextPage.Enabled = false;
                    LastPage.Enabled = false;
                }
            }
        }

        private void dataBindToDataList()
        {
            //实例化SqlConnection对象
            SqlConnection sqlCon = new SqlConnection();
            //实例化SqlConnection对象连接数据库的字符串
            sqlCon.ConnectionString = "server = VITAN\\VITAN; uid = sa; pwd = 123456; database = community";
            //定义SQL语句
            string SqlStr = "select * from jumin";
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
            string sfz = ((TextBox)e.Item.FindControl("TextBox3")).Text;
            string lx = ((TextBox)e.Item.FindControl("TextBox4")).Text;
            string zz = ((TextBox)e.Item.FindControl("TextBox5")).Text;
            string qy = ((TextBox)e.Item.FindControl("TextBox6")).Text;
            string pk = ((TextBox)e.Item.FindControl("TextBox7")).Text;
            string nl = ((TextBox)e.Item.FindControl("TextBox8")).Text;
            string sql = "update [jumin] set [姓名]='" + xm + "',[性别]='" + xb + "',[身份证号码]='" + sfz + "',[联系方式]='" + lx + "',[家庭住址]='" + zz + "' ,[是否签约]='" + qy + "',[是否贫困]='" + pk + "' ,[年龄]='" + nl+ "' where [序号]=" + Id;
            if (obj.Update(sql, null))
            {
                Response.Write("<script>alert('修改成功');window.location.href=\"jumin.aspx\";</script>");
            }
            else
            {
                Response.Write("<script>alert('修改失败');window.location.href=\"jumin.aspx\";</script>");
            }
            DataList1.EditItemIndex = -1;
            dataBindToDataList();
        }
        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            string ID = DataList1.DataKeys[e.Item.ItemIndex].ToString();
            SqlServerDataBase obj = new SqlServerDataBase();
            string sql = "delete from jumin where [序号]='" + ID + "'";
            if (obj.Update(sql, null))
            {
                Response.Write("<script>alert('删除成功');window.location.href=\"jumin.aspx\";</script>");
            }
            else
            {
                Response.Write("<script>alert('删除失败');window.location.href=\"jumin.aspx\";</script>");
            }
            DataList1.EditItemIndex = -1;
            dataBindToDataList();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlServerDataBase obj = new SqlServerDataBase();
            string sql = "insert into [jumin] ([姓名],[性别],[年龄],[身份证号码],[联系方式],[家庭住址],[是否签约],[是否贫困]) values('" + xm.Text + "','" + xb.Text + "','" + nl.Text + "','" + sf.Text + "','" + lx.Text + "','" + zz.Text + "','" + qy.Text + "','" + pk.Text + "')";
            if (obj.Insert(sql, null))
            {
                Response.Write("<script>alert('增加成功');window.location.href=\"jumin.aspx\";</script>");
            }
            else
            {
                Response.Write("<script>alert('增加失败');window.location.href=\"jumin.aspx\";</script>");
            }
        }
    }
}