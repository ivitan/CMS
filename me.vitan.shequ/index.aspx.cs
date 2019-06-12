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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string fileName = "hd.xlsx";
            string filePath = Server.MapPath("files/hd.xlsx");

            Response.Clear();
            Response.Buffer = true;

            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
            Response.ContentType = "application/unknow";
            Response.TransmitFile(filePath);
            Response.End();

        }
    }
}