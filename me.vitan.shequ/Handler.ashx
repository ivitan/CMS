<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Text;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Web.SessionState;

public class Handler : IHttpHandler, IRequiresSessionState
{
    //处理程序默认方法，固定的,context上下文 
    public void ProcessRequest(HttpContext context)
    {
        string strValidCode;
        // 产生5位随机字符
        strValidCode = this.GetValidCode(5);
        //将字符串保存到Session中，以便需要时进行验证                                                 
        context.Session["ValidCode"] = strValidCode;
        //定义宽120像素，高30像素的数据定义的图像对象                                           
        Bitmap image = new Bitmap(120, 30);
        //绘制图片                                
        Graphics g = Graphics.FromImage(image);
        try
        {
            //生成随机对象
            Random random = new Random();
            //清除图片背景色                                                    
            g.Clear(Color.White);
            // 随机产生图片的背景噪线                                                        
            for (int i = 0; i < 25; i++)
            {
                int x1 = random.Next(image.Width);
                int x2 = random.Next(image.Width);
                int y1 = random.Next(image.Height);
                int y2 = random.Next(image.Height);
                g.DrawLine(new Pen(Color.Silver), x1, y1, x2, y2);
            }
            //设置图片字体风格
            Font font = new System.Drawing.Font("新宋体", 20, (System.Drawing.FontStyle.Bold));
            //设置画笔类型
            LinearGradientBrush brush = new LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 3, true);
            //绘制随机字符
            g.DrawString(strValidCode, font, brush, 5, 2);

            //绘制图片的前景噪点
            g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);
            //建立存储区为内存的流
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            //将图像对象储存为内存流        
            image.Save(ms, ImageFormat.Gif);
            //清除当前缓冲区流中的所有内容                                              
            context.Response.ClearContent();
            //设置输出流的MIME类型                            
            context.Response.ContentType = "image/Gif";
            //将内存流写入到输出流                                         
            context.Response.BinaryWrite(ms.ToArray());
        }
        finally
        {
            g.Dispose();
            image.Dispose();
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    private string GetValidCode(int num)
    {
        //定义要随机抽取的字符串
        string strRandomCode = "ABCD1EF2GH3IJ4KL5MN6P7QR8ST9UVWXYZ";
        //将定义的字符串转成字符数组                            
        char[] chastr = strRandomCode.ToCharArray();
        //定义StringBuilder对象用于存放验证码                                      
        StringBuilder sbValidCode = new StringBuilder();
        //随机函数，随机抽取字符                                        
        Random rd = new Random();
        for (int i = 0; i < num; i++)
        {
            //以strRandomCode的长度产生随机位置并截取该位置的字符添加到StringBuilder对象中
            sbValidCode.Append(strRandomCode.Substring(rd.Next(0, strRandomCode.Length), 1));
        }
        return sbValidCode.ToString();
    }
}