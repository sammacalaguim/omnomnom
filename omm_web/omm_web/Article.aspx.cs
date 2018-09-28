using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Excel;
using System.Data;

namespace omm_web
{
    public partial class Article : System.Web.UI.Page
    {
        public string date, title, description, id, image_path, source;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"];
            GetData();
        }

        public void GetData()
        {
            String rootPath = Server.MapPath("~");
            String filePath = rootPath + "Files\\Data.xls";
            DataTable dtNews = new DataTable();
            FileStream stream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            IExcelDataReader excelReader = ExcelReaderFactory.CreateBinaryReader(stream);
            excelReader.IsFirstRowAsColumnNames = true;
            DataSet result = excelReader.AsDataSet();
            if (result.Tables.Count > 0)
            {
                dtNews = result.Tables[1];                
            }
            excelReader.Close();

            DataView dv = new DataView(dtNews);
            dv.RowFilter = "ID = '" + id + "'";
            description = (string)dv[0]["Description"];
            date = (string)dv[0]["Date"];
            title = (string)dv[0]["Title"];
            image_path = (string)dv[0]["Image"];
            source = (string)dv[0]["Source"];
        }
    }
}