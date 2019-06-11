using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mysqlserver;

namespace me.vitan.shequ
{
    public partial class center : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
            {
                Response.Write("<script>alert(\"请登陆\");window.location.href=\"../login.aspx\";</script>");
            }
            string uid = Session["uid"].ToString();
            string sql = "select * from [user] where uid = " + uid;
            SqlServerDataBase obj = new SqlServerDataBase();
            DataSet ds = obj.Select(sql, null);
            if (ds != null || ds.Tables.Count != 0 || ds.Tables[0].Rows.Count != 0)
            {
                string username2 = ds.Tables[0].Rows[0][1].ToString();
                string email2 = ds.Tables[0].Rows[0][3].ToString();
                string role2 = ds.Tables[0].Rows[0][5].ToString();
                string register_time2 = ds.Tables[0].Rows[0][6].ToString();
                string img = ds.Tables[0].Rows[0][7].ToString();
                username.Text = username2;
                email.Text = email2;
                role.Text = role2;
                register_time.Text = register_time2;
                if (img == null || img == "")
                {
                    avatarImg.ImageUrl = "images/1.png";
                }
                else
                {
                    avatarImg.ImageUrl = img;
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string uid = Session["uid"].ToString();
            string pw = password.Text;
            byte[] result1 = Encoding.Default.GetBytes(pw);
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] output1 = md5.ComputeHash(result1);

            string npw = newPassword.Text;
            byte[] result2 = Encoding.Default.GetBytes(npw);
            byte[] output2 = md5.ComputeHash(result2);
            string sql = "update [user] set password='" + BitConverter.ToString(output2).Replace("-", "") + "' where uid = '" + uid + "' and password='" + BitConverter.ToString(output1).Replace("-", "") + "'";
            SqlServerDataBase obj = new SqlServerDataBase();
            if (obj.Update(sql, null))
            {
                Response.Write("<script>alert('修改密码成功');window.location.href=\"login.aspx\";</script>");
            }
            else
            {
                Response.Write("<script>alert('修改密码失败')</script>");
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string uid = Session["uid"].ToString();
            string name = Request.Form["username"];
            string sql = "update [user] set username='" + name + "' where uid = " + uid;
            SqlServerDataBase obj = new SqlServerDataBase();
            if (obj.Update(sql, null))
            {
                Response.Write("<script>alert('修改用户名成功');window.location.href=\"/manager/center.aspx.aspx\";</script>");
            }
            else
            {
                Response.Write("<script>alert('修改用户名失败')</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Boolean fileOk = false;
            if (pic_upload.HasFile)//验证是否包含文件
            {
                //取得文件的扩展名,并转换成小写
                string fileExtension = Path.GetExtension(pic_upload.FileName).ToLower();
                //验证上传文件是否图片格式
                fileOk = IsImage(fileExtension);

                if (fileOk)
                {
                    //对上传文件的大小进行检测，限定文件最大不超过4M
                    if (pic_upload.PostedFile.ContentLength < 4096000)
                    {
                        string filepath = "/images/";
                        if (Directory.Exists(Server.MapPath(filepath)) == false)//如果不存在就创建file文件夹
                        {
                            Directory.CreateDirectory(Server.MapPath(filepath));
                        }
                        string virpath = filepath + CreatePasswordHash(pic_upload.FileName, 4) + fileExtension;//这是存到服务器上的虚拟路径
                        string mappath = Server.MapPath(virpath);//转换成服务器上的物理路径
                        pic_upload.PostedFile.SaveAs(mappath);//保存图片

                        string uid = Session["uid"].ToString();
                        string sql = "update [user] set img='" + virpath + "' where uid =" + uid;
                        SqlServerDataBase obj = new SqlServerDataBase();
                        if (obj.Update(sql, null))
                        {
                            Response.Write("<script>alert('修改头像成功');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('修改头像失败')</script>");
                        }
                        //显示图片
                        pic.ImageUrl = virpath;
                        //清空提示
                        lbl_pic.Text = "";
                    }
                    else
                    {
                        pic.ImageUrl = "";
                        lbl_pic.Text = "文件大小超出4M！请重新选择！";
                    }
                }
                else
                {
                    pic.ImageUrl = "";
                    lbl_pic.Text = "要上传的文件类型不对！请重新选择！";
                }
            }
            else
            {
                pic.ImageUrl = "";
                lbl_pic.Text = "请选择要上传的图片！";
            }
        }


        /// <summary>
        /// 验证是否指定的图片格式
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public bool IsImage(string str)
        {
            bool isimage = false;
            string thestr = str.ToLower();
            //限定只能上传jpg和gif图片
            string[] allowExtension = { ".jpg", ".gif", ".bmp", ".png" };
            //对上传的文件的类型进行一个个匹对
            for (int i = 0; i < allowExtension.Length; i++)
            {
                if (thestr == allowExtension[i])
                {
                    isimage = true;
                    break;
                }
            }
            return isimage;
        }

        /// <summary>
        /// 创建一个指定长度的随机salt值
        /// </summary>
        public string CreateSalt(int saltLenght)
        {
            //生成一个加密的随机数
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] buff = new byte[saltLenght];
            rng.GetBytes(buff);
            //返回一个Base64随机数的字符串
            return Convert.ToBase64String(buff);
        }


        /// <summary>
        /// 返回加密后的字符串
        /// </summary>
        public string CreatePasswordHash(string pwd, int saltLenght)
        {
            string strSalt = CreateSalt(saltLenght);
            //把密码和Salt连起来
            string saltAndPwd = String.Concat(pwd, strSalt);
            //对密码进行哈希
            string hashenPwd = FormsAuthentication.HashPasswordForStoringInConfigFile(saltAndPwd, "sha1");
            //转为小写字符并截取前16个字符串
            hashenPwd = hashenPwd.ToLower().Substring(0, 16);
            //返回哈希后的值
            return hashenPwd;
        }
    }
}