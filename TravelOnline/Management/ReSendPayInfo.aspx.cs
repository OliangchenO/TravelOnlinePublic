using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelOnline.Class.Common;
using TravelOnline.WeChat.Util;

namespace TravelOnline.Management
{
    public partial class ReSendPayInfo : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected override void GridView_DataBind()
        {
            string sqlstr = "select o.OrderId, o.OrderNums,o.OrderMobile, P.PayTime  from OL_Order o,OL_PayMent p where o.OrderId=p.OrderId and o.PayFlag=1 and o.LineID='25061' and CONVERT(VARCHAR(20),p.PayTime,120)>'2017-12-06 11:00:00' and CONVERT(VARCHAR(20),p.PayTime,120)<'2017-12-13 11:00:00' order by P.PayTime";
            DataSet DS = new DataSet();
            DS.Clear();
            DS = MyDataBaseComm.getDataSet(sqlstr);

            string sortExpression = this.GridView1.Attributes["SortExpression"];
            string sortDirection = this.GridView1.Attributes["SortDirection"];
            if ((!string.IsNullOrEmpty(sortExpression)) && (!string.IsNullOrEmpty(sortDirection)))
            {
                DS.Tables[0].DefaultView.Sort = string.Format("{0} {1}", sortExpression, sortDirection);
            }

            this.GridView1.DataSource = DS.Tables[0].DefaultView;
            this.GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        protected void GridView_Serch(object sender, EventArgs e)
        {
            this.GridView1.PageIndex = 0;
            this.GridView_DataBind();
        }
    }
}