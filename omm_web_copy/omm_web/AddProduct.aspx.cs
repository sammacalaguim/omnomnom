using Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MsExcel = Microsoft.Office.Interop.Excel;


namespace omm_web
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckFiles();
            if (!Page.IsPostBack) {                
                fldTitle.Text = "";
                fldDescription.Text = "";     
            }
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
                }
                catch (Exception ex)
                {
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

            System.IO.DirectoryInfo diProducts = new DirectoryInfo(Server.MapPath(@"~/Resources/img/prod-img/"));
            System.IO.DirectoryInfo diProductsMini = new DirectoryInfo(Server.MapPath(@"~/Resources/img/prod-mini-img/"));

            DataTable dtProducts = result.Tables[2];
            foreach (FileInfo file in diProducts.GetFiles())
            {
                int ctr = 0;           
                foreach (DataRow row in dtProducts.Rows)
                {
                    string fileName = "Resources/img/prod-img/" + file.Name;
                    string name = row["Image"].ToString();
                    if (fileName == row["Image"].ToString())
                    {
                        ctr = 1;
                    }
                }
                if (ctr == 0)
                {
                    file.Delete();
                }
            }

            //foreach (FileInfo file in diProductsMini.GetFiles())
            //{
            //    int ctr = 0;
            //    foreach (DataRow row in dtProducts.Rows)
            //    {
            //        string fileName = "Resources/img/prod-mini-img/" + file.Name;
            //        string name = row["Mini_Image"].ToString();
            //        if (fileName == row["Mini_Image"].ToString())
            //        {
            //            ctr = 1;
            //        }
            //    }
            //    if (ctr == 0)
            //    {
            //        file.Delete();
            //    }
            //}
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            MsExcel.Application oXL;
            MsExcel._Workbook mWorkBook;
            MsExcel.Sheets mWorkSheets;
            MsExcel._Worksheet mWSheet;
            object Missing = System.Reflection.Missing.Value;

                string path = Server.MapPath(@"~/Files/Data.xls");
                oXL = new Microsoft.Office.Interop.Excel.Application();
                oXL.Visible = false;
                oXL.DisplayAlerts = false;
                mWorkBook = oXL.Workbooks.Open(path, 0, false, 5, "", "", false, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "", true, false, 0, true, false, false);
                //Get all the sheets in the workbook
                mWorkSheets = mWorkBook.Worksheets;
                //Get the allready exists sheet
                mWSheet = (Microsoft.Office.Interop.Excel.Worksheet)mWorkSheets.get_Item("Products");
                Microsoft.Office.Interop.Excel.Range range = mWSheet.UsedRange;
                int colCount = range.Columns.Count;
                int rowCount = range.Rows.Count;

                mWSheet.Cells[rowCount + 1, 1] = (rowCount).ToString();
                mWSheet.Cells[rowCount + 1, 2] = fldTitle.Text;
                mWSheet.Cells[rowCount + 1, 3] = fldSubtitle.Text;
                mWSheet.Cells[rowCount + 1, 4] = fldDescription.Text;
                mWSheet.Cells[rowCount + 1, 5] = "Resources/img/prod-img/" + pictureFormControlFile.FileName;
                //mWSheet.Cells[rowCount + 1, 5] = "Resources/img/prod-mini-img/" + minipictureFormControlFile.FileName;                

                string fileName = Path.GetFileName(pictureFormControlFile.FileName);
                pictureFormControlFile.SaveAs(Server.MapPath(Path.Combine("~/Resources/img/prod-img/", fileName)));

                //string minifileName = Path.GetFileName(minipictureFormControlFile.FileName);
                //minipictureFormControlFile.SaveAs(Server.MapPath(Path.Combine("~/Resources/img/prod-mini-img/", minifileName)));


                mWorkBook.SaveAs(path, Microsoft.Office.Interop.Excel.XlFileFormat.xlWorkbookNormal,
                Missing, Missing, Missing, Missing, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlExclusive,
                Missing, Missing, Missing, Missing, Missing);
                mWorkBook.Close(Missing, Missing, Missing);
                mWSheet = null;
                mWorkBook = null;
                oXL.Quit();
                GC.WaitForPendingFinalizers();
                GC.Collect();
                GC.WaitForPendingFinalizers();
                GC.Collect();
            //}
        }
    }
}