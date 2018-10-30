using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelOnline.NewPage.erp;

namespace TravelOnline.WeChat
{
    public partial class ErrorRepay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string payType = "";
            string ErpID = "";
            string total_fee = "";
            string transaction_id = "";
            //ErpUtil.savePayInfo(payType, ErpID, total_fee, transaction_id, transaction_id, "微信", DateTime.Now.ToString());
        }
    }
}