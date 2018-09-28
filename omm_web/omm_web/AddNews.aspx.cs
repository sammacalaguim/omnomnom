//using Excel = Microsoft.Office.Interop.Excel;
using Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MsExcel=Microsoft.Office.Interop.Excel;

namespace omm_web
{
    public partial class AddNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckFiles();
        }

        protected void dataDownloadFormControlFile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Files/Data.xls");
        }

        protected void dataUploadFormControlButton_Click(object sender, EventArgs e)
        {
            if (dataUploadFormControlFile.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(dataUploadFormControlFile.FileName);                 
                    if (File.Exists(Server.MapPath(Path.Combine("~/Files/", fileName))))
                    {
                        File.Delete(Server.MapPath(Path.Combine("~/Files/", fileName)));
                    }
                    dataUploadFormControlFile.SaveAs(Server.MapPath(Path.Combine("~/Files/", fileName)));
                    CheckFiles();
                } catch (Exception ex) {
                }
            }
        }

        public void CheckFiles()
        {          
            String filePath = Server.MapPath(@"~/Files/Data.xls");
            FileStream stream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            IExcelDataReader excelReader = ExcelReaderFactory.CreateBinaryReader(stream);
            excelReader.IsFirstRowAsColumnNames = true;
            DataSet result = excelReader.AsDataSet();

            System.IO.DirectoryInfo diNews = new DirectoryInfo(Server.MapPath(@"~/Resources/img/news-img/"));
            
            foreach (FileInfo file in diNews.GetFiles())
            {
                int ctr = 0;
                DataTable dtNews = result.Tables[1];
                foreach (DataRow row in dtNews.Rows)
                {
                    string fileName = "Resources/img/news-img/" + file.Name;
                    string name = row["Image"].ToString();
                    if (fileName == row["Image"].ToString()) {
                        ctr = 1;
                    }
                }
                if (ctr == 0)
                {
                    file.Delete();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            MsExcel.Application oXL;
            MsExcel._Workbook mWorkBook;
            MsExcel.Sheets mWorkSheets;
            MsExcel._Worksheet mWSheet;
            object Missing = System.Reflection.Missing.Value;
            if (pictureFormControlFile.PostedFile != null && pictureFormControlFile.PostedFile.FileName != "")
            {

                string path = Server.MapPath(@"~/Files/Data.xls");
                oXL = new Microsoft.Office.Interop.Excel.Application();
                oXL.Visible = false;
                oXL.DisplayAlerts = false;
                mWorkBook = oXL.Workbooks.Open(path, 0, false, 5, "", "", false, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "", true, false, 0, true, false, false);
                //Get all the sheets in the workbook
                mWorkSheets = mWorkBook.Worksheets;
                //Get the allready exists sheet
                mWSheet = (Microsoft.Office.Interop.Excel.Worksheet)mWorkSheets.get_Item("News");
                Microsoft.Office.Interop.Excel.Range range = mWSheet.UsedRange;
                int colCount = range.Columns.Count;
                int rowCount = range.Rows.Count;

                mWSheet.Cells[rowCount, 1] = (rowCount - 1).ToString();
                mWSheet.Cells[rowCount, 2] = this.fldTitle.Value;
                mWSheet.Cells[rowCount, 3] = "'" + DateTime.Now.ToString("MMMM dd, yyyy");
                mWSheet.Cells[rowCount, 4] = this.fldSummary.Value;                
                mWSheet.Cells[rowCount, 5] = "Resources/img/news-img/" + pictureFormControlFile.FileName;
                mWSheet.Cells[rowCount, 6] = this.fldSource.Value;

                string ext = System.IO.Path.GetExtension(pictureFormControlFile.FileName);
                if (ext != ".jpg" || ext != ".png" || ext != ".gif" || ext != ".jpeg")
                {
                    Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('Please choose only .jpg, .png and .gif image types!')", true);
                }
                

                string fileName = Path.GetFileName(pictureFormControlFile.FileName);
                pictureFormControlFile.SaveAs(Server.MapPath(Path.Combine("~/Resources/img/news-img/", fileName)));


                mWorkBook.SaveAs(path, Microsoft.Office.Interop.Excel.XlFileFormat.xlWorkbookNormal,
                Missing, Missing, Missing, Missing, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlExclusive,
                Missing, Missing, Missing,
                Missing, Missing);
                mWorkBook.Close(Missing, Missing, Missing);
                mWSheet = null;
                mWorkBook = null;
                oXL.Quit();
                GC.WaitForPendingFinalizers();
                GC.Collect();
                GC.WaitForPendingFinalizers();
                GC.Collect();
            }
            
        }
    }
}