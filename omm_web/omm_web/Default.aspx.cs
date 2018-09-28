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
    public partial class Default : System.Web.UI.Page
    {
        public string description, title, image;
        public DataTable dtBanner, dtNews, dtProducts;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
        }

        public void GetData() {
            String rootPath = Server.MapPath("~");
            String filePath = rootPath + "Files\\Data.xls";
            FileStream stream = File.Open(filePath, FileMode.Open, FileAccess.Read);

            //1. Reading from a binary Excel file ('97-2003 format; *.xls)
            IExcelDataReader excelReader = ExcelReaderFactory.CreateBinaryReader(stream);
            //...
            //2. Reading from a OpenXml Excel file (2007 format; *.xlsx)
            //IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);
            //...
            //3. DataSet - The result of each spreadsheet will be created in the result.Tables
            //DataSet result = excelReader.AsDataSet();
            //...
            //4. DataSet - Create column names from first row
            excelReader.IsFirstRowAsColumnNames = true;
            DataSet result = excelReader.AsDataSet();

            //5. Data Reader methods
            //while (excelReader.Read())
            //{
            //    excelReader.GetInt32(0).ToString();
            //    Console.WriteLine(excelReader.GetInt32(0).ToString());
            //}
            if (result.Tables.Count > 0)
            {
                dtBanner = result.Tables[0];
                rptrBanner.DataSource = dtBanner;
                rptrBanner.DataBind();

                DataTable dtNewsOrig = result.Tables[1];
                dtNews = dtNewsOrig.Clone();
                dtNews.Columns["Date"].DataType = typeof(DateTime);
                
                
                //dtNews.DefaultView.Sort = "Date DESC";

                foreach (DataRow dr in dtNewsOrig.Rows)
                {
                    dtNews.ImportRow(dr);
                }
                dtNews.AcceptChanges();


                DataView dvNews = dtNews.DefaultView;
                dvNews.Sort = "Date DESC";
                //dvNews.Table.AsEnumerable().Take(5);

                //for (int i = 0; i < 5; i++)
                //{
                //    dtNews.ImportRow(dvNews.r[i]);
                //}

                rptrNews.DataSource = dtNews;
                rptrNews.DataBind();

                dtProducts = result.Tables[2];
                rptrProducts.DataSource = dtProducts;
                rptrProducts.DataBind();
                // Do Something
            }
            //6. Free resources (IExcelDataReader is IDisposable)
            excelReader.Close();
        }


        //protected void lnkProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName.Equals("lnkProducts"))
        //    {
        //       // GetData();
        //        DataView dv = new DataView(dtProducts);

        //        //DataKey key = rptrProductsList.DataKeys[e.Item.DisplayIndex];
        //        title = (string)e.CommandArgument;
        //        dv.RowFilter = "Title = '" + title + "'";
        //        description = (string)dv[0]["Description"];
        //        image = (string)dv[0]["Image"];
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowPopup", "openModal();", true);
        //        // Use the ID here...
        //    }
        //}
    }
}