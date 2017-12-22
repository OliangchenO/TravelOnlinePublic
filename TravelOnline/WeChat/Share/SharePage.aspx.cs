using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TravelOnline.WeChat.jssdk;

namespace TravelOnline.WeChat.Share
{
    public partial class SharePage : System.Web.UI.Page
    {
        public string config;
        protected void Page_Load(object sender, EventArgs e)
        {
            string userAgent = Request.UserAgent;
            if (userAgent.ToLower().Contains("micromessenger"))
            {
                JsSDKTools tool = new JsSDKTools();
                config = tool.getSignPackage();
            }
        }
    }
}