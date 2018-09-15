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
    public partial class News : System.Web.UI.Page
    {
        public DataTable dtNews;
        PagedDataSource pgsource = new PagedDataSource();
        int findex, lindex;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindDataList();
            }       
        }

        DataTable GetData()
        {
            String rootPath = Server.MapPath("~");
            String filePath = rootPath + "Files\\Data.xls";
            FileStream stream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            IExcelDataReader excelReader = ExcelReaderFactory.CreateBinaryReader(stream);
            excelReader.IsFirstRowAsColumnNames = true;
            DataSet result = excelReader.AsDataSet();
            if (result.Tables.Count > 0)
            {
                dtNews = result.Tables[1];
                rptrNews.DataSource = dtNews;
                rptrNews.DataBind();
            }
            excelReader.Close();
            return dtNews;
        }

        private void BindDataList()
        {
            //Create new DataTable dt
            DataTable dt = GetData();

            pgsource.DataSource = dt.DefaultView;

            //Set PageDataSource paging 
            pgsource.AllowPaging = true;

            //Set number of items to be displayed in the Repeater using drop down list

            pgsource.PageSize = 6;


            //Get Current Page Index
            pgsource.CurrentPageIndex = CurrentPage;

            //Store it Total pages value in View state
            ViewState["totpage"] = pgsource.PageCount;

            //if (pgsource.PageCount == 1)
            //{
            //    lnknxt.Attributes.Add("class", "next disabled");
            //    lnkprv.Attributes.Add("class", "previous disabled");
            //}
            ////Below line is used to show page number based on selection like "Page 1 of 20"
            ////lblpage.Text = "Page " + (CurrentPage + 1) + " of " + pgsource.PageCount;

            ////Enabled true Link button previous when current page is not equal first page 
            ////Enabled false Link button previous when current page is first page
            //lnkPrevious.Enabled = !pgsource.IsFirstPage;
            //if (!pgsource.IsFirstPage)
            //{
            //    lnknxt.Attributes.Add("class", "next disabled");
            //    lnkprv.Attributes.Add("class", "previous");
            //}
            //else if (!pgsource.IsLastPage)
            //{
            //    lnkprv.Attributes.Add("class", "previous disabled");
            //    lnknxt.Attributes.Add("class", "next");
            //}
            ////Enabled true Link button Next when curren;t page is not equal last page 
            ////Enabled false Link button Next when current page is last page
            //lnkNext.Enabled = !pgsource.IsLastPage;


            //Bind resulted PageSource into the Repeater
            rptrNews.DataSource = pgsource;
            rptrNews.DataBind();

            //Create Paging with help of DataList control "RepeaterPaging"
            doPaging();
            RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        }

        private void doPaging()
        {
            DataTable dt = new DataTable();
            //Add two column into the DataTable "dt" 
            //First Column store page index default it start from "0"
            //Second Column store page index default it start from "1"
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");

            //Assign First Index starts from which number in paging data list
            findex = CurrentPage - 5;

            //Set Last index value if current page less than 5 then last index added "5" values to the Current page else it set "10" for last page number
            if (CurrentPage > 5)
            {
                lindex = CurrentPage + 5;
            }
            else
            {
                lindex = 10;
            }

            //Check last page is greater than total page then reduced it to total no. of page is last index
            if (lindex > Convert.ToInt32(ViewState["totpage"]))
            {
                lindex = Convert.ToInt32(ViewState["totpage"]);
                findex = lindex - 10;
            }

            if (findex < 0)
            {
                findex = 0;
            }

            //Now creating page number based on above first and last page index
            for (int i = findex; i < lindex; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            //Finally bind it page numbers in to the Paging DataList "RepeaterPaging"
            RepeaterPaging.DataSource = dt;
            RepeaterPaging.DataBind();
        }

        private int CurrentPage
        {
            get
            {   //Check view state is null if null then return current index value as "0" else return specific page viewstate value
                if (ViewState["CurrentPage"] == null)
                {
                    return 0;
                }
                else
                {
                    return ((int)ViewState["CurrentPage"]);
                }
            }
            set
            {
                //Set View statevalue when page is changed through Paging "RepeaterPaging" DataList
                ViewState["CurrentPage"] = value;
            }
        }
       
        protected void RepeaterPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("newpage"))
            {
                //Assign CurrentPage number when user click on the page number in the Paging "RepeaterPaging" DataList
                CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
                //Refresh "Repeater1" control Data once user change page
                BindDataList();
            }
        }

        protected void RepeaterPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            //Enabled False for current selected Page index
            LinkButton lnkPage = (LinkButton)e.Item.FindControl("Pagingbtn");
            if (lnkPage.CommandArgument.ToString() == CurrentPage.ToString())
            {
                lnkPage.Enabled = false;
                lnkPage.BackColor = System.Drawing.Color.FromName("#1b1b1b");
                lnkPage.ForeColor = System.Drawing.Color.FromName("white");
            }
        }

    }
}