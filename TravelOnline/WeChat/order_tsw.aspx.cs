using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelOnline.Class.Purchase;
using TravelOnline.WeChat.Util;

namespace TravelOnline.WeChat
{
    public partial class order_tsw : System.Web.UI.Page
    {
        public Guid ucode, Mobile;
        protected void Page_Load(object sender, EventArgs e)
        {
            ucode = System.Guid.NewGuid();
            Response.Cookies.Add(new HttpCookie("CheckCode", ""));
            string data = Request.QueryString["data"];
            JObject dataJson = Tuanshiwei.getDecodeAES(data);
            string Mobile = dataJson["Mobile"].ToString();
            if (Tuanshiwei.MobileValidate(Mobile))
            {
                Tuanshiwei.CheckPhone(Mobile);
            }
        }
    }
}