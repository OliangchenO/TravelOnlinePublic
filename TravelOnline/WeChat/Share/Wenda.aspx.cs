using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelOnline.WeChat.Share
{
    public partial class Wenda : System.Web.UI.Page
    {
        public string codehide = "hide", formhide="", choujiangCode="";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Online_UserId"]).Length <= 0)
            {
                Response.Redirect("/WeChat/WeiXinLogin.aspx?state=Wx_qa", true);
            }
            else
            {
                string code = MyDataBaseComm.getScalar(string.Format("Select id from ol_question where userid='{0}'", Convert.ToString(Session["Online_UserId"]).Trim()));
                if (code != null && !"".Equals(code))
                {
                    codehide = "";
                    choujiangCode = code;
                    formhide = "hide";
                }
            }
        }
    }
}