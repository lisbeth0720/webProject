using HuiFeng.BLL;
using HuiFeng.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Module.BankCall
{
    public partial class CallSystem : System.Web.UI.Page
    {
        public string username = "";
        CompanyManagerBLL bll = CompanyManagerBLL.CreateIns();
        CompanyManagerDAL dal = CompanyManagerDAL.CreateIns();
        public int WinID = 0;
        public int userid = 0;
        public string WinName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable table1 = HttpContext.Current.Session["Window"] as DataTable;
            if (table1 != null && table1.Rows.Count > 0)
            {
                WinID = int.Parse(table1.Rows[0]["ID"].ToString());
                WinName = BankCallBLL.SelectBankCallid(WinID).NameCh.ToString();
            }
            DataTable table = bll.IsLogin();
            if (table == null)
            {
                Response.Write("<script> window.location.href = 'Login.aspx';</script>");
                Response.End();
            }
            else
            {
                username = table.Rows[0]["username"].ToString();
                userid = int.Parse(table.Rows[0]["userid"].ToString());
            }
            //GetNumber();
        }

        public int number = 0;
        public int nums = 0;
        public string GetNumber()
        {
            string str = "";
            string name = "";
            DataTable table = BankCallBLL.GetDataTable(WinID);
            //string str1 = ConvertHelper<BankCallModel>.DataTable2Json(table);
            str += "<option value='综合业务' data-value='综合业务' id='span_a' title='综合业务'><a href='#' style='color:rgb(14, 127, 173);' >综合业务</a></option>";
            for (var i = 0; i < table.Rows.Count; i++)
            {
                name = table.Rows[i]["NameCh"].ToString();
                string oneid = BankCallBLL.BankCallNameCount(name).ID.ToString();
                number = int.Parse(BankCallBLL.CountNumber(oneid).ToString());
                //str += "<option id='span_a'  value=" + name + '-' + number + '人' + " data-value=" + name + '-' + number + '人' + "  title=" + name + '-' + number + '人' + "><a href='#'>" + name + '-' + number + '人' + "</a></option>";
                str += "<option id='span_a'  value=" + name + "-" + number + "人" + " data-value=" + name + "-" + number + "人" + "  title=" + name + "-" + number + "人" + "><a href='#'>" + name + "-" + number + "人" + "</a></option>";
                //GetAllNumber();
                nums = nums + number;
                //}
            }
            return str;
        }
    }
}