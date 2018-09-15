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
    public partial class Products : System.Web.UI.Page
    {
        public DataTable dtProducts;
        public string title, description, image;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
        }

        public void GetData()
        {
            String rootPath = Server.MapPath("~");
            String filePath = rootPath + "Files\\Data.xls";
            FileStream stream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            IExcelDataReader excelReader = ExcelReaderFactory.CreateBinaryReader(stream);
            excelReader.IsFirstRowAsColumnNames = true;
            DataSet result = excelReader.AsDataSet();
            if (result.Tables.Count > 0)
            {
                dtProducts = result.Tables[2];
                rptrProducts.DataSource = dtProducts;
                rptrProducts.DataBind();
            }
            excelReader.Close();
        }              
    }
}